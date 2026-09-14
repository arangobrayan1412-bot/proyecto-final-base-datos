# proyecto-final-base-datos

# Sistema de Gestión de Cancha Sintética

## 1. Integrantes del Equipo
- Juan Pablo Barbosa Berrio (1105392434 / j38322851@gmail.com)
- Brayan Arango Garcia (1020111812 / arangobrayan1412@gmail.com)
- Daniel Perez Rodriguez (1193554089 / dani.4918@hotmail.com)

## 2. Descripción del Negocio y Justificación
- Contexto general del problema a resolver: Desorganización en la reserva de canchas sintéticas, cruce de horarios y falta de control centralizado sobre el estado de los pagos y clientes.
- Objetivo de la aplicación: Centralizar las reservas de canchas sintéticas, gestionar la información de los clientes y controlar los pagos asociados a cada alquiler.

## 3. Entidades Principales del Dominio
- **clientes**: Almacena los datos personales de los usuarios que reservan. Relación (1:N) con Reservas.
- **canchas**: Mantiene el catálogo de canchas disponibles con sus tarifas por hora. Relación (1:N) con Reservas.
- **reservas**: Entidad transaccional central que vincula a un Cliente con una Cancha en un horario determinado. Relación (1:N) con Pagos.
- **pagos**: Registra los montos abonados o cancelados para cada reserva. Relación (1:1 o N:1) con Reservas.

## 4. Matriz de Entornos y Conexiones
- Motores y proveedores probados:
  - SQLite (archivo local)
  - MySQL (Aiven.io)
  - PostgreSQL (Neon.tech)
  - PostgreSQL (Render.com)

## 5. Instrucciones de Ejecución
- Comando de instalación de librerías: `pip install peewee psycopg2-binary pymysql`
- Comando para ejecutar la aplicación: `python app.py`