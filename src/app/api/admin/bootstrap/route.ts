import { NextRequest, NextResponse } from "next/server";
import pool, { queryOne } from "@src/lib/db";
import { hashPassword } from "@src/lib/auth";
import { T } from "@src/lib/tables";

// GET /api/admin/bootstrap?secret=viddenave-admin-2024
// Creates all schema tables (idempotent) then seeds the super-admin account.
// Safe to run multiple times — all statements use IF NOT EXISTS / ON CONFLICT DO NOTHING.
export async function GET(req: NextRequest) {
  const secret = req.nextUrl.searchParams.get("secret");
  if (secret !== "viddenave-admin-2024") {
    return NextResponse.json({ message: "Forbidden" }, { status: 403 });
  }

  const client = await pool.connect();
  try {
    // ── 1. Create all tables with the correct prefix ──────────────
    await client.query(`
      CREATE TABLE IF NOT EXISTS ${T.users} (
        id                    SERIAL PRIMARY KEY,
        first_name            VARCHAR(100) NOT NULL DEFAULT '',
        last_name             VARCHAR(100) NOT NULL DEFAULT '',
        username              VARCHAR(100) UNIQUE NOT NULL,
        email                 VARCHAR(255) UNIQUE NOT NULL,
        password_hash         VARCHAR(255) NOT NULL,
        role                  VARCHAR(50)  NOT NULL DEFAULT 'customer',
        phone                 VARCHAR(50),
        address               TEXT,
        city                  VARCHAR(100),
        state                 VARCHAR(100),
        country               VARCHAR(100),
        postcode              VARCHAR(20),
        avatar_url            TEXT,
        is_verified           BOOLEAN NOT NULL DEFAULT false,
        verification_token    VARCHAR(255),
        reset_token           VARCHAR(255),
        reset_token_expires   TIMESTAMPTZ,
        created_at            TIMESTAMPTZ NOT NULL DEFAULT NOW(),
        updated_at            TIMESTAMPTZ NOT NULL DEFAULT NOW()
      );

      CREATE TABLE IF NOT EXISTS ${T.categories} (
        id          SERIAL PRIMARY KEY,
        name        VARCHAR(255) NOT NULL,
        slug        VARCHAR(255) UNIQUE NOT NULL,
        description TEXT,
        parent_id   INTEGER REFERENCES ${T.categories}(id) ON DELETE SET NULL,
        image_url   TEXT,
        count       INTEGER NOT NULL DEFAULT 0,
        created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
        updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
      );

      CREATE TABLE IF NOT EXISTS ${T.products} (
        id                SERIAL PRIMARY KEY,
        name              VARCHAR(500) NOT NULL,
        slug              VARCHAR(500) UNIQUE NOT NULL,
        sku               VARCHAR(255),
        description       TEXT,
        short_description TEXT,
        price             DECIMAL(14,2) NOT NULL DEFAULT 0,
        regular_price     DECIMAL(14,2),
        sale_price        DECIMAL(14,2),
        stock_status      VARCHAR(50)  NOT NULL DEFAULT 'instock',
        stock_quantity    INTEGER      NOT NULL DEFAULT 0,
        rating_count      INTEGER      NOT NULL DEFAULT 0,
        average_rating    DECIMAL(3,2) NOT NULL DEFAULT 0,
        status            VARCHAR(50)  NOT NULL DEFAULT 'publish',
        type              VARCHAR(50)  NOT NULL DEFAULT 'simple',
        created_at        TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
        updated_at        TIMESTAMPTZ  NOT NULL DEFAULT NOW()
      );

      CREATE TABLE IF NOT EXISTS ${T.productImages} (
        id          SERIAL PRIMARY KEY,
        product_id  INTEGER NOT NULL REFERENCES ${T.products}(id) ON DELETE CASCADE,
        src         TEXT NOT NULL,
        name        VARCHAR(255),
        alt         TEXT,
        position    INTEGER NOT NULL DEFAULT 0,
        created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
      );

      CREATE TABLE IF NOT EXISTS ${T.productCategories} (
        product_id   INTEGER NOT NULL REFERENCES ${T.products}(id)    ON DELETE CASCADE,
        category_id  INTEGER NOT NULL REFERENCES ${T.categories}(id)  ON DELETE CASCADE,
        PRIMARY KEY (product_id, category_id)
      );

      CREATE TABLE IF NOT EXISTS ${T.productAttributes} (
        id          SERIAL PRIMARY KEY,
        product_id  INTEGER NOT NULL REFERENCES ${T.products}(id) ON DELETE CASCADE,
        name        VARCHAR(255) NOT NULL,
        options     TEXT[]  NOT NULL DEFAULT '{}',
        position    INTEGER NOT NULL DEFAULT 0
      );

      CREATE TABLE IF NOT EXISTS ${T.orders} (
        id                    SERIAL PRIMARY KEY,
        customer_id           INTEGER REFERENCES ${T.users}(id) ON DELETE SET NULL,
        status                VARCHAR(50)    NOT NULL DEFAULT 'pending',
        currency              VARCHAR(10)    NOT NULL DEFAULT 'NGN',
        total                 DECIMAL(14,2)  NOT NULL DEFAULT 0,
        subtotal              DECIMAL(14,2)  NOT NULL DEFAULT 0,
        discount              DECIMAL(14,2)  NOT NULL DEFAULT 0,
        shipping_cost         DECIMAL(14,2)  NOT NULL DEFAULT 0,
        payment_method        VARCHAR(100),
        payment_method_title  VARCHAR(255),
        transaction_id        VARCHAR(255),
        shipping_option       VARCHAR(100),
        billing               JSONB  NOT NULL DEFAULT '{}',
        order_notes           TEXT,
        receipt_url           TEXT,
        created_at            TIMESTAMPTZ NOT NULL DEFAULT NOW(),
        updated_at            TIMESTAMPTZ NOT NULL DEFAULT NOW()
      );

      CREATE TABLE IF NOT EXISTS ${T.orderItems} (
        id          SERIAL PRIMARY KEY,
        order_id    INTEGER NOT NULL REFERENCES ${T.orders}(id) ON DELETE CASCADE,
        product_id  INTEGER REFERENCES ${T.products}(id) ON DELETE SET NULL,
        name        VARCHAR(500) NOT NULL,
        quantity    INTEGER      NOT NULL DEFAULT 1,
        price       DECIMAL(14,2) NOT NULL,
        total       DECIMAL(14,2) NOT NULL,
        image_url   TEXT,
        created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
      );

      CREATE TABLE IF NOT EXISTS ${T.paylaterRequests} (
        id          SERIAL PRIMARY KEY,
        customer_id INTEGER REFERENCES ${T.users}(id)    ON DELETE CASCADE,
        product_id  INTEGER REFERENCES ${T.products}(id) ON DELETE SET NULL,
        status      VARCHAR(50) NOT NULL DEFAULT 'pending',
        payment     JSONB NOT NULL DEFAULT '[]',
        created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
        updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
      );

      CREATE TABLE IF NOT EXISTS ${T.banners} (
        id          SERIAL PRIMARY KEY,
        name        VARCHAR(255),
        image_url   TEXT NOT NULL,
        url         TEXT,
        show        BOOLEAN NOT NULL DEFAULT true,
        created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
        updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
      );

      CREATE TABLE IF NOT EXISTS ${T.globalSettings} (
        id          SERIAL PRIMARY KEY,
        key         VARCHAR(255) UNIQUE NOT NULL,
        value       TEXT,
        created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
        updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
      );

      CREATE TABLE IF NOT EXISTS ${T.reviews} (
        id          SERIAL PRIMARY KEY,
        product_id  INTEGER NOT NULL REFERENCES ${T.products}(id) ON DELETE CASCADE,
        reviewer    VARCHAR(255) NOT NULL,
        email       VARCHAR(255),
        rating      INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
        comment     TEXT NOT NULL,
        verified    BOOLEAN NOT NULL DEFAULT false,
        created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
      );

      CREATE INDEX IF NOT EXISTS idx_${T.products}_status       ON ${T.products}(status);
      CREATE INDEX IF NOT EXISTS idx_${T.products}_stock        ON ${T.products}(stock_status);
      CREATE INDEX IF NOT EXISTS idx_${T.productImages}_pid     ON ${T.productImages}(product_id, position);
      CREATE INDEX IF NOT EXISTS idx_${T.productCategories}_pid ON ${T.productCategories}(product_id);
      CREATE INDEX IF NOT EXISTS idx_${T.productCategories}_cid ON ${T.productCategories}(category_id);
      CREATE INDEX IF NOT EXISTS idx_${T.orders}_customer       ON ${T.orders}(customer_id);
      CREATE INDEX IF NOT EXISTS idx_${T.orders}_status         ON ${T.orders}(status);
      CREATE INDEX IF NOT EXISTS idx_${T.orderItems}_order      ON ${T.orderItems}(order_id);
      CREATE INDEX IF NOT EXISTS idx_${T.categories}_parent     ON ${T.categories}(parent_id);
      CREATE INDEX IF NOT EXISTS idx_${T.categories}_slug       ON ${T.categories}(slug);
      CREATE INDEX IF NOT EXISTS idx_${T.reviews}_product       ON ${T.reviews}(product_id);

      INSERT INTO ${T.globalSettings} (key, value) VALUES
        ('shop_name',                   'Viddenave'),
        ('company_name',                'Viddenave Digital'),
        ('address',                     'Nigeria'),
        ('email',                       'support@viddenave.com'),
        ('contact',                     ''),
        ('website',                     'https://viddenave.com'),
        ('default_currency',            'NGN'),
        ('default_time_zone',           'Africa/Lagos'),
        ('default_date_format',         'DD-MM-YYYY'),
        ('vat_number',                  ''),
        ('post_code',                   ''),
        ('receipt_size',                'A4'),
        ('percentage',                  '0'),
        ('number_of_image_per_product', '5')
      ON CONFLICT (key) DO NOTHING;
    `);

    // ── 2. Create super-admin account ────────────────────────────
    const existing = await queryOne<any>(
      `SELECT id FROM ${T.users} WHERE email = $1`,
      ["admin@gmail.com"],
    );

    if (existing) {
      return NextResponse.json({ message: "Schema ready. Super admin already exists", id: existing.id });
    }

    const hash = await hashPassword("admin");
    const admin = await queryOne<any>(
      `INSERT INTO ${T.users}
       (username, email, password_hash, first_name, last_name, role, is_verified, created_at, updated_at)
       VALUES ($1, $2, $3, $4, $5, 'admin', true, NOW(), NOW())
       RETURNING id, username, email, role`,
      ["superadmin", "admin@gmail.com", hash, "Super", "Admin"],
    );

    return NextResponse.json({ message: "Schema created and super admin seeded successfully", admin });
  } catch (error: any) {
    console.error("Bootstrap error:", error);
    return NextResponse.json({ message: "Failed", error: error.message }, { status: 500 });
  } finally {
    client.release();
  }
}
