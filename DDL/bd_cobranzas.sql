--CREACION DE LA BASE DE DATOS LLAMADA COBRANZAS
CREATE DATABASE bd_cobranzas;

--CREACION DE LA TABLA CLIENTES
CREATE TABLE Clientes(
id_cliente INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(100) NOT NULL,
direccion VARCHAR(150) NOT NULL,
telefono CHAR(9) NOT NULL,
email VARCHAR(50) NOT NULL,
fecha_registro DATE DEFAULT GETDATE()
);

--CREACION DE LA TABLA SERVICIOS
CREATE TABLE Servicios(
id_servicio INT PRIMARY KEY IDENTITY(1,1),
tipo_servicio VARCHAR(50) NOT NULL,
tarifa_mensual DECIMAL(10,2)
);

--CREACION DE LA TABLA CONTRATOSERVICIO
CREATE TABLE ContratoServicio(
id_contrato INT PRIMARY KEY IDENTITY(1,1),
id_cliente INT NOT NULL,
id_servicio INT NOT NULL,
fecha_inicio DATE NOT NULL DEFAULT GETDATE(),
estado VARCHAR(20) NOT NULL DEFAULT 'Activo' CHECK(estado IN('Activo','Suspendido','Cancelado')),
CONSTRAINT FK_contrato_cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
CONSTRAINT FK_contrato_servicio FOREIGN KEY (id_servicio) REFERENCES Servicios(id_servicio)
);

--CREACION DE LA TABLA FACTURAS
CREATE TABLE Facturas (
    id_factura INT PRIMARY KEY IDENTITY(1,1),
    id_contrato INT NOT NULL,
    mes INT NOT NULL CHECK (mes BETWEEN 1 AND 12),
    anio INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL CHECK (monto > 0),
    fecha_vencimiento DATE NOT NULL,
    estado_pago VARCHAR(20) NOT NULL DEFAULT 'Pendiente' CHECK (estado_pago IN ('Pendiente', 'Pagado', 'Vencido')),
    CONSTRAINT FK_Factura_Contrato FOREIGN KEY (id_contrato) REFERENCES ContratoServicio(id_contrato)
);

--CREACION DE LA TABLA PAGOS
CREATE TABLE Pagos (
    id_pago INT PRIMARY KEY IDENTITY(1,1),
    id_factura INT NOT NULL,
    fecha_pago DATE NOT NULL DEFAULT GETDATE(),
    monto_pagado DECIMAL(10,2) NOT NULL CHECK (monto_pagado > 0),
    metodo_pago VARCHAR(30) CHECK (metodo_pago IN ('Efectivo', 'Yape', 'Plin', 'Transferencia', 'Tarjeta')),
    CONSTRAINT FK_Pago_Factura FOREIGN KEY (id_factura) REFERENCES Facturas(id_factura)
);

--CREACION DE LA TABLA HISTORIALESTADOS
CREATE TABLE HistorialEstados (
    id_historial INT PRIMARY KEY IDENTITY(1,1),
    id_cliente INT NOT NULL,
    estado_anterior VARCHAR(20),
    estado_nuevo VARCHAR(20) NOT NULL,
    fecha_cambio DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Historial_Cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);
