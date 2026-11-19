# Registro de aprendizaje

## 2026-11-18 - Módulo 00 (primer corte)

- Objetivo: caracterizar el ambiente y desplegar PostgreSQL con Compose.
- Actividades: 00.1 y 00.2 completados; ver [capítulo 00](00-ambiente-reproducible.md), evidencias 00-01 a 00-09.
- Conocimientos demostrados: arquitectura WSL 2, capacidad frente a disponibilidad de recursos, persistencia de volúmenes y significado del digest.
- Refuerzo realizado: liberar memoria no aumenta la capacidad del entorno Docker.
- Decisiones: mantener recursos actuales, puerto local 5476, registrar digest sin fijarlo todavía.
- Pendientes: conexión autenticada, versión SQL, persistencia efectiva y carga sintética.
- Estado: capítulo en curso; siguiente laboratorio 00.3.

## 2026-11-18 a 2026-11-19 - Módulo 00 (cierre)

- Objetivo: verificar conectividad y configuración, generar datos y validar persistencia y reproducibilidad.
- Actividades: 00.3 y 00.4 completados; [capítulo 00](00-ambiente-reproducible.md), evidencias 00-10 a 00-33 y [scripts SQL](../sql/).
- Conocimientos demostrados: puerto publicado frente al interno, autenticación negativa y positiva, configuración por sesión frente a reinicio, memoria por operación, índices de claves primarias, selectividad, estadísticas estimadas frente a conteos reales.
- Refuerzos: cálculo de memoria concurrente (600 MiB en el escenario de 50 consultas y tres ordenamientos de 4 MiB), efecto de un índice en tamaño de índices y tamaño total. No se probaron todavía mejoras de rendimiento.
- Resultados: PostgreSQL 17.12; 1.011.000 filas; ventas 90/8/2; huellas coincidentes antes y después de recrear y en base separada. Base temporal eliminada y ausencia verificada.
- Decisiones: usar pgAdmin en Windows, esquema lab, generación determinista, MD5 ordenado por clave primaria, base temporal en lugar de reset destructivo.
- Limitaciones: no se verificó igualdad física ni de planes, ubicación física del disco Docker ni eliminación del registro temporal de pgAdmin. La prueba de regeneración fue en la misma instancia.
- Control documental: verificadas 33 rutas de evidencia y tres scripts; corregidos archivo sobrante y bloque ANALYZE omitido en publicación.
- Estado: capítulo 00 completado técnicamente. Siguiente: discutir mejora metodológica propuesta por el estudiante y acordar alcance del capítulo 01 antes de iniciarlo.

## 2026-11-19 - Retrospectiva 01

- Evaluación: se valora el control de calidad aunque exige tiempo; única observación de mejora: evitar referencias personales en la documentación técnica.
- Aprobadas M-001 a M-004: retrospectiva obligatoria, redacción impersonal, separación documental y registro histórico.
- No se requieren nuevos ejercicios ni evidencias. Ver [retrospectiva 01](RETROSPECTIVES.md).
- Estado: mejoras aprobadas; pendiente publicación y verificación de los documentos y sincronización de instrucciones del proyecto antes del capítulo 01.

## Plantilla de sesión
- Fecha y módulo:
- Objetivo:
- Actividades y evidencias (rutas relativas):
- Conocimientos demostrados:
- Dudas o bloqueos:
- Estado y siguiente acción:
