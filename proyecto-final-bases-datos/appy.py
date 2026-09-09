import datetime
from peewee import (
    SqliteDatabase,
    Model,
    CharField,
    DecimalField,
    DateField,
    TimeField,
    DateTimeField,
    ForeignKeyField
)

# Inicialización de la base de datos local SQLite
db = SqliteDatabase('cancha_sintetica.db')

class BaseModel(Model):
    class Meta:
        database = db

class Cliente(BaseModel):
    nombre = CharField(max_length=100)
    telefono = CharField(max_length=20)
    email = CharField(max_length=100, unique=True)

    class Meta:
        table_name = 'clientes'

class Cancha(BaseModel):
    nombre = CharField(max_length=50)
    tipo = CharField(max_length=50)
    precio_hora = DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        table_name = 'canchas'

class Reserva(BaseModel):
    cliente = ForeignKeyField(Cliente, backref='reservas', on_delete='RESTRICT')
    cancha = ForeignKeyField(Cancha, backref='reservas', on_delete='RESTRICT')
    fecha = DateField()
    hora_inicio = TimeField()
    hora_fin = TimeField()

    class Meta:
        table_name = 'reservas'

class Pago(BaseModel):
    reserva = ForeignKeyField(Reserva, backref='pagos', on_delete='RESTRICT')
    monto = DecimalField(max_digits=10, decimal_places=2)
    metodo_pago = CharField(max_length=50)
    fecha_pago = DateTimeField(default=datetime.datetime.now)

    class Meta:
        table_name = 'pagos'

def init_db():
    db.connect()
    db.create_tables([Cliente, Cancha, Reserva, Pago])
    print("Tablas creadas exitosamente con Peewee ORM.")

def seed_demo_data():
    if Cliente.select().count() == 0:
        c1 = Cliente.create(nombre="Juan Pablo", telefono="3000000000", email="juan@example.com")
        ca1 = Cancha.create(nombre="Cancha Principal", tipo="Fútbol 5", precio_hora=90000.00)
        r1 = Reserva.create(
            cliente=c1,
            cancha=ca1,
            fecha=datetime.date.today(),
            hora_inicio=datetime.time(19, 0),
            hora_fin=datetime.time(20, 0)
        )
        Pago.create(reserva=r1, monto=90000.00, metodo_pago="Nequi")
        print("Datos de prueba insertados.")

def listar_reservas():
    print("\n--- LISTADO DE RESERVAS ---")
    query = Reserva.select().join(Cliente)
    for r in query:
        print(f"Reserva #{r.id} | Cliente: {r.cliente.nombre} | Cancha: {r.cancha.nombre} | Fecha: {r.fecha} | Hora: {r.hora_inicio}")

if __name__ == '__main__':
    init_db()
    seed_demo_data()
    listar_reservas()
    db.close()