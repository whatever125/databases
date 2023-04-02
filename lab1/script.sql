DROP TABLE IF EXISTS gender CASCADE;
DROP TABLE IF EXISTS person CASCADE;
DROP TABLE IF EXISTS parents CASCADE;
DROP TABLE IF EXISTS qualities CASCADE;
DROP TABLE IF EXISTS person_qualities CASCADE;
DROP TABLE IF EXISTS relationship_type CASCADE;
DROP TABLE IF EXISTS relationship CASCADE;
DROP TABLE IF EXISTS location CASCADE;
DROP TABLE IF EXISTS launch CASCADE;
DROP TABLE IF EXISTS launch_visitors CASCADE;

CREATE TABLE gender (
    name VARCHAR(255) PRIMARY KEY
);

CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    age INTEGER DEFAULT 0 CHECK (age >= 0),
    gender_id VARCHAR(255) REFERENCES gender(name) ON DELETE CASCADE NOT NULL
);

CREATE TABLE parents (
    child_id INTEGER PRIMARY KEY REFERENCES person(id) ON DELETE CASCADE,
    parent1_id INTEGER REFERENCES person(id) ON DELETE SET NULL,
    parent2_id INTEGER REFERENCES person(id) ON DELETE SET NULL,
    CHECK (parent1_id != parent2_id),
    CHECK (parent1_id != child_id),
    CHECK (parent2_id != child_id)
);

CREATE TABLE qualities (
    name VARCHAR(255) PRIMARY KEY
);

CREATE TABLE person_qualities (
    human_id INTEGER REFERENCES person(id) ON DELETE CASCADE NOT NULL,
    quality_id VARCHAR(255) REFERENCES qualities(name) ON DELETE CASCADE NOT NULL,
    PRIMARY KEY (human_id, quality_id)
);

CREATE TABLE relationship_type (
    name VARCHAR(255) PRIMARY KEY
);

CREATE TABLE relationship (
    id SERIAL PRIMARY KEY,
    type_id VARCHAR(255) REFERENCES relationship_type(name) ON DELETE CASCADE NOT NULL,
    person1_id INTEGER REFERENCES person(id) ON DELETE CASCADE NOT NULL,
    person2_id INTEGER REFERENCES person(id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE location (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    latitude NUMERIC DEFAULT 0 CHECK (latitude >= -90 AND latitude <= 90),
    longitude NUMERIC DEFAULT 0 CHECK (longitude >= -180 AND longitude <= 180)
);

CREATE TABLE launch (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    time TIME WITH TIME ZONE NOT NULL,
    location_id INTEGER REFERENCES location(id) ON DELETE CASCADE NOT NULL,
    responsible_person_id INTEGER REFERENCES person(id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE launch_visitors (
    launch_id INTEGER REFERENCES launch(id) ON DELETE CASCADE NOT NULL,
    person_id INTEGER REFERENCES person(id) ON DELETE CASCADE NOT NULL,
    PRIMARY KEY (launch_id, person_id)
);



INSERT INTO gender VALUES ('male');
INSERT INTO gender VALUES ('female');
INSERT INTO gender VALUES ('other');

INSERT INTO person (name, surname, age, gender_id) VALUES ('Мама', 'Смирнова', 40, 'female');
INSERT INTO person (name, surname, age, gender_id) VALUES ('Папа', 'Смирнов', 45, 'male');
INSERT INTO person (name, surname, age, gender_id) VALUES ('Дэвид', 'Смирнов', 16, 'male');
INSERT INTO person (name, surname, age, gender_id) VALUES ('Бобби', 'Смирнов', 17, 'male');
INSERT INTO person (name, surname, age, gender_id) VALUES ('Бэтти', 'Шульц', 17, 'female');
INSERT INTO person (name, surname, age, gender_id) VALUES ('Джон', 'До', 50, 'male');

INSERT INTO parents VALUES (3, 1, 2);
INSERT INTO parents VALUES (4, 1, 2);

INSERT INTO qualities VALUES ('уверенность');
INSERT INTO qualities VALUES ('глупость');
INSERT INTO qualities VALUES ('красота');

INSERT INTO person_qualities VALUES (4, 'уверенность');
INSERT INTO person_qualities VALUES (5, 'глупость');
INSERT INTO person_qualities VALUES (5, 'красота');

INSERT INTO relationship_type VALUES ('friend');
INSERT INTO relationship_type VALUES ('romantic');
INSERT INTO relationship_type VALUES ('marriage');

INSERT INTO relationship (type_id, person1_id, person2_id) VALUES ('marriage', 1, 2);
INSERT INTO relationship (type_id, person1_id, person2_id) VALUES ('romantic', 4, 5);
INSERT INTO relationship (type_id, person1_id, person2_id) VALUES ('friend', 3, 4);

INSERT INTO location (name, latitude, longitude) VALUES ('Байконур', 45.6167, 63.3167);

INSERT INTO launch (date, time, location_id, responsible_person_id) VALUES ('2023.03.16', '12:00', 1, 6);

INSERT INTO launch_visitors VALUES (1, 2);
INSERT INTO launch_visitors VALUES (1, 6);



ALTER TABLE launch DROP CONSTRAINT launch_location_id_fkey, ADD CONSTRAINT launch_location_id_fkey FOREIGN KEY (location_id) REFERENCES location(id) ON DELETE CASCADE;
