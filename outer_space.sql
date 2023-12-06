CREATE TABLE moons (
    moon character varying(50) NOT NULL,
    planet_id character varying(50) REFERENCES planets
);


--
-- Name: planets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE planets (
    planet character varying(50) NOT NULL,
    oribtal_period_in_years numeric NOT NULL,
    star_id character varying(50) NOT NULL,
    moon_id character varying(50)
);

--
-- Name: stars; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stars (
    star character varying(50) NOT NULL,
    temp_in_kelvin double precision NOT NULL
);

INSERT INTO planets (planet,oribtal_period_in_years,star_id,moon_id)
    VALUES
        ('earth', 1,'sun', 'moon'),
        ('jupiter', 4, 'sun', 'europa');

INSERT INTO moons (moon)
    VALUES
        ('moon'),
        ('europa'),
        ('io');

INSERT INTO stars (star,temp_in_kelvin)
    VALUES
        ('sun',5800);

SELECT
    planets.planet,
    stars.star,
    count(*)

    FROM stars
        JOIN planets ON stars.star = planets.star_id
        JOIN moons ON planets.moon_id = moons.moon
        GROUP BY planets.planet, stars.star;