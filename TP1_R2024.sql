cliente
    DNI varchar(10) (PK)
    nombre varchar(100)
    apellido varchar(100)
    fecha_nacimiento date

venta
    id integer (PK)
    fecha date
    cliente_DNI varchar(10) (FK cliente)

venta_entrada
    venta_id integer (PK, FK)
    entrada_id integer (PK, FK)

entrada
    id integer (PK)
    recital_id integer (FK recital)
    asiento_id (FK asiento)

recital
    id integer (PK)
    fecha_hora datetime
    artista varchar(100)
    lugar_id varchar(100) (FK lugar)

seccion
    id integer (PK)
    nombre varchar(100)
    precio decimal(10)
    ingreso_por varchar(100)
    capacidad_maxima integer
    servicios -> si hay que hacer otra entidad???
    disponibilidad???

asiento
    seccion_id (PK, FK seccion)
    fila varchar(10) (PK)
    numero varchar(10) (PK)

lugar
    id integer (PK)
    nombre varchar(100)







