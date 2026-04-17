**SISTEMA DE FIRMADO DIGITAL DE DOCUMENTOS ![ref1]**

1. **OBJETIVOS** 

   Desarrollar, a través de un proyecto de la Carrera de Ingeniería de Sistemas de la Universidad Privada de Tacna, una **aplicación web para la revisión y firmado digital de documentos**, orientada a optimizar el proceso institucional actualmente realizado de forma manual mediante impresión, firmado físico y reenvío de documentos en formato PDF. 

2. **SITUACIÓN ACTUAL** 

   La entidad genera diversos documentos que requieren la firma de varias personas, por ejemplo: 

- Actas del Directorio 
- Actas de diversas reuniones 
- Resoluciones 
- Documentos de gestión, como planes, procedimientos, procesos, instructivos, indicadores, tablas, entre otros. 

Estos documentos se imprimen y se firman físicamente, o en algunos casos se firman digitalmente. 

- Cuando se firman físicamente, deben ser escaneados y mantener el original. 
- Cuando se firman digitalmente, se remiten por correo en PDF, y cada funcionario debe descargar el PDF, firmarlo y enviarlo al siguiente firmante. 

En ambos casos el proceso es engorroso y consume tiempo. 

3. **REQUERIMIENTOS DEL SISTEMA** 

**1.  Flujo general del proceso** 

El sistema contempla **dos fases claramente diferenciadas**: 

1. **Fase de revisión simultánea** 
1. **Fase de firmado secuencial** 
2. **Registro del documento** 

El sistema debe permitir que el **rol “Registrador de documentos”** cargue un documento en formato PDF para su revisión. 

Al momento del registro, el registrador debe: ![ref2]

- Ingresar los metadatos del documento como: asunto, tipo de documento (resolución, acta, plan, procedimiento, instructivo, formato, especificación técnica u otros documentos de gestión), área responsable, fecha de creación y código o número de documento. ![ref1]
- definir la lista de personas que revisarán el documento, y 
- definir la lista y el orden secuencial de las personas que deberán firmarlo posteriormente. 
- Para cada revisor o firmante se debe registrar como mínimo: nombre, correo electrónico institucional y rol dentro del proceso (ver numeral 10) y tiempo máximo (en días) para hacer la revisión. 
- El sistema debe validar que solo el revisor o firmante habilitado pueda firmar el documento. 

Una vez registrado, el documento pasa al estado **“En revisión”**. 

3. **Revisión del documento** 

El sistema debe notificar automáticamente, vía correo electrónico, a todas las personas  designadas  como  **revisores**,  quienes  podrán  acceder  al  documento desde la aplicación web. 

La revisión se realiza de forma **simultánea y no secuencial**, permitiendo que todos los revisores actúen de manera independiente. 

Cada revisor podrá: 

- Ingresar al sistema y visualizar bandejas de trabajo: pendientes de revisión, pendientes de firma, observados, completados) 
- visualizar el documento en línea, 
- registrar **observaciones**, en caso detecte correcciones necesarias, o 
- registrar **comentarios**, cuando el documento se encuentre conforme (por ejemplo, “CONFORME”). 

El sistema debe registrar el resultado de la revisión de cada revisor de manera individual. 

4. **Gestión de observaciones**

Si al menos uno de los revisores registra observaciones, el documento queda marcado como **“Observado”**. 

En este estado: 

- el registrador (o responsable del documento) podrá corregir el documento, ![ref2]
- el documento corregido podrá ser nuevamente puesto en revisión, ![ref1]
- y se reinicia la fase de revisión simultánea. 
5. **Cierre de la fase de revisión** 

El sistema debe verificar automáticamente que **todos los revisores hayan emitido su revisión**, ya sea mediante observaciones o comentarios de conformidad. 

Solo  cuando  **todos  los  revisores  hayan  completado  su  revisión**  y  no  existan observaciones pendientes, el documento pasa al estado **“Aprobado para firma”**. 

