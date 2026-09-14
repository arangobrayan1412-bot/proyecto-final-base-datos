PRAGMA foreign_keys = ON;

CREATE TABLE clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    telefono TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

CREATE TABLE canchas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    tipo TEXT NOT NULL,
    precio_hora REAL NOT NULL
);

CREATE TABLE reservas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER NOT NULL,
    cancha_id INTEGER NOT NULL,
    fecha TEXT NOT NULL,
    hora_inicio TEXT NOT NULL,
    hora_fin TEXT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (cancha_id) REFERENCES canchas(id)
);

CREATE TABLE pagos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    reserva_id INTEGER NOT NULL,
    monto REAL NOT NULL,
    metodo_pago TEXT NOT NULL,
    fecha_pago TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reserva_id) REFERENCES reservas(id)
);