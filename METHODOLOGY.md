# Metodología de microaprendizaje

## Principios
Aprender por descubrimiento, evidencia y transferencia. No imponer duración fija. Avanzar cuando se demuestre comprensión, no por tiempo transcurrido. Un módulo puede dividirse en microlaboratorios.

## Ciclo de laboratorio
1. **Problema:** definir escenario, objetivo y criterio de aceptación antes de intervenir.
2. **Fundamentos:** revisar únicamente los conceptos necesarios y sus referencias oficiales.
3. **Preparación:** usaremos datos sintéticos, versión y parámetros registrados, scripts reproducibles y un ambiente aislado.
4. **Hipótesis inicial:** anticipar el comportamiento y qué observación permitiría confirmar o descartar la hipótesis.
5. **Línea base y diagnóstico:** guardar consulta, plan real, métricas y condiciones. Identificar causas y distinguirlas de síntomas.
6. **Intervención:** justificar y aplicar un cambio por vez cuando sea viable; conservar el estado anterior y registrar costos potenciales.
7. **Validación:** verificar equivalencia funcional, comparar planes y métricas bajo condiciones comparables, repetir mediciones y registrar variabilidad. No confundir caché con mejora. Si no hay mejora, documentarlo.
8. **Conclusión y transferencia:** explicar causa, evidencia, resultado, limitaciones, efectos secundarios y cuándo aplicar o evitar la técnica en producción.

## Protocolo de medición
Registrar versión, volumen y distribución de datos, configuración relevante, concurrencia y condiciones de caché. Usar varias repeticiones (cinco como punto de partida, si corresponde), conservar valores individuales y mediana. Los costos del planner no son milisegundos. EXPLAIN ANALYZE ejecuta la sentencia: no usarlo sobre escrituras sin evaluar sus efectos. No forzar planes como solución sin justificarlo.

## Estructura por laboratorio
README.md (objetivo, instrucciones y criterios), setup.sql y exercise.sql cuando correspondan, RESULTS.md (hipótesis, métricas, planes y conclusión), carpeta evidence/ si hay salidas extensas, cleanup.sql si procede. Mantener las soluciones separadas de las instrucciones iniciales.

## Criterios de cierre
El estudiante interpreta evidencias, justifica el diagnóstico y la intervención, verifica resultados y explica límites y aplicación a otro escenario. Registrar estado y dudas pendientes. Un resultado negativo puede ser un aprendizaje válido.

Referencia principal: https://www.postgresql.org/docs/17/
