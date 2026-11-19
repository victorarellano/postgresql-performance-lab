# Hallazgos técnicos

## F-001 - Capacidad de Docker frente a memoria física
- Laboratorio: 00.1; PostgreSQL todavía no desplegado.
- Observación: Docker informa 15,34 GiB, Windows 32 GB instalados. [Docker](images/tema-00/00-03-docker-recursos.png), [Windows](images/tema-00/00-05-windows-memoria.png).
- Interpretación: liberar procesos reduce competencia, no aumenta por sí mismo la capacidad del entorno.
- Alcance: configuración observada de Docker/WSL 2; no es medición de rendimiento PostgreSQL.
- Aplicación: mantener capacidad actual; ampliar solo con necesidad demostrada.
- Referencia: [Docker Desktop settings](https://docs.docker.com/desktop/settings-and-maintenance/settings/).

## F-002 - Estado saludable y montaje no equivalen a prueba funcional
- Laboratorio: 00.2; imagen postgres:17.12-bookworm, versión SQL pendiente.
- Observación: [contenedor healthy](images/tema-00/00-08-postgresql-contenedor.png) y [volumen montado](images/tema-00/00-09-postgresql-volumen-imagen.png).
- Interpretación: la infraestructura está iniciada; autenticación, consultas y conservación de datos requieren pruebas separadas.
- Aplicación: validar conexión en 00.3 y persistencia en 00.4. Registrar digest para identificar la imagen original.
- Referencias: [Docker volumes](https://docs.docker.com/engine/storage/volumes/), [PostgreSQL pg_isready](https://www.postgresql.org/docs/17/app-pg-isready.html).

## F-003 - Puerto publicado y autenticación son capas distintas
- Laboratorio: 00.3; PostgreSQL 17.12.
- Observación: cliente conecta a 5476, servidor reporta 5432; contraseña incorrecta rechazada, correcta aceptada. [TCP](images/tema-00/00-12-postgresql-conexion-externa.png), [HBA](images/tema-00/00-13-postgresql-reglas-autenticacion.png), [rechazo](images/tema-00/00-14-postgresql-autenticacion-fallida.png), [éxito](images/tema-00/00-15-postgresql-autenticacion-exitosa.png).
- Diagnóstico: redirección Docker y reglas de autenticación independientes; pg_hba_file_rules representa archivo actual, no necesariamente reglas cargadas.
- Aplicación: comprobar sesión real y autenticación con pruebas positiva y negativa; no cambiar puerto interno sin necesidad.
- Referencia: [HBA](https://www.postgresql.org/docs/17/auth-pg-hba-conf.html).

## F-004 - Memoria de trabajo por operación, no por conexión
- Laboratorio: 00.3; PostgreSQL 17.12.
- Observación: [pg_settings](images/tema-00/00-16-postgresql-parametros-rendimiento.png): work_mem 4 MiB, shared_buffers 128 MiB, effective_cache_size 4 GiB.
- Interpretación: work_mem es límite base por operación; múltiples operaciones y trabajadores pueden aumentar consumo. effective_cache_size no reserva memoria. shared_buffers requiere reinicio.
- Aplicación: evaluar concurrencia y operaciones; probar cambios de sesión controlados. No se midió consumo real ni se ajustaron parámetros.
- Referencia: [Configuración de recursos](https://www.postgresql.org/docs/17/runtime-config-resource.html).

## F-005 - Índices primarios y costo de almacenamiento
- Laboratorio: 00.4; PostgreSQL 17.12.
- Observación: [tres índices únicos B-tree](images/tema-00/00-20-postgresql-indices-iniciales.png); [sales 65 MB de tabla y 21 MB de índices](images/tema-00/00-25-postgresql-tamano-tablas-indices.png).
- Interpretación: claves primarias respaldadas por índices; las claves foráneas no crean automáticamente índices en columnas referenciantes. Índices representan ≈24,4 % del total informado de sales.
- Aplicación: inventariar índices y medir tamaño total antes y después de optimizar. No se ha probado todavía beneficio de índices secundarios.
- Referencia: [Restricciones](https://www.postgresql.org/docs/17/ddl-constraints.html).

## F-006 - Distribución real y estimada no son idénticas
- Laboratorio: 00.4; PostgreSQL 17.12.
- Observación: [distribución exacta](images/tema-00/00-24-postgresql-distribucion-estados.png) 90/8/2; [pg_stats](images/tema-00/00-27-postgresql-estadisticas-distribucion.png) 90,07/7,963333/1,9666666 %.
- Interpretación: diferencias compatibles con muestreo de ANALYZE; n_live_tup coincidente no garantiza exactitud de estimaciones por filtro.
- Aplicación: contrastar plan real y estimado; no asumir que un índice siempre será utilizado. Por ahora solo se verificaron estadísticas, no planes.
- Referencias: [ANALYZE](https://www.postgresql.org/docs/17/sql-analyze.html), [pg_stats](https://www.postgresql.org/docs/17/view-pg-stats.html).

## F-007 - Persistencia y regeneración requieren pruebas distintas
- Laboratorio: 00.4; PostgreSQL 17.12.
- Observación: [huellas iniciales](images/tema-00/00-28-postgresql-huellas-antes-recreacion.png), [contenedor nuevo](images/tema-00/00-30-docker-contenedor-despues-recreacion.png), [huellas posteriores](images/tema-00/00-31-postgresql-huellas-despues-recreacion.png), [regeneración](images/tema-00/00-32-postgresql-regeneracion-reproducible.png).
- Diagnóstico: ID diferente, mismo volumen, conteos y MD5 coincidentes; scripts deterministas regeneran contenido lógico en otra base de la misma instancia.
- Aplicación: comparar huellas ordenadas, verificar conexión antes de ejecutar y usar base separada para evitar borrar originales. MD5 no garantiza igualdad absoluta ni física; no elimina necesidad de backups. No usar down -v para preservar datos.
- Referencias: [Compose up](https://docs.docker.com/reference/cli/docker/compose/up/), [CREATE DATABASE](https://www.postgresql.org/docs/17/sql-createdatabase.html).

## Plantilla de hallazgo
- ID y título:
- Laboratorio y versión PostgreSQL:
- Observación y evidencia (ruta relativa):
- Interpretación:
- Condiciones y limitaciones:
- Aplicación práctica:
- Referencia oficial, si corresponde:
