USE bd_cobranzas;
GO

-- ============================================
-- INSERTAMOS LOS DATOS PARA LA TABLA CLIENTE (15 CLIENTES)
-- ============================================
INSERT INTO Clientes (nombre, direccion, telefono, email) VALUES
('Juan Pérez Ramírez', 'Av. Arequipa 245, Lince', '987654321', 'juan.perez@correo.com'),
('María García Torres', 'Jr. Cusco 512, Breña', '956123478', 'maria.garcia@correo.com'),
('Carlos Flores Vargas', 'Av. Brasil 890, Pueblo Libre', '923456789', 'carlos.flores@correo.com'),
('Ana Rojas Mendoza', 'Calle Los Pinos 134, San Borja', '945678123', 'ana.rojas@correo.com'),
('Luis Chávez Castillo', 'Av. Universitaria 678, Los Olivos', '912345678', 'luis.chavez@correo.com'),
('Rosa Quispe Huamán', 'Jr. Tacna 321, Cercado de Lima', '934567891', 'rosa.quispe@correo.com'),
('Pedro Salazar Reyes', 'Av. Tomás Valle 456, San Martín de Porres', '967891234', 'pedro.salazar@correo.com'),
('Carmen Gutiérrez Paredes', 'Calle Las Flores 789, Surco', '978912345', 'carmen.gutierrez@correo.com'),
('Miguel Cruz Medina', 'Av. Angamos 234, Miraflores', '989123456', 'miguel.cruz@correo.com'),
('Lucía Aguilar Silva', 'Jr. Puno 567, La Victoria', '901234567', 'lucia.aguilar@correo.com'),
('Jorge Torres Ramírez', 'Av. Colonial 890, Callao', '923891456', 'jorge.torres@correo.com'),
('Elena García Flores', 'Calle Las Palmeras 123, San Miguel', '934912678', 'elena.garcia@correo.com'),
('Diego Vargas Rojas', 'Av. Del Ejército 345, Magdalena', '945123789', 'diego.vargas@correo.com'),
('Patricia Mendoza Chávez', 'Jr. Ica 678, La Molina', '956234891', 'patricia.mendoza@correo.com'),
('Fernando Castillo Salazar', 'Av. La Marina 901, San Miguel', '967345912', 'fernando.castillo@correo.com');
GO

-- ============================================
-- INSERTAMOS LOS DATOS PARA LA TABLA SERVICIOS (8 SERVICIOS)
-- ============================================
INSERT INTO Servicios (tipo_servicio, tarifa_mensual) VALUES
('Luz', 45.50),
('Agua', 32.00),
('Cable', 65.90),
('Internet', 89.90),
('Telefonía Fija', 25.00),
('Gas Natural', 38.75),
('Telefonía Móvil', 55.00),
('Streaming', 29.90);
GO

-- ============================================
-- INSERTAMOS LOS DATOS PARA LA TABLA CONTRATOSERVICIO
-- Recordatorio de IDs de Servicios:
-- 1=Luz, 2=Agua, 3=Cable, 4=Internet, 5=Telefonía Fija, 6=Gas Natural, 7=Telefonía Móvil, 8=Streaming
-- ============================================
INSERT INTO ContratoServicio (id_cliente, id_servicio, fecha_inicio, estado) VALUES
-- Cliente 1: Juan Pérez (2 servicios)
(1, 1, '2023-01-10', 'Activo'),
(1, 2, '2023-01-10', 'Activo'),
-- Cliente 2: María García (3 servicios)
(2, 1, '2022-11-05', 'Activo'),
(2, 4, '2023-03-20', 'Activo'),
(2, 8, '2023-08-15', 'Suspendido'),
-- Cliente 3: Carlos Flores (1 servicio)
(3, 3, '2023-05-12', 'Activo'),
-- Cliente 4: Ana Rojas (2 servicios)
(4, 2, '2022-09-18', 'Activo'),
(4, 6, '2022-09-18', 'Activo'),
-- Cliente 5: Luis Chávez (3 servicios)
(5, 1, '2023-02-25', 'Activo'),
(5, 3, '2023-02-25', 'Activo'),
(5, 7, '2023-06-10', 'Cancelado'),
-- Cliente 6: Rosa Quispe (2 servicios)
(6, 4, '2023-04-08', 'Activo'),
(6, 8, '2023-04-08', 'Activo'),
-- Cliente 7: Pedro Salazar (1 servicio)
(7, 2, '2023-07-01', 'Suspendido'),
-- Cliente 8: Carmen Gutiérrez (4 servicios)
(8, 1, '2022-08-14', 'Activo'),
(8, 2, '2022-08-14', 'Activo'),
(8, 3, '2023-01-30', 'Activo'),
(8, 4, '2023-01-30', 'Activo'),
-- Cliente 9: Miguel Cruz (2 servicios)
(9, 6, '2023-03-22', 'Activo'),
(9, 5, '2023-03-22', 'Activo'),
-- Cliente 10: Lucía Aguilar (3 servicios)
(10, 1, '2022-12-05', 'Activo'),
(10, 4, '2023-05-17', 'Suspendido'),
(10, 7, '2023-05-17', 'Activo'),
-- Cliente 11: Jorge Torres (2 servicios)
(11, 3, '2023-06-28', 'Activo'),
(11, 8, '2023-06-28', 'Cancelado'),
-- Cliente 12: Elena García (4 servicios)
(12, 1, '2022-10-11', 'Activo'),
(12, 2, '2022-10-11', 'Activo'),
(12, 6, '2023-02-19', 'Activo'),
(12, 4, '2023-02-19', 'Suspendido'),
-- Cliente 13: Diego Vargas (1 servicio)
(13, 5, '2023-08-03', 'Activo'),
-- Cliente 14: Patricia Mendoza (2 servicios)
(14, 4, '2023-01-16', 'Activo'),
(14, 7, '2023-01-16', 'Activo'),
-- Cliente 15: Fernando Castillo (3 servicios)
(15, 1, '2022-07-27', 'Activo'),
(15, 2, '2022-07-27', 'Activo'),
(15, 3, '2023-04-09', 'Suspendido');
GO

