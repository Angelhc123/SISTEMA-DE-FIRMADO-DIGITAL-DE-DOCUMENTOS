# Sistema de Diseño: Documentación Técnica y Creativa

## 1. El Norte Creativo: "Arquitectura de Confianza"
Este sistema de diseño trasciende la estética gubernamental tradicional para posicionarse en la intersección de la **autoridad institucional** y la **fluidez digital**. El concepto central es la "Arquitectura de Confianza", donde la rigidez de un sistema legal se suaviza mediante una interfaz que respira. 

No estamos construyendo un simple formulario; estamos diseñando un entorno de seguridad jurídica. Rompemos la monotonía mediante una jerarquía tipográfica editorial y una profundidad tonal que elimina la necesidad de líneas divisorias agresivas, permitiendo que el flujo de firma sea intuitivo, imponente y sereno.

---

## 2. Paleta de Color y Estrategia Tonal

La paleta se aleja del azul corporativo genérico, optando por un **Deep Midnight (`primary`)** que evoca la tinta de un sello oficial, contrastado con una escala de grises cálidos y superficies de "vidrio esmerilado".

### Jerarquía de Superficies (Nesting)
Prohibimos la "Regla de la Línea de 1px". La separación de secciones se logra exclusivamente mediante el cambio de contenedores:
*   **Fondo Base:** `background` (#f8f9fb).
*   **Contenedor de Navegación (Sidebar):** `surface_container_low` (#f2f4f6) para una base sólida.
*   **Tarjetas de Datos:** `surface_container_lowest` (#ffffff) para resaltar la información crítica.
*   **Áreas de Acción:** `surface_container` (#eceef0) para agrupar elementos relacionados.

### El Efecto Cristal (Glassmorphism)
Para elementos flotantes o el Navbar superior, utilizaremos:
*   **Color:** `surface_bright` (#f8f9fb) al 85% de opacidad.
*   **Efecto:** `backdrop-blur: 12px`.
*   **Propósito:** Integrar el contenido que se desplaza debajo, eliminando cortes visuales bruscos.

---

## 3. Tipografía Editorial

Utilizamos un emparejamiento de **Public Sans** (Autoridad) e **Inter** (Funcionalidad).

*   **Display & Headlines (Public Sans):** Reservadas para títulos de sección y grandes métricas. El peso debe ser *SemiBold* para transmitir firmeza institucional.
*   **Body & Titles (Inter):** Optimizada para legibilidad en tablas de datos y formularios densos.
*   **Interlineado:** Se requiere un `line-height` de 1.5 en el cuerpo de texto para evitar la fatiga visual en documentos legales largos.

---

## 4. Elevación y Profundidad: El Adiós al Borde

La profundidad se comunica mediante capas, no sombras genéricas.

*   **Layering Principle:** Un documento en estado "Pendiente" debe reposar en una tarjeta `surface_container_lowest` sobre un fondo `surface_container_low`. La diferencia de 2-3% en luminancia es suficiente para el ojo humano.
*   **Sombras Ambientales:** Solo para modales de firma. Usar `box-shadow: 0 20px 40px rgba(25, 28, 30, 0.06)`. Debe parecer luz natural, no un filtro digital.
*   **Ghost Borders:** Si la accesibilidad exige un límite (ej. inputs), usar `outline_variant` (#c3c6d1) con una opacidad del 15%. Nunca usar negro sólido o grises oscuros para bordes.

---

## 5. Componentes de Firma Digital

### Botones (Acciones de Estado)
*   **Primario (Firmar):** Fondo `primary` (#001e40), texto `on_primary`. Aplicar un degradado sutil de `primary` a `primary_container` para evitar la planitud.
*   **Secundario (Descargar):** Fondo `secondary_container`, texto `on_secondary_container`. Sin bordes.
*   **Terciario (Cancelar):** Texto `primary` sobre fondo transparente.

### Badges de Estado (Indicadores de Flujo)
Los estados no deben usar colores vibrantes que distraigan, sino tonos institucionales:
*   **Registrado:** `secondary_fixed` con texto `on_secondary_fixed_variant`.
*   **Pendiente:** `tertiary_fixed` con texto `on_tertiary_fixed_variant` (tonos tierra/alerta suave).
*   **Observado:** `error_container` con texto `on_error_container`.
*   **Firmado:** Un degradado sutil de `primary_fixed` a `primary_fixed_dim`.

### Tablas de Datos (Listado de Documentos)
*   **Adiós a las celdas:** Eliminar bordes verticales. Las filas se separan por un espacio de `0.5rem` (Spacing Scale) y un cambio de color al hacer `hover` a `surface_container_high`.
*   **Encabezados:** Uso de `label-md` en `outline` (gris medio) y todo en mayúsculas para diferenciar del contenido.

### Campos de Entrada (Formularios)
*   **Estado Activo:** El campo no cambia de color de borde, sino que gana una sutil elevación y un "anillo de enfoque" en `primary` al 10% de opacidad.

---

## 6. Layout: Master Page Estructural

El sistema utiliza una estructura de **Asimetría Intencional**:
1.  **Sidebar Fijo (Izquierda):** Ancho de 280px. Color `surface_container_low`. Los iconos deben ser de trazo fino (Light) para mantener la elegancia.
2.  **Navbar (Superior):** Glassmorphism activo. Contiene el nombre del usuario y notificaciones.
3.  **Canvas de Contenido:** Margen interno (padding) generoso de `2.5rem`. El contenido no debe ocupar todo el ancho; se recomienda un `max-width` de 1200px para mantener la lectura editorial.

---

## 7. Do's & Don'ts (Prácticas Recomendadas)

### Sí (Do)
*   **Usa el Espacio en Blanco:** Es tu herramienta más potente para denotar importancia.
*   **Micro-interacciones:** Los cambios de estado de los botones deben tener una transición de 200ms `ease-out`.
*   **Jerarquía de Color:** Usa el color `tertiary` solo para llamar la atención sobre errores o acciones críticas.

### No (Don't)
*   **No uses bordes negros:** El contraste 100% cansa la vista en entornos de oficina.
*   **No amontones información:** Si una tabla tiene más de 8 columnas, implementa una vista de detalle en lugar de comprimir las celdas.
*   **No uses sombras pesadas:** Si el usuario "siente" la sombra, es demasiado oscura. Debe ser casi imperceptible.

---

Este sistema asegura que cada interacción en el **SDF de ZOFRATACNA** se sienta como una extensión de su prestigio institucional: limpio, inquebrantable y profundamente profesional.