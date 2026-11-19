# Metodología de microaprendizaje

## Principios

Aprender por descubrimiento, evidencia y transferencia. No imponer duración fija. Avanzar cuando se demuestre comprensión, no por tiempo transcurrido. Un módulo puede dividirse en microlaboratorios acordados.

## Preparación y aprobación del capítulo

Consultar README, ROADMAP, INSTRUCCIONES, este documento, documentación previa, LEARNING-LOG y hallazgos pertinentes. Identificar lo ya validado. Informar cualquier referencia necesaria no disponible.

Presentar objetivo y contexto, alcance y exclusiones, tabla de laboratorios con identificadores NN.1, NN.2, etc., actividades y validaciones, estimaciones orientativas de duración, arquitectura conceptual (Mermaid cuando aporte claridad), reutilización, prerrequisitos, riesgos y criterios de cierre. Diferenciar propuesta de arquitectura comprobada. Solicitar aprobación del alcance antes de diseñar e implementar.

## Diseño técnico previo al laboratorio

Consultar fuentes oficiales pertinentes a la versión y entorno (PostgreSQL, Docker u otras herramientas según corresponda). Identificar requisitos, semántica, restricciones y riesgos. Contrastar con evidencias anteriores. Presentar una ficha proporcionada a la complejidad: problema, objetivo, valor nuevo, recursos y scripts afectados, escenario y datos, configuración, hipótesis, línea base y métricas cuando correspondan, casos de prueba, evidencias previstas, seguridad, limpieza, reversibilidad y referencias. Identificar incertidumbres y proponer pruebas exploratorias cuando sean necesarias. Obtener aprobación expresa antes de implementar y ante cambios sustanciales de diseño.

## Ciclo de laboratorio

1. **Problema:** definir escenario, objetivo y criterio de aceptación antes de intervenir.
2. **Fundamentos:** revisar únicamente los conceptos necesarios y sus referencias oficiales.
3. **Preparación:** datos sintéticos, versión y parámetros registrados, scripts reproducibles y ambiente aislado.
4. **Hipótesis inicial:** anticipar el comportamiento y qué observación permitiría confirmar o descartar la hipótesis.
5. **Línea base y diagnóstico:** guardar consulta, plan real, métricas y condiciones cuando corresponda. Identificar causas y distinguirlas de síntomas.
6. **Intervención:** justificar y aplicar un cambio por vez cuando sea viable; conservar el estado anterior y registrar costos potenciales.
7. **Validación:** verificar equivalencia funcional, comparar planes y métricas bajo condiciones comparables, repetir mediciones y registrar variabilidad. No confundir caché con mejora. Si no hay mejora, documentarlo.
8. **Conclusión y transferencia:** explicar causa, evidencia, resultado, limitaciones, efectos secundarios y cuándo aplicar o evitar la técnica en producción.

## Secuencia de interacción

Entregar una unidad funcional por vez con valores exactos, propósito y justificación. No dividir artificialmente acciones dependientes. Solicitar antes de cada captura su nombre previsto y propósito. Esperar el resultado, verificar qué demuestra y confirmar el nombre definitivo para guardarla. Registrar el resultado y avanzar solo después de validarlo. Si hay errores, diagnosticar antes de continuar. Avisar y solicitar aprobación antes de cambios relevantes o destructivos. Evitar controles, preguntas y capturas redundantes.

## Protocolo de medición

Registrar versión, volumen y distribución de datos, configuración relevante, concurrencia y condiciones de caché. Usar varias repeticiones (cinco como punto de partida, si corresponde), conservar valores individuales y mediana. Los costos del planner no son milisegundos. EXPLAIN ANALYZE ejecuta la sentencia: no usarlo sobre escrituras sin evaluar sus efectos. No forzar planes como solución sin justificarlo.

## Evidencias

Usar `NN-XX-descripcion-breve.png`: NN es capítulo, XX secuencia correlativa de dos dígitos dentro de todo el capítulo, descripción en minúsculas separadas por guiones. No reiniciar por laboratorio. Revisar numeración antes de asignar nombres. Las capturas son el registro visual principal; preservar adicionalmente consultas, planes completos, mediciones individuales y otras salidas textuales cuando sean necesarias para repetir o analizar el experimento. No exigir duplicaciones sin valor técnico.

