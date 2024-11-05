# Manejo de tiempo en bases de datos

El manejo de fechas y horas es complejo en DB, no todos los sistemas están haciendo uso de la misma "TimeZone".

Existe la herramienta [UTC][UTC] que hace referencia al tiempo universal coordinado. 
Que nos permite coordinar los horarios a nivel mundial.

## Tipos de datos "TIME" en postgres

Existen distintos tipos de datos para las fechas. Cada uno tiene casos de uso:

1. DATE - 'YYYY-MM-DD': Casos de uso "hechos historicos", nadie cuestionará la hora del suceso
2. TIME - 'HH:MM:SS'
3. TIMESTAMP - 'YYYY-MM-DD HH:MM:SS' (4713 A.C, 294276 D.C): Cuando ocurrió algo "momento de la compra". (Es el mismo en todo el mundo)
4. TIMESTAMP WITH TIME ZONE - "TIMESTAMP CON TIME ZONE": Cuando ocurrió algo "momento de compra", y zona horaria 

- Función `NOW()` de postgres

> [!NOTE] 
> Se considera una buena práctica usar `TIMESTAMP WITH TIME ZONE` para almacenar fechas

```sql
CREATE TABLE personas (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR NOT NULL,
  apellido VARCHAR NOT NULL,
  email VARCHAR NOT NULL,
  telefono VARCHAR NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);
```

> [!WARNING]
> Postgres no actualiza de forma automática el campo updated_at al momento de hacer `UPDATE`, se puede lograr con un `STORE PROCEDURE`

## Timezones en postgres

`UTC` es el mismo en cualquier lugar. Por lo que puedes guardar el "momento" con `TIMEZONE`  y luego convertirlo según el `TIMEZONE` del usuario

- Puedes ver las `TIMEZONE` con la siguiente consulta

    ```sql
    SELECT * FROM pg_timezone_names ;

    SELECT * FROM pg_timezone_names WHERE name LIKE '%Chile%';
    ```

  > [!NOTE]
  > `is_dst` indica si está usando "horario de verano"

-  Puedes convertir una hora con timezone a otro timezone al momendo de recuperar las filas usando `AT TIME ZONE '<ZONA>'`:

    > [!NOTE]
    > Se está usando la data provista en el archivo `trabajo_spa.sql`, las horas pueden diferir según cuando se ejecutó el script

    ```sql
      select ID, created_at, updated_at AT TIME ZONE 'UTC' from cargos;
    ``` 


## Casting

Casting se preocupa de tomar una variable o constante en un tipo de dato y convertirlo a otro.

```sql
SELECT NOW()::DATE, CAST(NOW() AS DATE), CAST(NOW() AS TIME)
```

## Aritmética con Intervalos

Se puede obtener información ocurrida en intervalos de tiempo: 

```sql
SELECT NOW(), NOW() - INTERVAL '2 days', (NOW() - INTERVAL '2 days')::DATE;
```

## date_trunc()

A veces no es necesaria tanta precisión dada por el timestamp al momento de obtener data:

```sql
SELECT id, nombre, created_at FROM cargos
  WHERE   created_at >= DATE_TRUNC('day', NOW() )
  AND     created_at < DATE_TRUNC('day', NOW() + INTERVAL '1 day' );
```

En éste caso, no se necesita precisión de "HH:MM:SS" si se quiere obtener la data de hoy.

> [!WARNING]
> No todas las consultas que traen los mismos resultados tienen el mismo rendimiento.

```sql
SELECT id, nombre, created_at FROM cargos
  WHERE created_at::DATE = NOW()::DATE;
```


## Store Procedure

> [!WARNING]
> Los store procedures no son portables

Algunos casos de uso para los store procedures son para forzar alguna regla específica de negocio dentro de la base de datos que no se puede construir con SQL o el DBMS que estás usando.

Cada DBMS tiene su propio dialecto, por lo que no es portable el procedimiento a otro DMBS.

En el caso de `updated_at`, no se puede definir una actualización automática del campo `updated_at` del registro al momento de definir la tabla en Postgres. 

En éste caso usando sólo el motor postgres se tiene que crear el procedimiento:

```sql
CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

```

Ahora se crea el `TRIGGER` que usará la función en la tabla

```SQL
CREATE TRIGGER set_timestamp
BEFORE UPDATE ON cargos
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();
```

Ahora prueba actualizar un registro de la tabla Cargos:

```sql
UPDATE cargos SET nombre = 'Un cargo actualizado' WHERE id = 3;
```


[UTC]: https://es.wikipedia.org/wiki/Tiempo_universal_coordinado