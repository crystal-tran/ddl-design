CREATE TABLE moons (
    name character varying(50) NOT NULL PRIMARY KEY,
    planet_name character varying(50) REFERENCES planets
);


--
-- Name: planets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE planets (
    name character varying(50) NOT NULL PRIMARY KEY,
    oribtal_period_in_years numeric NOT NULL,
    star_name character varying(50) NOT NULL
);

--
-- Name: stars; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stars (
    name character varying(50) NOT NULL PRIMARY KEY,
    temp_in_kelvin double precision NOT NULL
);

INSERT INTO planets (name,oribtal_period_in_years,star_name)
    VALUES
        ('Earth', 1.00 ,'The Sun'),
        ('Mars', 1.882, 'The Sun'),
        ('Venus', 0.62, 'The Sun'),
        ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
        ('Gliese 876 b', 0.236, 'Gliese 876');

INSERT INTO moons (name, planet_name)
    VALUES
        ('The Moon', 'Earth'),
        ('Phobos', 'Mars'),
        ('Deimos', 'Mars');

INSERT INTO stars (name, temp_in_kelvin)
    VALUES
        ('The Sun',5800),
        ('Proxima Centauri', 3042),
        ('Gliese 876', 3192);

SELECT
    planets.name,
    stars.name,
    moons.name,
    count(moons.name) AS moon_count

    FROM planets
        LEFT JOIN stars ON stars.name = planets.star_name
        LEFT JOIN moons ON moons.planet_name = planets.name
    GROUP BY stars.name, planets.name
    ORDER BY planets.name;


