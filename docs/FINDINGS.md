# Hallazgos técnicos

## F-001 — Capacidad de Docker frente a memoria física
- Laboratorio: 00.1; PostgreSQL todavía no desplegado.
- Observación: Docker informa 15,34 GiB, Windows 32 GB instalados. [Docker](images/tema-00/00-03-docker-recursos.png), [Windows](images/tema-00/00-05-windows-memoria.png).
- Interpretación: liberar procesos reduce competencia, no aumenta por sí mismo la capacidad del entorno.
- Alcance: configuración observada de Docker/WSL 2; no es medición de rendimiento PostgreSQL.
- Aplicación: mantener capacidad actual; ampliar solo con necesidad demostrada.
- Referencia: [Docker Desktop settings](https://docs.docker.com/desktop/settings-and-maintenance/settings/).

## F-002 — Estado saludable y montaje no equivalen a prueba funcional
- Laboratorio: 00.2; imagen postgres:17.12-bookworm, versión SQL pendiente.
- Observación: [contenedor healthy](images/tema-00/00-08-postgresql-contenedor.png) y [volumen montado](images/tema-00/00-09-postgresql-volumen-imagen.png).
- Interpretación: la infraestructura está iniciada; autenticación, consultas y conservación de datos requieren pruebas separadas.
- Aplicación: validar conexión en 00.3 y persistencia en 00.4. Registrar digest para identificar la imagen original.
- Referencias: [Docker volumes](https://docs.docker.com/engine/storage/volumes/), [PostgreSQL pg_isready](https://www.postgresql.org/docs/17/app-pg-isready.html).

## Plantilla de hallazgo
- ID y título:
- Laboratorio y versión PostgreSQL:
- Observación y evidencia (ruta relativa):
- Interpretación:
- Condiciones y limitaciones:
- Aplicación práctica:
- Referencia oficial, si corresponde:

