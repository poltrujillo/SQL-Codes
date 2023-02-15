-- 1- Mostra totes les regions del planeta i el nombre d'idiomes que es parlen a cada una d'elles ordenat alfabèticament pel nom de la regió. (group by i join)

SELECT c.Region, COUNT(cl.Language) AS num_lang FROM country AS c, countrylanguage AS cl
    WHERE c.Code = cl.CountryCode
        GROUP BY c.Region
        ORDER BY c.Region ASC;

-- 2- Mostrar el districte de la ciutat amb més població. (subquery)

SELECT c1.District, c1.Name FROM city AS c1
    WHERE c1.Population = (SELECT MAX(c2.Population) FROM city AS c2);

-- 3- Mostrar codi, nom i continent del país de mida més petita. (subquery)

SELECT c1.Code, c2.name, c1.continent FROM country AS c1
    WHERE c1.Population = (SELECT MAX(c2.Population) FROM city AS c2);

-- 4- Calcula l'idioma més parlat a cada país. Mostra nom de país i idioma ordenat per país i idioma. (group by i join entre countrylanguage i country

SELECT c.name, cl.language, cl.Percentage FROM country AS c, countrylanguage AS cl
    WHERE c.code = cl.CountryCode
        AND cl.Percentage = (SELECT MAX(c2.Percentage) FROM countrylanguage AS c2
        WHERE c2.CountryCode = cl.CountryCode)
    GROUP BY c.Code
    ORDER BY c.name, cl.Language;

-- 5- Mostra el nom del país on hi ha la ciutat amb menys població. (subquery)

SELECT c.Name FROM country AS c, city AS ci
    WHERE c.Code = ci.CountryCode AND ci.Population = 
    (SELECT MIN(ci2.Population) FROM city AS ci2);

-- 6- Mostra el nom (o noms) del país (o països) on es parlen el més idiomes. (group by per tal de contar el nombre d'idiomes diferents que es parlen per país i subquery per trobar el nom del país)

SELECT c.name FROM country AS c, countrylanguage AS co
	WHERE c.code = co.CountryCode
    GROUP BY c.code
    HAVING COUNT(co.language) =
    (SELECT COUNT(co2.language) FROM countrylanguage AS co2
     GROUP BY co2.CountryCode
     ORDER BY COUNT(co2.language) DESC LIMIT 1);

-- 7- Mostra els idiomes que es parlen en el país amb més superfície de terreny. (subquery)

SELECT co.language FROM countrylanguage AS co, country AS c
WHERE c.Code = co.CountryCode AND c.SurfaceArea =
(SELECT MAX(c2.surfacearea) FROM country AS c2);

SELECT co.language FROM countrylanguage AS co, country AS c
WHERE c.Code = co.CountryCode AND c.SurfaceArea >=
ALL(SELECT c2.surfacearea FROM country AS c2);

-- 8- Mostra el districte de ciutat on es parlen més idiomes. (subquery)

SELECT ci.district, ci.name FROM country AS c, countrylanguage AS co, city AS ci
	WHERE c.code = co.CountryCode AND ci.CountryCode = c.code
    GROUP BY ci.district
    HAVING COUNT(DISTINCT co.language) =
    (SELECT COUNT(DISTINCT co2.language) FROM countrylanguage AS co2, city AS ci2, country AS c2 WHERE co2.CountryCode=c2.Code AND ci2.CountryCode = c2.Code
     GROUP BY ci2.district
     ORDER BY COUNT(DISTINCT co2.language) DESC LIMIT 1);

-- 9- Mostra el nom del país (o països) on es parlen més idiomes oficials. (subquery i join)

SELECT c.name FROM country AS c, countrylanguage AS co
	WHERE c.code = co.CountryCode
    AND co.IsOfficial = 'T'
    GROUP BY c.code
    HAVING COUNT(co.language) =
    (SELECT COUNT(co2.language) FROM countrylanguage AS co2
     WHERE co2.IsOfficial = 'T'
     GROUP BY co2.CountryCode
     ORDER BY COUNT(co2.language) DESC LIMIT 1);

-- 10- Mostra el nom de totes les ciutats del país (o països) que es va independitzar fa més temps. (subquery)

SELECT ci.name FROM city AS ci, country AS c WHERE
	ci.CountryCode = c.Code AND
    c.indepyear = (SELECT MIN(c2.indepyear) FROM country AS c2);

-- 11- El districte amb més ciutats (subquery)

SELECT ci.district FROM city AS ci
    GROUP BY ci.district
    HAVING COUNT(ci.name) =
    (SELECT COUNT(ci2.name) FROM city AS ci2
     GROUP BY ci2.district
     ORDER BY COUNT(ci2.name) DESC LIMIT 1);

-- 12- Els paisos on totes les seves ciutats (de la nostra BBDD) tinguin mes de 200.000 habitants.

SELECT c.name FROM country AS c, city AS ci
    WHERE c.code = ci.CountryCode
    GROUP BY c.code
    HAVING COUNT(ci.name) =
    (SELECT COUNT(ci2.name) FROM city AS ci2
     WHERE ci2.Population > 200000
     GROUP BY ci2.CountryCode
     ORDER BY COUNT(ci2.name) DESC LIMIT 1);

-- 13- Totes les ciutats del Carib (tot i que e spot fer sense subconsulta, pensa una forma de fer-ho amb subquerys).

SELECT ci.* FROM city AS ci, country AS c
    WHERE ci.CountryCode = c.code AND c.Region = 'Caribbean';

SELECT ci.* FROM city as ci
    WHERE ci.CountryCode IN (SELECT)


-- 14- La suma de població per continent (group by).

SELECT c.continent, SUM(ci.Population) FROM city AS ci, country AS c
    WHERE ci.CountryCode = c.code
    GROUP BY c.continent;

-- 15- La ciutat més gran d'Europa.

SELECT ci.name FROM city AS ci, country AS c
    WHERE ci.CountryCode = c.code AND c.continent = 'Europe'
    ORDER BY ci.Population DESC LIMIT 1;

-- 16- El continent amb més població i el seu número.

SELECT c.continent, SUM(ci.Population) FROM city AS ci, country AS c
    WHERE ci.CountryCode = c.code
    GROUP BY c.continent
    ORDER BY SUM(ci.Population) DESC LIMIT 1;

-- 17- El continent amb més ciutats  i el seu número.

SELECT c.continent, COUNT(ci.name) FROM city AS ci, country AS c
    WHERE ci.CountryCode = c.code
    GROUP BY c.continent
    ORDER BY COUNT(ci.name) DESC LIMIT 1;

-- 18- La regió amb un AVG d'habitants per país més gran.

SELECT c.region, AVG(ci.Population) FROM city AS ci, country AS c
    WHERE ci.CountryCode = c.code
    GROUP BY c.region
    ORDER BY AVG(ci.Population) DESC LIMIT 1;