-- ============================================
-- INSERTAMOS LOS DATOS PARA LA TABLA FACTURAS
-- FACTURAS - 3 meses (Junio, Julio, Agosto 2024) por contrato
-- ============================================
INSERT INTO Facturas (id_contrato, mes, anio, monto, fecha_vencimiento, estado_pago) VALUES
-- Contrato 1 (Cliente 1 - Luz, Activo)
(1, 6, 2024, 45.50, '2024-06-10', 'Pagado'),
(1, 7, 2024, 45.50, '2024-07-10', 'Pagado'),
(1, 8, 2024, 45.50, '2024-08-10', 'Pendiente'),
-- Contrato 2 (Cliente 1 - Agua, Activo)
(2, 6, 2024, 32.00, '2024-06-10', 'Pagado'),
(2, 7, 2024, 32.00, '2024-07-10', 'Vencido'),
(2, 8, 2024, 32.00, '2024-08-10', 'Pendiente'),
-- Contrato 3 (Cliente 2 - Luz, Activo)
(3, 6, 2024, 45.50, '2024-06-05', 'Pagado'),
(3, 7, 2024, 45.50, '2024-07-05', 'Pagado'),
(3, 8, 2024, 45.50, '2024-08-05', 'Pendiente'),
-- Contrato 4 (Cliente 2 - Internet, Activo)
(4, 6, 2024, 89.90, '2024-06-20', 'Pagado'),
(4, 7, 2024, 89.90, '2024-07-20', 'Vencido'),
(4, 8, 2024, 89.90, '2024-08-20', 'Pendiente'),
-- Contrato 5 (Cliente 2 - Streaming, Suspendido)
(5, 6, 2024, 29.90, '2024-06-15', 'Vencido'),
(5, 7, 2024, 29.90, '2024-07-15', 'Vencido'),
(5, 8, 2024, 29.90, '2024-08-15', 'Vencido'),
-- Contrato 6 (Cliente 3 - Cable, Activo)
(6, 6, 2024, 65.90, '2024-06-12', 'Pagado'),
(6, 7, 2024, 65.90, '2024-07-12', 'Pagado'),
(6, 8, 2024, 65.90, '2024-08-12', 'Pendiente'),
-- Contrato 7 (Cliente 4 - Agua, Activo)
(7, 6, 2024, 32.00, '2024-06-18', 'Pagado'),
(7, 7, 2024, 32.00, '2024-07-18', 'Pagado'),
(7, 8, 2024, 32.00, '2024-08-18', 'Pendiente'),
-- Contrato 8 (Cliente 4 - Gas, Activo)
(8, 6, 2024, 38.75, '2024-06-18', 'Pagado'),
(8, 7, 2024, 38.75, '2024-07-18', 'Pagado'),
(8, 8, 2024, 38.75, '2024-08-18', 'Pendiente'),
-- Contrato 9 (Cliente 5 - Luz, Activo)
(9, 6, 2024, 45.50, '2024-06-25', 'Pagado'),
(9, 7, 2024, 45.50, '2024-07-25', 'Pagado'),
(9, 8, 2024, 45.50, '2024-08-25', 'Pendiente'),
-- Contrato 10 (Cliente 5 - Cable, Activo)
(10, 6, 2024, 65.90, '2024-06-25', 'Vencido'),
(10, 7, 2024, 65.90, '2024-07-25', 'Vencido'),
(10, 8, 2024, 65.90, '2024-08-25', 'Pendiente'),
-- Contrato 11 (Cliente 5 - Tel. Móvil, Cancelado)
(11, 6, 2024, 55.00, '2024-06-10', 'Vencido'),
(11, 7, 2024, 55.00, '2024-07-10', 'Vencido'),
(11, 8, 2024, 55.00, '2024-08-10', 'Vencido'),
-- Contrato 12 (Cliente 6 - Internet, Activo)
(12, 6, 2024, 89.90, '2024-06-08', 'Pagado'),
(12, 7, 2024, 89.90, '2024-07-08', 'Pagado'),
(12, 8, 2024, 89.90, '2024-08-08', 'Pendiente'),
-- Contrato 13 (Cliente 6 - Streaming, Activo)
(13, 6, 2024, 29.90, '2024-06-08', 'Pagado'),
(13, 7, 2024, 29.90, '2024-07-08', 'Pagado'),
(13, 8, 2024, 29.90, '2024-08-08', 'Pendiente'),
-- Contrato 14 (Cliente 7 - Agua, Suspendido)
(14, 6, 2024, 32.00, '2024-06-14', 'Vencido'),
(14, 7, 2024, 32.00, '2024-07-14', 'Vencido'),
(14, 8, 2024, 32.00, '2024-08-14', 'Vencido'),
-- Contrato 15 (Cliente 8 - Luz, Activo)
(15, 6, 2024, 45.50, '2024-06-16', 'Pagado'),
(15, 7, 2024, 45.50, '2024-07-16', 'Pagado'),
(15, 8, 2024, 45.50, '2024-08-16', 'Pendiente'),
-- Contrato 16 (Cliente 8 - Agua, Activo)
(16, 6, 2024, 32.00, '2024-06-16', 'Pagado'),
(16, 7, 2024, 32.00, '2024-07-16', 'Pagado'),
(16, 8, 2024, 32.00, '2024-08-16', 'Pendiente'),
-- Contrato 17 (Cliente 8 - Cable, Activo)
(17, 6, 2024, 65.90, '2024-06-30', 'Pagado'),
(17, 7, 2024, 65.90, '2024-07-30', 'Vencido'),
(17, 8, 2024, 65.90, '2024-08-30', 'Pendiente'),
-- Contrato 18 (Cliente 8 - Internet, Activo)
(18, 6, 2024, 89.90, '2024-06-30', 'Pagado'),
(18, 7, 2024, 89.90, '2024-07-30', 'Pagado'),
(18, 8, 2024, 89.90, '2024-08-30', 'Pendiente'),
-- Contrato 19 (Cliente 9 - Gas, Activo)
(19, 6, 2024, 38.75, '2024-06-22', 'Pagado'),
(19, 7, 2024, 38.75, '2024-07-22', 'Pagado'),
(19, 8, 2024, 38.75, '2024-08-22', 'Pendiente'),
-- Contrato 20 (Cliente 9 - Tel. Fija, Activo)
(20, 6, 2024, 25.00, '2024-06-22', 'Pagado'),
(20, 7, 2024, 25.00, '2024-07-22', 'Pagado'),
(20, 8, 2024, 25.00, '2024-08-22', 'Pendiente'),
-- Contrato 21 (Cliente 10 - Luz, Activo)
(21, 6, 2024, 45.50, '2024-06-05', 'Pagado'),
(21, 7, 2024, 45.50, '2024-07-05', 'Pagado'),
(21, 8, 2024, 45.50, '2024-08-05', 'Pendiente'),
-- Contrato 22 (Cliente 10 - Internet, Suspendido)
(22, 6, 2024, 89.90, '2024-06-17', 'Vencido'),
(22, 7, 2024, 89.90, '2024-07-17', 'Vencido'),
(22, 8, 2024, 89.90, '2024-08-17', 'Vencido'),
-- Contrato 23 (Cliente 10 - Tel. Móvil, Activo)
(23, 6, 2024, 55.00, '2024-06-17', 'Pagado'),
(23, 7, 2024, 55.00, '2024-07-17', 'Pagado'),
(23, 8, 2024, 55.00, '2024-08-17', 'Pendiente'),
-- Contrato 24 (Cliente 11 - Cable, Activo)
(24, 6, 2024, 65.90, '2024-06-28', 'Pagado'),
(24, 7, 2024, 65.90, '2024-07-28', 'Pagado'),
(24, 8, 2024, 65.90, '2024-08-28', 'Pendiente'),
-- Contrato 25 (Cliente 11 - Streaming, Cancelado)
(25, 6, 2024, 29.90, '2024-06-28', 'Vencido'),
(25, 7, 2024, 29.90, '2024-07-28', 'Vencido'),
(25, 8, 2024, 29.90, '2024-08-28', 'Vencido'),
-- Contrato 26 (Cliente 12 - Luz, Activo)
(26, 6, 2024, 45.50, '2024-06-11', 'Pagado'),
(26, 7, 2024, 45.50, '2024-07-11', 'Pagado'),
(26, 8, 2024, 45.50, '2024-08-11', 'Pendiente'),
-- Contrato 27 (Cliente 12 - Agua, Activo)
(27, 6, 2024, 32.00, '2024-06-11', 'Pagado'),
(27, 7, 2024, 32.00, '2024-07-11', 'Pagado'),
(27, 8, 2024, 32.00, '2024-08-11', 'Pendiente'),
-- Contrato 28 (Cliente 12 - Gas, Activo)
(28, 6, 2024, 38.75, '2024-06-19', 'Pagado'),
(28, 7, 2024, 38.75, '2024-07-19', 'Vencido'),
(28, 8, 2024, 38.75, '2024-08-19', 'Pendiente'),
-- Contrato 29 (Cliente 12 - Internet, Suspendido)
(29, 6, 2024, 89.90, '2024-06-19', 'Vencido'),
(29, 7, 2024, 89.90, '2024-07-19', 'Vencido'),
(29, 8, 2024, 89.90, '2024-08-19', 'Vencido'),
-- Contrato 30 (Cliente 13 - Tel. Fija, Activo)
(30, 6, 2024, 25.00, '2024-06-03', 'Pagado'),
(30, 7, 2024, 25.00, '2024-07-03', 'Pagado'),
(30, 8, 2024, 25.00, '2024-08-03', 'Pendiente'),
-- Contrato 31 (Cliente 14 - Internet, Activo)
(31, 6, 2024, 89.90, '2024-06-16', 'Pagado'),
(31, 7, 2024, 89.90, '2024-07-16', 'Pagado'),
(31, 8, 2024, 89.90, '2024-08-16', 'Pendiente'),
-- Contrato 32 (Cliente 14 - Tel. Móvil, Activo)
(32, 6, 2024, 55.00, '2024-06-16', 'Vencido'),
(32, 7, 2024, 55.00, '2024-07-16', 'Pagado'),
(32, 8, 2024, 55.00, '2024-08-16', 'Pendiente'),
-- Contrato 33 (Cliente 15 - Luz, Activo)
(33, 6, 2024, 45.50, '2024-06-27', 'Pagado'),
(33, 7, 2024, 45.50, '2024-07-27', 'Pagado'),
(33, 8, 2024, 45.50, '2024-08-27', 'Pendiente'),
-- Contrato 34 (Cliente 15 - Agua, Activo)
(34, 6, 2024, 32.00, '2024-06-27', 'Pagado'),
(34, 7, 2024, 32.00, '2024-07-27', 'Pagado'),
(34, 8, 2024, 32.00, '2024-08-27', 'Pendiente'),
-- Contrato 35 (Cliente 15 - Cable, Suspendido)
(35, 6, 2024, 65.90, '2024-06-09', 'Vencido'),
(35, 7, 2024, 65.90, '2024-07-09', 'Vencido'),
(35, 8, 2024, 65.90, '2024-08-09', 'Vencido');
GO

