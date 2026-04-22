

DECLARE @FECHA SMALLDATETIME = GETDATE();

INSERT INTO FIR_Usuario 
(IDUsuario, Correo, Clave, Rol, Activo, IDUsuarioCreador, FechaCreacion)
VALUES

-- ADMINISTRADORES
('admin', 'admin@zofra.com', '123456', 'ADMIN', 1, 'admin', @FECHA),
('admin2', 'admin2@zofra.com', '123456', 'ADMIN', 1, 'admin', @FECHA),

-- REGISTRADORES
('reg1', 'registrador1@zofra.com', '123456', 'REG', 1, 'admin', @FECHA),
('reg2', 'registrador2@zofra.com', '123456', 'REG', 1, 'admin', @FECHA),

-- REVISORES (aunque no estén en dropdown, tu sistema los usa)
('rev1', 'revisor1@zofra.com', '123456', 'REVISOR', 1, 'admin', @FECHA),
('rev2', 'revisor2@zofra.com', '123456', 'REVISOR', 1, 'admin', @FECHA),

-- FIRMANTES
('firm1', 'firmante1@zofra.com', '123456', 'FIR', 1, 'admin', @FECHA),
('firm2', 'firmante2@zofra.com', '123456', 'FIR', 1, 'admin', @FECHA),
('firm3', 'firmante3@zofra.com', '123456', 'FIR', 1, 'admin', @FECHA),

-- USUARIO INACTIVO (para prueba)
('bloq1', 'bloqueado@zofra.com', '123456', 'REG', 0, 'admin', @FECHA);