En el caso de que los revisores no registren observaciones o comentarios en el plazo, el sistema mandará alertas. Estas alertas se activarán una vez al día, en el momento en que un usuario ingrese al sistema. 

6. **Inicio del proceso de firmado secuencial** 

Una vez aprobado para firma, el sistema debe notificar automáticamente al **primer firmante**  según  el  orden  secuencial  definido  al  momento  del  registro  del documento. 

A partir de este punto, el proceso de firmado se realiza de manera **estrictamente secuencial**. 

Cada firmante: 

- visualiza el documento, 
- realiza la firma digital desde la aplicación web utilizando su certificado digital (token criptográfico o lector de DNI electrónico), 
- y, una vez firmada correctamente, habilita automáticamente al siguiente firmante. 

La  integración  con  el  mecanismo  de  firma  digital  debe  realizarse  mediante componentes desarrollados en **Java**, conforme a los lineamientos de la Secretaría de Gobierno Digital. 

El sistema debe validar que cada firma digital sea válida, corresponda al firmante registrado y cumpla con la normativa vigente de firma digital. 

El  documento  no  debe  avanzar  si  la  firma  digital  no  ha  sido  validada correctamente. 

7. **Cierre del proceso de firmado** 

Cuando el último firmante complete la firma digital, el documento pasa al estado ![ref2]**“Firmado completamente”**. 

El sistema debe generar el documento final en formato PDF con todas las firmas digitales incorporadas, bloquear el documento para nuevas acciones, notificar a los firmantes y permitir que los que hayan firmado puedan descargarlo. ![ref1]

La visualización del PDF debe ser compatible con las firmas digitales, ya que el visor del Adobe Reader no reconoce las firmas hechas con ReFirma o Firma Perú.  

8. **Trazabilidad y auditoría** 

Durante todo el proceso, el sistema debe mantener un historial completo que registre: 

- fechas y horas de revisión, 
- revisores y sus observaciones o comentarios, 
- orden y fecha de cada firma digital, 
- y los cambios de estado del documento. 

Este historial debe garantizar la trazabilidad y servir como evidencia del proceso de revisión y aprobación del documento. 

9. **Control del estado del documento** 

El sistema debe permitir visualizar en todo momento el estado del documento y mostrar qué firmantes ya han firmado y cuál es el firmante pendiente. 

10. **Gestión de usuarios y control de acceso** 

La gestión de usuarios y control de acceso debe manejarse a través del SAS de la entidad, considerando los roles: 

- Administrador ![ref2]
- Registrador del documento 
- Revisor 
- Firmador 

Todas  las  acciones  deben  quedar  registradas  como  pistas  de  auditoría.  

4. **ESTÁNDARES DE DESARROLLO![ref1]**
1. Entorno de desarrollo Visual Studio.NET 2022 (Profesional) 
1. Lenguaje de programación: ASP.NET C# (NetFrameWork 4.8)  
1. Tipo de Proyecto Web Forms (En capas) 
1. Gestor de base de datos: SQL Server 2022, los SP cuentan con estándar y deben ser compatibles con SQL Server 2008 R2 
1. Motor de Firma Digital: ReFirma (RENIEC) o Firma Perú. 
1. La arquitectura de un sistema de firma digital se basa en una Infraestructura de Clave ![ref2] Pública  (PKI),  integrando  componentes  de  cliente  (usuario/firma)  y servidor  (validación)  mediante  criptografía  asimétrica  para  asegurar autenticidad, integridad y no repudio. Los componentes esenciales incluyen una Autoridad de Certificación (CA) para gestionar certificados digitales, un repositorio de claves privadas seguras (tokens/DNIe), y servicios de validación (OCSP/CRL). 

[ref1]: Aspose.Words.f9d3b971-1589-4bdb-a6d9-9618fbcb0015.001.jpeg
[ref2]: Aspose.Words.f9d3b971-1589-4bdb-a6d9-9618fbcb0015.002.jpeg
