CREATE TYPE "PermType" AS ENUM (
  'ManageBook',
  'CreateBook',
  'ManageUsers'
);

CREATE TABLE "permgroups" (
  "id" serial PRIMARY KEY,
  "name" varchar(128) UNIQUE NOT NULL,
  "permissions" "PermType"[] NOT NULL
);

CREATE TABLE "books" (
  "id" bigserial PRIMARY KEY,
  "author_id" bigint NOT NULL,
  "published" bool NOT NULL DEFAULT false,
  "title" text NOT NULL,
  "subtitle" text,
  "ch_count" smallint NOT NULL DEFAULT 0,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "published_books" (
  "book_id" bigint NOT NULL,
  "author_id" bigint NOT NULL,
  "is_published" bool NOT NULL DEFAULT false,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "tags" (
  "id" bigserial PRIMARY KEY,
  "name" varchar(30) NOT NULL
);

CREATE TABLE "book_tags" (
  "book_id" bigint NOT NULL,
  "tag_id" bigint NOT NULL
);

CREATE TABLE "chapters" (
  "id" bigserial PRIMARY KEY,
  "book_id" bigint NOT NULL,
  "name" text NOT NULL,
  "content" text,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "genders" (
  "id" smallserial PRIMARY KEY,
  "gender_name" varchar(15) NOT NULL
);

CREATE TABLE "inspirations" (
  "id" smallserial PRIMARY KEY,
  "insp_name" varchar(30) NOT NULL
);

CREATE TABLE "author_levels" (
  "id" smallserial PRIMARY KEY,
  "level_name" varchar(20) NOT NULL
);

CREATE TABLE "author_titles" (
  "id" smallserial PRIMARY KEY,
  "genre_id" smallint NOT NULL,
  "title" text NOT NULL
);

CREATE TABLE "users" (
  "id" bigserial PRIMARY KEY,
  "permgroup_id" int NOT NULL DEFAULT 1,
  "name" text NOT NULL,
  "middle_name" text,
  "surname" text,
  "username" text UNIQUE NOT NULL,
  "email" text UNIQUE NOT NULL,
  "password_hash" text NOT NULL,
  "gender_id" smallint NOT NULL,
  "inspiration_id" smallint NOT NULL,
  "level_id" smallint NOT NULL,
  "title_id" smallint NOT NULL,
  "bio" text,
  "favorite_author" text,
  "favorite_book" text,
  "last_visited" timestamptz NOT NULL DEFAULT (now()),
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "author_type_id" smallint
);

CREATE TABLE "genres" (
  "id" smallserial PRIMARY KEY,
  "genre_name" varchar(50) NOT NULL
);

CREATE TABLE "author_types" (
  "id" smallserial PRIMARY KEY,
  "genre_id" smallint NOT NULL,
  "type_name" text NOT NULL
);

CREATE TABLE "follows" (
  "follower_id" bigint NOT NULL,
  "following_id" bigint NOT NULL,
  "is_followed" bool NOT NULL DEFAULT false,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "characters" (
  "id" bigserial PRIMARY KEY,
  "book_id" bigint NOT NULL,
  "description" text,
  "age" text,
  "gender" text,
  "date_of_birth" text,
  "job" text,
  "job_satisfaction" text,
  "health" text,
  "relationships" text,
  "pets" text,
  "world" text,
  "area_of_residence" text,
  "neighbourhood" text,
  "home_description" text,
  "height" text,
  "weight" text,
  "ethnicity" text,
  "skin_tone" text,
  "eye_color" text,
  "distinguish_feature" text,
  "other_facial_features" text,
  "hairstyle" text,
  "body_type" text,
  "clothing_style" text,
  "accessories" text,
  "skills" text,
  "incompetence" text,
  "talent" text,
  "weakness" text,
  "hobbies" text,
  "habits" text,
  "moral" text,
  "self_control" text,
  "motivation" text,
  "discouragement" text,
  "confidance_level" text,
  "greatest_fear" text,
  "childhood" text,
  "important_past_events" text,
  "best_accomplishment" text,
  "other_accomplishment" text,
  "failure" text,
  "secrets" text,
  "best_memories" text,
  "worst_memories" text,
  "story_role" text,
  "short_term_goals" text,
  "long_term_goals" text
);

CREATE TABLE "species" (
  "id" bigserial PRIMARY KEY,
  "book_id" bigint NOT NULL,
  "description" text,
  "lifespan" text,
  "height" text,
  "weight" text,
  "diet" text,
  "skills_abilities" text,
  "weakness" text,
  "view_on_mortals" text,
  "physical_description" text,
  "mental_description" text,
  "common_locations" text,
  "habitats" text,
  "reproduction" text,
  "growth_stages" text,
  "major_stages" text,
  "major_ethnic_groups" text,
  "origin" text,
  "history" text,
  "religious_connections" text,
  "common_cultural_influences" text
);

CREATE TABLE "items" (
  "id" bigserial PRIMARY KEY,
  "book_id" bigint NOT NULL,
  "description" text,
  "purpose" text,
  "special_abilities_properties" text,
  "collection" text,
  "production" text,
  "composition" text,
  "value" text,
  "rarity" text,
  "occurence" text,
  "detection_methods" text,
  "armaments" text,
  "defense" text,
  "other_equipment" text,
  "history" text,
  "origin" text,
  "notable_owners" text
);

CREATE TABLE "notes" (
  "id" bigserial PRIMARY KEY,
  "book_id" bigint NOT NULL,
  "name" text NOT NULL,
  "content" text,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "permgroups" ("name");

CREATE UNIQUE INDEX ON "published_books" ("book_id", "author_id");

CREATE UNIQUE INDEX ON "book_tags" ("book_id", "tag_id");

CREATE INDEX ON "users" ("email");

CREATE UNIQUE INDEX ON "follows" ("follower_id", "following_id");

ALTER TABLE "books" ADD FOREIGN KEY ("author_id") REFERENCES "users" ("id") ON DELETE CASCADE;

ALTER TABLE "published_books" ADD FOREIGN KEY ("author_id") REFERENCES "users" ("id") ON DELETE CASCADE;

ALTER TABLE "published_books" ADD FOREIGN KEY ("book_id") REFERENCES "books" ("id") ON DELETE CASCADE;

ALTER TABLE "book_tags" ADD FOREIGN KEY ("book_id") REFERENCES "books" ("id") ON DELETE CASCADE;

ALTER TABLE "book_tags" ADD FOREIGN KEY ("tag_id") REFERENCES "tags" ("id") ON DELETE CASCADE;

ALTER TABLE "chapters" ADD FOREIGN KEY ("book_id") REFERENCES "books" ("id") ON DELETE CASCADE;

ALTER TABLE "author_titles" ADD FOREIGN KEY ("genre_id") REFERENCES "genres" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("gender_id") REFERENCES "genders" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("inspiration_id") REFERENCES "inspirations" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("level_id") REFERENCES "author_levels" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("title_id") REFERENCES "author_titles" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("permgroup_id") REFERENCES "permgroups" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("author_type_id") REFERENCES "author_types" ("id");

ALTER TABLE "follows" ADD FOREIGN KEY ("follower_id") REFERENCES "users" ("id") ON DELETE CASCADE;

ALTER TABLE "follows" ADD FOREIGN KEY ("following_id") REFERENCES "users" ("id") ON DELETE CASCADE;

ALTER TABLE "characters" ADD FOREIGN KEY ("book_id") REFERENCES "books" ("id") ON DELETE CASCADE;

ALTER TABLE "species" ADD FOREIGN KEY ("book_id") REFERENCES "books" ("id") ON DELETE CASCADE;

ALTER TABLE "items" ADD FOREIGN KEY ("book_id") REFERENCES "books" ("id") ON DELETE CASCADE;