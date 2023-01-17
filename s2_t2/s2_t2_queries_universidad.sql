USE universidad; 

-- 1. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom:
SELECT apellido1 AS 'Primer cognom', apellido2 AS 'Segon cognom', nombre AS 'Nom' FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2 AND nombre; 

-- 2. Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades: 
SELECT nombre AS 'Nom', apellido1 AS 'Primer cognom', apellido2 AS 'Segon cognom' FROM persona WHERE tipo = 'alumno' AND telefono IS NULL; 

-- 3. Retorna el llistat dels alumnes que van néixer en 1999: 
SELECT * FROM persona WHERE YEAR(fecha_nacimiento) = 1999; 

-- 4. Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K: 
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%k'; 

-- 5. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7: 
SELECT nombre AS 'Nom assignatura', cuatrimestre AS 'Quatrimestre', curso AS 'Curs', id_grado AS 'Codi grau' FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7; 

-- 6. Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom:
SELECT p.apellido1 AS 'Primer cognom', p.apellido2 AS 'Segon cognom', p.nombre AS 'Nom professor/a', d.nombre AS 'Nom departament' FROM persona p JOIN departamento d JOIN profesor pr ON p.id = pr.id_profesor AND d.id = pr.id_departamento WHERE p.tipo = 'profesor' ORDER BY p.apellido1, p.apellido2 AND p.nombre; 

-- 7. Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M: 
SELECT a.nombre AS 'Nom assignatura', c.anyo_inicio AS 'Any inici', c.anyo_fin AS 'Any final', p.nif AS 'NIF' FROM asignatura a JOIN curso_escolar c JOIN persona p JOIN alumno_se_matricula_asignatura al ON p.id = al.id_alumno AND al.id_asignatura = a.id AND c.id = al.id_curso_escolar WHERE p.nif = '26902806M'; 

-- 8. Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015): 
SELECT DISTINCT d.nombre AS 'Nom departament' FROM departamento d JOIN profesor pr JOIN asignatura a JOIN grado g ON pr.id_profesor = a.id_profesor AND d.id = pr.id_departamento AND g.id = a.id_grado WHERE g.nombre = 'Grado en Ingenieria Informática (Plan 2015)'; 

-- 9. Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019: 
SELECT DISTINCT p.* FROM persona p JOIN asignatura a JOIN alumno_se_matricula_asignatura al JOIN curso_escolar c ON c.id = al.id_curso_escolar AND p.id = al.id_alumno AND a.id = al.id_asignatura WHERE c.anyo_inicio = 2018 AND c.anyo_fin = 2019;  

-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN: 
-- 1. Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom:
SELECT d.nombre AS 'Nom departament', p.apellido1 AS 'Primer cognom', p.apellido2 AS 'Segon cognom', p.nombre AS 'Nom professor' FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON d.id = pr.id_departamento WHERE p.tipo = 'profesor' ORDER BY d.nombre, p.apellido1, p.apellido2 AND p.nombre; 

-- 2. Retorna un llistat amb els professors/es que no estan associats a un departament: 
SELECT p.nombre AS 'Nom professor' FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor WHERE p.tipo = 'profesor' AND pr.id_departamento IS NULL; 

-- 3. Retorna un llistat amb els departaments que no tenen professors/es associats: 
SELECT d.nombre AS 'Nom departament' FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento WHERE pr.id_departamento IS NULL; 

-- 4. Retorna un llistat amb els professors/es que no imparteixen cap assignatura: 
SELECT p.nombre AS 'Nom professor' FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE p.tipo = 'profesor' AND a.nombre IS NULL;  

-- 5. Retorna un llistat amb les assignatures que no tenen un professor/a assignat: 
SELECT a.nombre AS 'Nom assignatura' FROM asignatura a LEFT JOIN profesor pr ON pr.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL; 

-- 6. Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar: 
SELECT DISTINCT d.nombre AS 'Nom departament' FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.curso IS NULL; 

-- Consultes resum:
-- 1. Retorna el nombre total d'alumnes que hi ha: 
SELECT COUNT(*) AS 'Nombre total alumnes' FROM persona p WHERE p.tipo = 'alumno'; 

-- 2. Calcula quants alumnes van néixer en 1999: 
SELECT COUNT(*) AS 'Alumnes nascuts al 1999' FROM persona p WHERE YEAR(fecha_nacimiento) = 1999; 

-- 3. Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es: 
SELECT d.nombre AS 'Nom departament', COUNT(pr.id_profesor) AS 'Número de professors' FROM departamento d JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.nombre ORDER BY COUNT(pr.id_profesor) DESC; 

-- 4. Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat:
SELECT d.nombre AS 'Nom departament', COUNT(pr.id_profesor) AS 'Número de professors' FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.nombre; 

-- 5. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures: 
SELECT DISTINCT g.nombre AS 'Nom grau', COUNT(a.nombre) AS "Número d'assignatures" FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY COUNT(a.nombre) DESC;

-- 6. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades: 
SELECT g.nombre AS 'Nom grau', COUNT(a.nombre) AS "Número d'assignatures" FROM grado g JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING COUNT(a.nombre) > 40; 

-- 7. Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus:
SELECT g.nombre AS 'Nom del grau', a.tipo AS "Tipus d'assignatura", SUM(a.creditos) AS 'Total de crèdits' FROM grado g JOIN asignatura a ON g.id = a.id_grado GROUP BY a.tipo, g.nombre; 

-- 8. Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats: 
SELECT c.anyo_inicio AS "Any d'inici curs", COUNT(al.id_alumno) AS "Número d'alumnes matriculats" FROM curso_escolar c LEFT JOIN alumno_se_matricula_asignatura al ON al.id_curso_escolar = c.id LEFT JOIN asignatura a ON a.id = al.id_asignatura GROUP BY c.anyo_inicio; 

-- 9. Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures:
SELECT p.id AS 'ID profesor', p.nombre AS 'Nom', p.apellido1 AS 'Primer cognom', p.apellido2 AS 'Segon cognom', COUNT(a.nombre) AS "Número d'assignatures" FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor WHERE p.tipo = 'profesor' GROUP BY p.id ORDER BY COUNT(a.nombre) DESC; 
 
-- 10. Retorna totes les dades de l'alumne/a més jove: 
SELECT p.* FROM persona p WHERE p.tipo = 'alumno' AND p.fecha_nacimiento = (SELECT MAX(p.fecha_nacimiento) FROM persona p); 

-- 11. Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura: 
SELECT p.nombre AS 'Nom professor', d.nombre AS 'Nom departament', a.nombre AS 'Nom assignatura' FROM persona p LEFT JOIN profesor pr ON pr.id_profesor = p.id LEFT JOIN departamento d ON d.id = pr.id_departamento LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor WHERE pr.id_departamento IS NOT NULL AND a.id_profesor IS NULL; 




