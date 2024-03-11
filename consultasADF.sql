-- CONSULTAS SIMPLES

-- Ejercicio 1
SELECT * FROM cliente 
WHERE nombre = 'Juan';

-- Ejercicio 2
SELECT correo FROM cliente 
WHERE correo LIKE '%hotmail%';


-- Ejercicio 3
SELECT * FROM cliente 
WHERE telefono LIKE '65%';

-- Ejercicio 4
SELECT * FROM talla 
WHERE tipo = 'mujer';

-- Ejercicio 5
SELECT * FROM talla 
WHERE busto > 90;

-- Ejercicio 6
SELECT * FROM talla 
WHERE tipo = 'mujer' AND cadera > 100;

-- Ejercicio 7
SELECT * FROM tienda 
WHERE telefono = '954410000';

-- Ejercicio 8
SELECT horario FROM tienda 
WHERE nombre = 'FACTORY DOS HERMANAS';

-- Ejercicio 9
SELECT * FROM modelo 
WHERE nombre = 'ALBA';

-- Ejercicio 10
SELECT * FROM modelo 
WHERE catalogo = 3;

-- Ejercicio 11
SELECT * FROM traje 
WHERE precio > 200;

-- Ejercicio 12
SELECT id_traje FROM traje 
WHERE color = 'Azul';

-- Ejercicio 13
SELECT id_traje, id_cliente
FROM compra 
WHERE importe > 500;

-- Ejercicio 14
SELECT id_traje
FROM compra c
WHERE cantidad > 1
ORDER BY fecha;



-- CONSULTAS COMPLEJAS



-- Ejercicio 1
SELECT t.*
FROM traje t
JOIN compra c ON t.id_traje = c.id_traje
WHERE c.id_cliente = 1;

-- Ejercicio 2
SELECT t.id_tienda, COUNT(*) AS total_trajes_vendidos
FROM traje t
JOIN compra c ON t.id_traje = c.id_traje
GROUP BY t.id_tienda;

-- Ejercicio 3
SELECT t.id_modelo, m.nombre, COUNT(*) AS modelo_mas_vendido
FROM traje t
JOIN compra c ON t.id_traje = c.id_traje
JOIN modelo m ON t.id_modelo = m.id_modelo
GROUP BY t.id_modelo
ORDER BY modelo_mas_vendido DESC
LIMIT 1;

-- Ejercicio 4
SELECT DISTINCT t.id_tienda, ta.id_talla AS tallas_disponibles
FROM traje t
JOIN talla ta ON t.id_talla =ta.id_talla
GROUP BY t.id_tienda;

-- Ejercicio 5
SELECT c.id_cliente, cli.telefono
FROM compra c
JOIN cliente cli ON c.id_cliente = cli.id_cliente
ORDER BY c.importe DESC
LIMIT 1;

-- Ejercicio 6
SELECT m.*
FROM modelo m
LEFT JOIN traje t ON m.id_modelo = t.id_modelo
WHERE t.id_modelo IS NULL;

-- Ejercicio 7
SELECT m.*
FROM modelo m
JOIN traje t ON m.id_modelo = t.id_modelo
JOIN compra c ON t.id_traje = c.id_traje
JOIN cliente cli ON c.id_cliente = cli.id_cliente
WHERE cli.nombre = 'Elena';









