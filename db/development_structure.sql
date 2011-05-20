CREATE TABLE "messages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "body" text, "created_at" datetime, "updated_at" datetime, "user_id" integer);
CREATE TABLE "replies" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "body" text, "message_id" integer, "created_at" datetime, "updated_at" datetime, "user_id" integer);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255), "name" varchar(255), "password" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20110505120112');

INSERT INTO schema_migrations (version) VALUES ('20110506045406');

INSERT INTO schema_migrations (version) VALUES ('20110520035233');

INSERT INTO schema_migrations (version) VALUES ('20110520045122');