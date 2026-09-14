CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE canchas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    precio_hora DECIMAL(10, 2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    cancha_id INT NOT NULL,
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    CONSTRAINT fk_reserva_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_reserva_cancha FOREIGN KEY (cancha_id) REFERENCES canchas(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE pagos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reserva_id INT NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_pago_reserva FOREIGN KEY (reserva_id) REFERENCES reservas(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;