Se propone `docs/images/tema-NN/` para imágenes; confirmar la estructura real antes de documentar enlaces. Guardar salidas extensas en `evidence/` del laboratorio cuando proceda. Cada evidencia debe quedar junto al paso que demuestra, con título, descripción, condiciones y enlace relativo. No afirmar que existe un archivo publicado sin verificarlo. Si falta evidencia, declararlo y mantener el estado adecuado. Excluir secretos y rotar credenciales reales expuestas.

## Estructura por laboratorio

README.md (objetivo, instrucciones y criterios), setup.sql y exercise.sql cuando correspondan, RESULTS.md (hipótesis, métricas, planes y conclusión), carpeta evidence/ si hay salidas extensas, cleanup.sql si procede. Mantener las soluciones separadas de las instrucciones iniciales. Consolidar además la documentación del capítulo en un Markdown completo con alcance, arquitectura cuando corresponda, laboratorios, evidencias junto a cada paso, resultados, problemas, aprendizajes y referencias; verificar ubicación y rutas en el repositorio antes de fijarlas.

## Criterios de cierre

El estudiante interpreta evidencias, justifica el diagnóstico y la intervención, verifica resultados y explica límites y aplicación a otro escenario. Registrar estado y dudas pendientes. Un resultado negativo puede ser un aprendizaje válido. Utilizar los estados de ROADMAP.md; no marcar Completado sin validación práctica. Evaluar un escenario integrador solo si aporta una comprobación nueva y su alcance fue acordado.

## Retrospectiva obligatoria por capítulo

Después de la consolidación documental y antes del cierre definitivo, evaluar el proceso con el estudiante: aspectos positivos, dificultades y oportunidades de mejora. Recoger su opinión, discutir alternativas y acordar expresamente cualquier cambio. La retrospectiva es obligatoria aunque no se identifiquen mejoras; en ese caso registrar que no se requieren cambios. Registrar capítulo, observaciones, análisis, decisiones, acciones y estado en `docs/RETROSPECTIVES.md`. Aplicar las mejoras aprobadas, verificar los entregables y sincronizar `METHODOLOGY.md`, `INSTRUCCIONES.md` y las instrucciones del proyecto antes de iniciar el siguiente capítulo.

## Finalidad y redacción documental

La documentación técnica de capítulos, laboratorios, scripts y `docs/FINDINGS.md` debe ser impersonal, autónoma, reproducible y reutilizable. No describir quién respondió, comprendió o necesitó refuerzo; expresar fundamentos, hipótesis, procedimientos, resultados y límites técnicos sin referencias personales. Conservar las evidencias y distinguir conocimientos conceptuales de hechos comprobados. Registrar comprensión, dudas y refuerzos en `docs/LEARNING-LOG.md`; estados en `ROADMAP.md`; decisiones de mejora en `docs/RETROSPECTIVES.md`. Revisar integralmente esta separación antes de entregar la documentación.

## Consolidación y responsabilidades

Consolidar cada dos laboratorios abordados y al cierre del capítulo, respetando cortes acordados. Antes de editar, releer la versión vigente y conservar contenido anterior. Entregar Markdown completo descargable en UTF-8 con BOM; para ROADMAP.md entregar el fragmento identificable o archivo completo cuando se acuerde, y para LEARNING-LOG y FINDINGS las incorporaciones pertinentes sin reescribir el historial. Actualizar el estado del capítulo y ROADMAP al cambiar el progreso, sin confundir actualización de estado con consolidación técnica.

Verificar numeración, rutas, resultados, estados, acentos, ausencia de secretos y comentarios editoriales. Separar contenido técnico del proceso documental y distinguir hallazgos reutilizables de detalles del capítulo. El estudiante guarda imágenes, incorpora archivos, realiza commits y publica. El asistente consulta y verifica GitHub; no escribe en remoto sin petición expresa. Identificar archivos pendientes de publicación.

Referencia principal: https://www.postgresql.org/docs/17/
