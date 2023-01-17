USE tienda; 

-- 1. Llista el nom de tots els productes que hi ha en la taula producto: 
SELECT nombre AS 'Nom' FROM producto; 

-- 2. Llista els noms i els preus de tots els productes de la taula producto: 
SELECT nombre AS 'Nom', precio AS 'Preu' FROM producto; 

-- 3. Llista totes les columnes de la taula producto:
SELECT * FROM producto; 

-- 4. Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD): 
SELECT nombre, precio, ROUND(precio * 1.08, 2) AS 'precio en $' FROM producto; 
 
-- 5. Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars:
SELECT nombre AS 'Nom del producte', precio AS 'Preu en euros', ROUND(precio * 1.08, 2) AS 'Preu en dòlars' FROM producto; 

-- 6. Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula: 
SELECT UPPER(nombre) AS 'Nom', precio AS 'Preu' FROM producto; 

-- 7. Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula:
SELECT LOWER(nombre) AS 'Nom', precio AS 'Preu' FROM producto; 

-- 8. Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant: 
SELECT nombre AS 'Nom', left(UPPER(nombre), 2) AS 'Nom 2' FROM fabricante; 

-- 9. Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu: 
SELECT nombre AS 'Nom', ROUND(precio) AS 'Preu arrodonit' FROM producto; 

-- 10. Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal:
SELECT nombre AS 'Nom', TRUNCATE(precio, 0) AS 'Preu' FROM producto; 

-- 11. Llista el codi dels fabricants que tenen productes en la taula producto: 
SELECT f.codigo AS 'Codi fabricant', p.nombre AS 'Producte' FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante ORDER BY f.codigo; 

-- 12. Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits: 
SELECT DISTINCT f.codigo AS 'Codi fabricant' FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante ORDER BY f.codigo; 

-- 13. Llista els noms dels fabricants ordenats de manera ascendent:
SELECT nombre AS 'Nom' FROM fabricante ORDER BY nombre; 

-- 14. Llista els noms dels fabricants ordenats de manera descendent:
SELECT nombre AS 'Nom' FROM fabricante ORDER BY nombre DESC; 

-- 15. Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent: 
SELECT nombre AS 'Nom', precio AS 'Preu' FROM producto ORDER BY nombre AND precio DESC; 

-- 16. Retorna una llista amb les 5 primeres files de la taula fabricante: 
SELECT codigo AS 'Codi', nombre AS 'Nom' FROM fabricante LIMIT 5; 

-- 17. Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta: 
SELECT codigo AS 'Codi', nombre AS 'Nom' FROM fabricante LIMIT 3, 2;  

-- 18. Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY: 
SELECT nombre AS 'Nom', precio AS 'Preu' FROM producto ORDER BY precio LIMIT 1; 

-- 19. Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY:
SELECT nombre AS 'Nom', precio AS 'Preu' FROM producto ORDER BY precio DESC LIMIT 1; 

-- 20. Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2: 
SELECT nombre AS 'Nom' FROM producto WHERE codigo_fabricante = 2; 

-- 21. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades:
SELECT p.nombre AS 'Nom del producte', p.precio AS 'Preu', f.nombre AS 'Nom del fabricant' FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante; 

-- 22. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic: 
SELECT p.nombre AS 'Nom del producte', p.precio AS 'Preu', f.nombre AS 'Nom del fabricant' FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante ORDER BY f.nombre DESC; 

-- 23. Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades: 
SELECT p.codigo AS 'Codi del producte', p.nombre AS 'Nom del producte', f.codigo AS 'Codi del fabricador', f.nombre AS 'Nom del fabricador' FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante; 

-- 24. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat:
SELECT p.nombre AS 'Nom del producte', p.precio AS 'Preu', f.nombre AS 'Nom del fabricant' FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante ORDER BY p.precio LIMIT 1;  

-- 25. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car: 
SELECT p.nombre AS 'Nom del producte', p.precio AS 'Preu', f.nombre AS 'Nom del fabricant' FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante ORDER BY p.precio DESC LIMIT 1; 

-- 26. Retorna una llista de tots els productes del fabricant Lenovo: 
SELECT p.nombre AS 'Nom del producte', f.nombre AS 'Nom del fabricant' FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo';

-- 27. Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €: 
SELECT p.nombre AS 'Nom del producte',  f.nombre AS 'Nom del fabricant', p.precio AS 'Preu' FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Crucial' AND precio > 200; 

-- 28. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Sense utilitzar l'operador IN: 
SELECT p.nombre AS 'Nom del producte', f.nombre AS 'Nom del fabricant' FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate'; 

-- 29. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Fent servir l'operador IN: 
SELECT p.nombre AS 'Nom del producte', f.nombre AS 'Nom del fabricant' FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate'); 

-- 30. Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e: 
SELECT p.nombre AS 'Nom del producte', p.precio AS 'Preu', f.nombre AS 'Nom del fabricant' FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre LIKE '%e'; 

-- 31. Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom: 
SELECT p.nombre AS 'Nom del producte', p.precio AS 'Preu', f.nombre AS 'Nom del fabricant' FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre LIKE '%w%'; 

-- 32. Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent): 
SELECT p.nombre AS 'Nom del producte', p.precio AS 'Preu', f.nombre AS 'Nom del fabricant' FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre; 

-- 33. Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades: 
SELECT DISTINCT f.codigo AS 'Codi', f.nombre AS 'Nom' FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.codigo = p.codigo_fabricante; 

-- 34. Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats: 
SELECT f.nombre AS 'Nom del fabricant', p.nombre AS 'Nom del producte' FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante; 

-- 35. Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat: 
SELECT f.nombre AS 'Nom del fabricant', p.nombre AS 'Nom del producte' FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.nombre IS NULL; 

-- 36. Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN): 
SELECT p.nombre AS 'Nom del producte', f.nombre AS 'Nom del fabricant' FROM producto p LEFT JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo'; 

-- 37. Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN): 
SELECT p.codigo AS 'Codi del producte', p.nombre AS 'Nom del producte', p.precio AS 'Preu', p.codigo_fabricante AS 'Codi del fabricant' FROM producto p LEFT JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE p.precio = (SELECT MAX(p.precio) FROM producto p LEFT JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo');  

-- 38. Llista el nom del producte més car del fabricant Lenovo: 
SELECT p.nombre AS 'Nom del producte' FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE p.precio = (SELECT MAX(p.precio) FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo'); 

-- 39. Llista el nom del producte més barat del fabricant Hewlett-Packard: 
SELECT p.nombre AS 'Nom del producte' FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE p.precio = (SELECT MIN(p.precio) FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Hewlett-Packard'); 

-- 40. Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo: 
SELECT p.nombre AS 'Nom del producte', p.precio AS 'Preu' FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE p.precio >= (SELECT MAX(p.precio) FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo'); 

-- 41. Llista tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes: 
SELECT p.nombre AS 'Nom del producte', f.nombre AS 'Nom del fabricant', p.precio AS 'Preu' FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE p.precio > (SELECT AVG(p.precio) FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Asus') AND f.nombre = 'Asus'; 



