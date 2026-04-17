# Instructivo de Interfaz Gráfica y Vistas Web (ASP.NET Web Forms)
**Proyecto:** Sistema de Firmado Digital de Documentos (SDF) - ZOFRATACNA

Este documento es un instructivo o "prompt" detallado para la construcción manual del frontend del sistema utilizando **ASP.NET C# Web Forms**. Describe cómo debe estructurarse visualmente cada vista, qué componentes genéricos debe tener y la lista exhaustiva de todos los archivos `.aspx` que componen el sistema completo.

---

## 1. Estructura Visual General (Recomendación para Master Page)

Para mantener consistencia, casi todas las vistas (excepto el Login) deben heredar de una estructura principal (idealmente una `Site.Master`) que contenga:

*   **Menú Lateral Izquierdo (Sidebar):** Contendrá la navegación principal dependiendo del rol. Elementos comunes requeridos:
    *   `Panel de Control` (Dashboard principal con métricas/resumen).
    *   `Mis Documentos` (Bandeja de entrada/trabajo principal).
    *   `Registrar Nuevo` (Solo para quienes inician flujos).
    *   `Archivo` (Histórico de documentos ya procesados).
    *   `Ajustes` (Configuraciones de la cuenta o delegación).
    *   `Soporte / Ayuda` (Acceso a manuales o tickets).
*   **Barra Superior (Top Navbar):**
    *   Lado izquierdo: Navegación rápida por pestañas (ej. *Documentos*, *Directorio*, *Registro de Auditoría*).
    *   Lado derecho superior: **Mi Perfil** (Foto/Iniciales del usuario, nombre, rol actual y el botón de **Cerrar Sesión**).

---

## 2. Inventario Exhaustivo de Vistas a Crear (`.aspx`)

Aquí se detallan todos los formularios web que debes crear manualmente, categorizados por los módulos del estándar **ET-003**.

### Módulo de Acceso (Raíz)
Visualmente es una pantalla limpia, centrada, con el logo de ZOFRATACNA y la selección de rol. Sin menú lateral ni barra superior.
*   `frmLogin.aspx` → Pantalla de inicio de sesión y selector de rol.

### Módulo del Registrador (`/Formularios/Documentos/`)
Este es el usuario que inicia el flujo. Su panel debe estar enfocado en la creación y el seguimiento general.
*   `frmDashboardRegistrador.aspx` → **Panel de Control**: Tarjetas resumen (Docs. en proceso, observados, finalizados).
*   `frmMisDocumentos.aspx` → **Mis Documentos**: Bandeja de documentos que él ha subido y su estado actual.
*   `frmRegistrarDocumento.aspx` → **Registrar Nuevo**: Formulario pesado con metadatos, carga de PDF y selectores para designar Revisores y Firmantes.
*   `frmArchivoRegistrador.aspx` → **Archivo**: Histórico de documentos ya firmados completamente.
*   `frmDirectorio.aspx` → **Directorio**: Lista de empleados activos obtenidos de la base de datos (VW_EmpleadosActivos).
*   `frmSeguimientoAuditoria.aspx` → **Registro de Auditoría**: Línea de tiempo (trazabilidad) de dónde está atascado un documento.

### Módulo del Revisor (`/Formularios/Revision/`)
Este usuario valida el documento de forma simultánea. Su panel se enfoca en la lectura profunda.
*   `frmDashboardRevisor.aspx` → **Panel de Control**: Resumen de revisiones pendientes vs. completadas.
*   `frmMisDocumentosRevisor.aspx` → **Mis Documentos**: Bandeja exclusiva de los PDFs que requieren su lectura.
*   `frmInterfazRevisor.aspx` → **Interfaz de Revisión**: Visualizador del PDF embebido y un panel lateral derecho para agregar "Observaciones" o dar "Conformidad".
*   `frmArchivoRevisor.aspx` → **Archivo**: Histórico de todos los documentos en los que ya dio su visto bueno.

### Módulo del Firmador (`/Formularios/Firma/`)
El firmador actúa secuencialmente. Su interfaz debe ser muy formal e integrarse con el software de firma.
*   `frmDashboardFirmante.aspx` → **Panel de Control**: Alertas de documentos urgentes esperando su firma.
*   `frmMisDocumentosFirmante.aspx` → **Mis Documentos**: Lista estricta de documentos donde ya es su "turno" de firmar.
*   `frmPortalFirma.aspx` → **Proceso de Firma**: Visualizador de PDF (que soporte ver firmas anteriores) y el botón de acción para invocar a "ReFirma / Firma Perú".
*   `frmArchivoFirmante.aspx` → **Archivo**: Repositorio de los documentos que él ya firmó exitosamente.

### Módulo del Administrador (`/Formularios/Administracion/`)
Control total del sistema.
*   `frmDashboardAdmin.aspx` → **Panel de Control**: Métricas generales del sistema (uso, cuellos de botella).
*   `frmConfiguracionAdmin.aspx` → **Ajustes / Configuración**: Mantenimiento de la tabla `GEN_Maestro` (Estados, Roles).
*   `frmReporteExhaustivo.aspx` → **Reportes**: Generación de reportes PDF/Excel sobre la eficiencia del proceso de firmado.
*   `frmGestionUsuarios.aspx` → **Gestión de Accesos**: Asignación de roles y perfiles a los empleados (conteo de contraseñas, reseteos).

### Vistas Comunes / Transversales (`/Formularios/Comunes/`)
Vistas accesibles desde el rincón superior derecho o inferior del sidebar para todos los usuarios.
*   `frmMiPerfil.aspx` → **Mi Perfil**: Cambio de contraseña (vigencia de 3 meses según ET-003), actualización de foto o correo alterno.
*   `frmSoporte.aspx` → **Soporte / Ayuda**: Guías de usuario, manual del sistema y formulario de contacto con TI.

---

## 3. Instrucciones de Diseño (Prompt Visual)

Cuando construyas estos `.aspx` basándote en los HTML de la carpeta `stitch`, asegúrate de cumplir estas reglas visuales:

1.  **Reemplazo de Marca:** Cualquier mención a "El Libro Académico" o "Academic Ledger" debe cambiarse categóricamente a **SDF ZOFRATACNA**.
2.  **Ubicación de 'Mi Perfil':** Extrae la lógica del usuario de la sesión (`Session("strUsuario")`) y muéstralo en la esquina superior derecha del Navbar en todos los Dashboards, acompañado del enlace de "Cerrar Sesión".
3.  **Menú Lateral Fijo:** Asegúrate de que el sidebar izquierdo contenga la lista exacta mencionada arriba (*Panel de Control, Mis Documentos, Registrar Nuevo (si aplica), Archivo, Ajustes*). Usa iconos acordes (ej. Material Symbols).
4.  **Flujo sin Validaciones (Mockup):** Por el momento, asegúrate de que todos los hipervínculos (`<a href="...">`) naveguen limpiamente de un `.aspx` a otro sin requerir validaciones complejas de C# en el servidor, permitiendo una demostración navegable fluida al cliente.
