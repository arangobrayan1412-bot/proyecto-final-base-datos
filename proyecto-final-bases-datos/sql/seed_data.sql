INSERT INTO clientes (nombre, telefono, email) VALUES
('Carlos Mendoza', '3001234567', 'carlos@gmail.com'),
('Laura Gómez', '3119876543', 'laura@gmail.com');

INSERT INTO canchas (nombre, tipo, precio_hora) VALUES
('Cancha 1 (Fútbol 5)', 'Sintética 5x5', 80000.00),
('Cancha 2 (Fútbol 8)', 'Sintética 8x8', 140000.00);

INSERT INTO reservas (cliente_id, cancha_id, fecha, hora_inicio, hora_fin) VALUES
(1, 1, '2026-09-10', '18:00', '19:00'),
(2, 2, '2026-09-10', '20:00', '21:00');

INSERT INTO pagos (reserva_id, monto, metodo_pago) VALUES
(1, 80000.00, 'Efectivo'),
(2, 140000.00, 'Transferencia');

SELECT 
    clientes.nombre,
    reservas.fecha,
    reservas.hora_inicio,
    reservas.hora_fin
FROM reservas
INNER JOIN clientes 
ON reservas.cliente_id = clientes.id;
