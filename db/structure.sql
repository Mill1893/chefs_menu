CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime(6), "remember_created_at" datetime(6), "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "role" varchar /*application='ChefsMenu'*/);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email") /*application='ChefsMenu'*/;
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token") /*application='ChefsMenu'*/;
CREATE TABLE IF NOT EXISTS "menu_items" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "description" text, "category" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "ingredients" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "quantity" varchar, "menu_item_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_ff9aed5a71"
FOREIGN KEY ("menu_item_id")
  REFERENCES "menu_items" ("id")
);
CREATE INDEX "index_ingredients_on_menu_item_id" ON "ingredients" ("menu_item_id") /*application='ChefsMenu'*/;
CREATE TABLE IF NOT EXISTS "daily_menus" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "date" date, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "daily_menu_items" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "description" text, "category" varchar, "daily_menu_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_e0d136db14"
FOREIGN KEY ("daily_menu_id")
  REFERENCES "daily_menus" ("id")
);
CREATE INDEX "index_daily_menu_items_on_daily_menu_id" ON "daily_menu_items" ("daily_menu_id") /*application='ChefsMenu'*/;
CREATE TABLE IF NOT EXISTS "grocery_lists" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "daily_menu_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_54febd2941"
FOREIGN KEY ("daily_menu_id")
  REFERENCES "daily_menus" ("id")
);
CREATE INDEX "index_grocery_lists_on_daily_menu_id" ON "grocery_lists" ("daily_menu_id") /*application='ChefsMenu'*/;
INSERT INTO "schema_migrations" (version) VALUES
('20250727194709'),
('20250727194648'),
('20250727194647'),
('20250727194646'),
('20250727194645'),
('20250727194644'),
('20250727194611');

