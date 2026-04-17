**Información proyecto ZOFRATACNA** 

Respecto a sus consultas sobre el proyecto a desarrollarse por los equipos de estudiantes, se indica lo siguiente: 

- Se ha planteado la posibilidad de trabajar con el Sistema de Seguridad (SAS), en modalidad de desarrollo, al Oficial de Datos de ZOFRATACNA, quien recomienda excluir del proyecto las  funcionalidades  de  autenticación  y  acceso  al  SAS.  Por  tanto,  para  los  respectivos registros de usuario activo deberá usarse un selector simple que registre el valor de la columna  LoginUsuario  en una  variable  de  sesión:  Session("strUsuario"), misma  que  se sobreentiende es el resultado de la autenticación. 
- Se adjunta la estructura necesaria para acceder a los empleados: 

-- En la BD del proyecto (ej: FirmaDigital) 

CREATE VIEW dbo.VW\_EmpleadosActivos AS 

SELECT 

e.IDEmpleado, 

e.CodigoPersonal, 

e.Apellido, 

e.Nombre, 

e.Apellido + ', ' + e.Nombre AS NombreCompleto, 

e.LoginUsuario, 

e.Email, 

e.IDUnidadOrganica, 

e.IDCargo, 

e.IDSede, 

e.IdRol 

FROM [administracion].[dbo].[Empleado] e 

WHERE e.ActivoAsist = 1; 

Con  la  salvedad  que  en  caso  de  no  existir  data  en  el  campo  Email,  deberá  consignarse LoginUsuario + ‘@zofratacna.com.pe’. Se recomienda registrar un correo de prueba o de uno de los  integrantes  del  equipo  para  probar  las  notificaciones  al  correo  electrónico.  Por  favor, coordinar el método de envío de correo con mi persona cuando sea necesario. 

- Además se recomienda gestionar los datos no críticos o secundarios en una tabla Maestro, tal  como  se  muestra  como  ejemplo,  claro  está  adoptando  la  nomenclatura  y recomendaciones establecidas en el ET-003 Estándares de Desarrollo: 

-- ============================================= -- 1. MAESTRO (catálogo genérico) 

-- ============================================= 

CREATE TABLE Maestro ( 

IdMaestro INT IDENTITY(1,1) PRIMARY KEY, 

Tipo VARCHAR(50) NOT NULL, -- 'ESTADO\_DOC' | 'ROL\_FIRMANTE' | 'ESTADO\_FIRMA' Codigo VARCHAR(20) NOT NULL, 

Descripcion VARCHAR(100) NOT NULL, 

Orden INT DEFAULT 0, 

Activo BIT DEFAULT 1, 

CONSTRAINT UQ\_Maestro UNIQUE (Tipo, Codigo) 

); 

INSERT INTO Maestro (Tipo, Codigo, Descripcion, Orden) VALUES 

-- Estados del Documento 

('ESTADO\_DOC', 'REG', 'Registrado', 1), 

('ESTADO\_DOC', 'PEN', 'Pendiente de Firma', 2), 

('ESTADO\_DOC', 'FPAR', 'Firmado Parcialmente', 3), 

('ESTADO\_DOC', 'OBS', 'Observado', 4), 

('ESTADO\_DOC', 'FCOM', 'Firmado Completamente', 5), 

-- Roles del firmante (según REFIRMA) 

('ROL\_FIRMANTE', 'AUT', 'Autor', 1), 

('ROL\_FIRMANTE', 'CON', 'Conformidad', 2), 

('ROL\_FIRMANTE', 'VB', 'Visto Bueno', 3), 

-- Estado de cada firma individual 

('ESTADO\_FIRMA', 'PEN', 'Pendiente', 1), 

('ESTADO\_FIRMA', 'FIR', 'Firmado', 2), 

('ESTADO\_FIRMA', 'OBS', 'Observado', 3); 

- Sobre los ambientes de desarrollo y pruebas, de acuerdo a la recomendación del Oficial de Datos, y a lo coordinado en la última reunión presencial en sus oficinas, por lo pronto se solicita que los equipos trabajen de modo local. 
