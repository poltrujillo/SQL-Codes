-- -- 1- Mostra totes les regions del planeta i el nombre d'idiomes que es parlen a cada una d'elles ordenat alfabèticament pel nom de la regió. (group by i join)

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

SELECT c1.Name, cl1.Language FROM country AS c1, countrylanguage AS cl1
    WHERE c1.Code = cl1.CountryCode
        AND cl1.Percentage = (SELECT MAX(cl2.Percentage) FROM countrylanguage AS cl2 WHERE cl2.CountryCode = c1.Code)
        ORDER BY c1.Name, cl1.Language;

-- 5- Mostra el nom del país on hi ha la ciutat amb menys població. (subquery)

SELECT c1.Name FROM country AS c1
    WHERE c1.Code = (SELECT c2.CountryCode FROM city AS c2
        WHERE c2.Population = (SELECT MIN(c3.Population) FROM city AS c3));

-- 6- Mostra el nom (o noms) del país (o països) on es parlen el més idiomes. (group by per tal de contar el nombre d'idiomes diferents que es parlen per país i subquery per trobar el nom del país)

SELECT c1.Name FROM country AS c1
    WHERE c1.Code = (SELECT cl1.CountryCode FROM countrylanguage AS cl1
        WHERE cl1.Language = (SELECT cl2.Language FROM countrylanguage AS cl2
            WHERE cl2.CountryCode = cl1.CountryCode
                GROUP BY cl2.Language
                ORDER BY COUNT(cl2.Language) DESC
                LIMIT 1));

-- 7- Mostra els idiomes que es parlen en el país amb més superfície de terreny. (subquery)

SELECT cl1.Language FROM countrylanguage AS cl1
    WHERE cl1.CountryCode = (SELECT c1.Code FROM country AS c1
        WHERE c1.SurfaceArea = (SELECT MAX(c2.SurfaceArea) FROM country AS c2));

-- 8- Mostra el districte de ciutat on es parlen més idiomes. (subquery)



-- 9- Mostra el nom del país (o països) on es parlen més idiomes oficials. (subquery i join)



-- 10- Mostra el nom de totes les ciutats del país (o països) que es va independitzar fa més temps. (subquery)



-- 11- El districte amb més ciutats (subquery)



-- 12- Els paisos on totes les seves ciutats (de la nostra BBDD) tinguin mes de 200.000 habitants.



-- 13- Totes les ciutats del Carib (tot i que e spot fer sense subconsulta, pensa una forma de fer-ho amb subquerys).



-- 14- La suma de població per continent (group by).



-- 15- La ciutat més gran d'Europa.



-- 16- El continent amb més població i el seu número.



-- 17- El continent amb més ciutats  i el seu número.



-- 18- La regió amb un AVG d'habitants per país més gran.

