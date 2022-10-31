CREATE TABLE "Users" (
  "id" SERIAL PRIMARY KEY,
  "name_user" varchar NOT NULL,
  "emai_user" varchar UNIQUE,
  "pass" varchar NOT NULL,
  "age" int
);

CREATE TABLE "Posts" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "id_author" int,
  "contents" varchar NOT NULL,
  "id_comentary" int
);

CREATE TABLE "Categorys" (
  "id" SERIAL PRIMARY KEY,
  "category" varchar
);

CREATE TABLE "Comentarys" (
  "id" SERIAL PRIMARY KEY,
  "comentary" varchar
);

CREATE TABLE "author" (
  "id" SERIAL PRIMARY KEY,
  "name_author" varchar NOT NULL
);

CREATE TABLE "rel_user_post" (
  "id" SERIAL PRIMARY KEY,
  "id_user" int NOT NULL,
  "id_post" int NOT NULL
);

CREATE TABLE "rel_post_category" (
  "id" SERIAL PRIMARY KEY,
  "id_post" int NOT NULL,
  "id_category" int NOT NULL
);

ALTER TABLE "rel_user_post" ADD FOREIGN KEY ("id_user") REFERENCES "Users" ("id");

ALTER TABLE "rel_user_post" ADD FOREIGN KEY ("id_post") REFERENCES "Posts" ("id");

ALTER TABLE "rel_post_category" ADD FOREIGN KEY ("id_post") REFERENCES "Posts" ("id");

ALTER TABLE "rel_post_category" ADD FOREIGN KEY ("id_category") REFERENCES "Categorys" ("id");

ALTER TABLE "Posts" ADD FOREIGN KEY ("id_comentary") REFERENCES "Comentarys" ("id");

ALTER TABLE "Posts" ADD FOREIGN KEY ("id_author") REFERENCES "author" ("id");

INSERT INTO "Users" (name_user, emai_user, pass, age)  values ('Cesar Adrian Lara Cavazos', 'cesar@gmail.com', '123', 25), 
('Guadalupe Deyanira Hernandez', 'lupe@gmail.com', '123', 25);

INSERT INTO author (name_author) values ('Franklin'), ('Rosbelth');

INSERT INTO "Comentarys" (comentary) values 
('"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."'), 
('"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."');

INSERT INTO "Posts" (title, description, id_author, contents, id_comentary) values 
('Comer Saludable', 'Las ventajas de comer saludable', 1, 'Lorem Ipsum', 1),
('Hacer ejercicio', 'Los beneficios del ejercicio', 2, 'Lorem Ipsum', 2);

INSERT INTO "Categorys" (category) values ('Salud'), ('Violencia'), ('Espectaculos'), ('Internacional');

INSERT INTO rel_user_post (id_user, id_post) values (1, 1), (1,2), (2, 2);

INSERT INTO rel_post_category (id_post, id_category) values (1, 1), (1, 3), (2, 1);