-- ============================================
-- INSERTAMOS LOS DATOS PARA LA TABLA PAGOS
-- PAGOS - Solo para facturas con estado 'Pagado'
-- ============================================
INSERT INTO Pagos (id_factura, fecha_pago, monto_pagado, metodo_pago) VALUES
(1,   '2024-06-09', 45.50, 'Yape'),
(2,   '2024-07-09', 45.50, 'Efectivo'),
(4,   '2024-06-08', 32.00, 'Transferencia'),
(7,   '2024-06-04', 45.50, 'Yape'),
(8,   '2024-07-04', 45.50, 'Plin'),
(10,  '2024-06-19', 89.90, 'Tarjeta'),
(16,  '2024-06-11', 65.90, 'Efectivo'),
(17,  '2024-07-11', 65.90, 'Yape'),
(19,  '2024-06-17', 32.00, 'Transferencia'),
(20,  '2024-07-17', 32.00, 'Yape'),
(22,  '2024-06-17', 38.75, 'Plin'),
(23,  '2024-07-18', 38.75, 'Efectivo'),
(25,  '2024-06-24', 45.50, 'Tarjeta'),
(26,  '2024-07-25', 45.50, 'Yape'),
(34,  '2024-06-07', 89.90, 'Transferencia'),
(35,  '2024-07-07', 89.90, 'Efectivo'),
(37,  '2024-06-08', 29.90, 'Yape'),
(38,  '2024-07-07', 29.90, 'Plin'),
(43,  '2024-06-15', 45.50, 'Efectivo'),
(44,  '2024-07-16', 45.50, 'Tarjeta'),
(46,  '2024-06-16', 32.00, 'Yape'),
(47,  '2024-07-15', 32.00, 'Transferencia'),
(49,  '2024-06-29', 65.90, 'Efectivo'),
(52,  '2024-06-29', 89.90, 'Yape'),
(53,  '2024-07-30', 89.90, 'Plin'),
(55,  '2024-06-21', 38.75, 'Transferencia'),
(56,  '2024-07-22', 38.75, 'Yape'),
(58,  '2024-06-21', 25.00, 'Efectivo'),
(59,  '2024-07-22', 25.00, 'Tarjeta'),
(61,  '2024-06-04', 45.50, 'Yape'),
(62,  '2024-07-05', 45.50, 'Plin'),
(67,  '2024-06-16', 55.00, 'Efectivo'),
(68,  '2024-07-17', 55.00, 'Transferencia'),
(70,  '2024-06-27', 65.90, 'Yape'),
(71,  '2024-07-28', 65.90, 'Efectivo'),
(76,  '2024-06-10', 45.50, 'Plin'),
(77,  '2024-07-11', 45.50, 'Yape'),
(79,  '2024-06-10', 32.00, 'Tarjeta'),
(80,  '2024-07-11', 32.00, 'Efectivo'),
(82,  '2024-06-18', 38.75, 'Yape'),
(88,  '2024-06-02', 25.00, 'Transferencia'),
(89,  '2024-07-03', 25.00, 'Yape'),
(91,  '2024-06-15', 89.90, 'Efectivo'),
(92,  '2024-07-16', 89.90, 'Plin'),
(95,  '2024-07-16', 55.00, 'Yape'),
(97,  '2024-06-26', 45.50, 'Tarjeta'),
(98,  '2024-07-27', 45.50, 'Efectivo'),
(100, '2024-06-26', 32.00, 'Yape'),
(101, '2024-07-27', 32.00, 'Transferencia');
GO

--MOSTRAR LOS NUEVOS REGISTROS DE CADA TABLA
SELECT * FROM Clientes;
SELECT * FROM Servicios;
SELECT * FROM ContratoServicio;
SELECT * FROM Facturas;
SELECT * FROM Pagos;
