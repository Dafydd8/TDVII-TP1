# 🩺 TP - Indicadores de Salud

Este proyecto implementa el modelo lógico de una base de datos relacional para generar indicadores sobre el uso de tecnología en los sistemas públicos de salud de las provincias argentinas. Se utiliza PostgreSQL dentro de un entorno Docker configurado previamente en la materia.

---

## 🚀 Requisitos

- Docker y Docker Compose instalados
- Entorno de base de datos PostgreSQL ya levantado (por ejemplo, `td7_postgres`)
- Cliente SQL (pgAdmin, DBeaver, o extensión de VS Code)

---

## 🛠️ Instrucciones paso a paso

### 1. Levantar el contenedor con PostgreSQL

Si no está corriendo, en la carpeta donde se encuentra el archivo `docker-compose.yml`, ejecutar:

```bash
docker compose up
```

Verificá en Docker Desktop que el contenedor esté en estado **Running**.

---

### 2. Conectarse al contenedor desde un cliente SQL

Desde pgAdmin, DBeaver o similar, conectarse al servidor PostgreSQL con los siguientes datos:

- **Host**: `127.0.0.1`
- **Puerto**: `5432`
- **Usuario**: (definido en el `docker-compose.yml`, por defecto `postgres`)
- **Contraseña**: (también definida en el YAML)
- **Base para conectarse**: `td7_postgres` o `postgres`

---

### 3. Crear una nueva base de datos

En el cliente SQL, ejecutar:

```sql
CREATE DATABASE indicadores_salud;
```

---

### 4. Crear las tablas

Conectarse a la base de datos recién creada (`indicadores_salud`) y ejecutar el script SQL con el esquema:

```sql
-- Desde tu cliente SQL, abrir y ejecutar el archivo:
-- indicadores_salud_tables.sql
```

---

### 5. Poblar las tablas con datos de prueba

Una vez creadas las tablas, ejecutar el archivo:

```sql
-- indicadores_salud_populate.sql
```

Esto inserta datos iniciales como provincias, personas, efectores, etc.

---

### 6. Verificar que esté todo funcionando

Probar con alguna consulta, por ejemplo:

```sql
SELECT * FROM Persona;
```

---

## 📁 Estructura del repositorio

```
📦 tp-indicadores-salud/
├── indicadores_salud_tables.sql           # Script con la estructura de tablas
├── indicadores_salud_populate.sql         # Script con datos de prueba
├── README.md                   # Instrucciones para levantar la base
└── (otros archivos del TP)
```

---

## 🧼 ¿Cómo reiniciar todo?

Para eliminar la base y volver a empezar:

```sql
DROP DATABASE indicadores_salud;
```

⚠️ Asegurate de estar conectado a otra base antes de ejecutar esto.

---

## 👨‍🏫 Créditos
Castore Juan Ignacio, Chen Belén, Jahde Josefina, Jenkins Dafydd.

Trabajo práctico para la materia **Introducción a las Bases de Datos** (Universidad Torcutao DiTella, 2025).