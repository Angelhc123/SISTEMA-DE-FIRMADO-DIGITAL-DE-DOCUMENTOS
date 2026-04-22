-- =============================================
-- SISTEMA DE FIRMADO DIGITAL DE DOCUMENTOS
-- Base de Datos: FirmaDigital
-- Nemónico: FIR
-- Estándar: ET-003 Revisión 4
-- =============================================

USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'FirmaDigital')
    CREATE DATABASE FirmaDigital;
GO

USE FirmaDigital;
GO

-- =============================================
-- DROP FOREIGN KEYS Y TABLAS EN ORDEN INVERSO
-- =============================================
IF OBJECT_ID('dbo.FIR_DocumentoFirmanteAuditoria', 'U') IS NOT NULL DROP TABLE dbo.FIR_DocumentoFirmanteAuditoria;
IF OBJECT_ID('dbo.FIR_DocumentoFirmante', 'U') IS NOT NULL DROP TABLE dbo.FIR_DocumentoFirmante;
IF OBJECT_ID('dbo.FIR_DocumentoRevisionAuditoria', 'U') IS NOT NULL DROP TABLE dbo.FIR_DocumentoRevisionAuditoria;
IF OBJECT_ID('dbo.FIR_DocumentoRevision', 'U') IS NOT NULL DROP TABLE dbo.FIR_DocumentoRevision;
IF OBJECT_ID('dbo.FIR_DocumentoVersionAuditoria', 'U') IS NOT NULL DROP TABLE dbo.FIR_DocumentoVersionAuditoria;
IF OBJECT_ID('dbo.FIR_DocumentoVersion', 'U') IS NOT NULL DROP TABLE dbo.FIR_DocumentoVersion;
IF OBJECT_ID('dbo.FIR_AlertaAuditoria', 'U') IS NOT NULL DROP TABLE dbo.FIR_AlertaAuditoria;
IF OBJECT_ID('dbo.FIR_Alerta', 'U') IS NOT NULL DROP TABLE dbo.FIR_Alerta;
IF OBJECT_ID('dbo.FIR_HistorialEstado', 'U') IS NOT NULL DROP TABLE dbo.FIR_HistorialEstado;
IF OBJECT_ID('dbo.FIR_DocumentoAuditoria', 'U') IS NOT NULL DROP TABLE dbo.FIR_DocumentoAuditoria;
IF OBJECT_ID('dbo.FIR_Documento', 'U') IS NOT NULL DROP TABLE dbo.FIR_Documento;
IF OBJECT_ID('dbo.FIR_UsuarioAuditoria', 'U') IS NOT NULL DROP TABLE dbo.FIR_UsuarioAuditoria;
IF OBJECT_ID('dbo.FIR_Usuario', 'U') IS NOT NULL DROP TABLE dbo.FIR_Usuario;
IF OBJECT_ID('dbo.FIR_MaestroAuditoria', 'U') IS NOT NULL DROP TABLE dbo.FIR_MaestroAuditoria;
IF OBJECT_ID('dbo.FIR_Maestro', 'U') IS NOT NULL DROP TABLE dbo.FIR_Maestro;
GO

-- =============================================
-- 1. TABLA MAESTRO (catálogo genérico)
-- =============================================
CREATE TABLE dbo.FIR_Maestro (
    IDMaestro    INT          IDENTITY(1,1) NOT NULL,
    Tipo         VARCHAR(50)  NOT NULL,
    Codigo       VARCHAR(20)  NOT NULL,
    Descripcion  VARCHAR(100) NOT NULL,
    Orden        INT          NOT NULL CONSTRAINT df_FIR_Maestro_Orden DEFAULT(0),
    Activo       BIT          NOT NULL CONSTRAINT df_FIR_Maestro_Activo DEFAULT(1),
    IDUsuarioCreador      VARCHAR(15) NOT NULL,
    FechaCreacion         SMALLDATETIME NOT NULL,
    IDUsuarioModificador  VARCHAR(15) NULL,
    FechaModificacion     SMALLDATETIME NULL,
    CONSTRAINT pk_FIR_Maestro PRIMARY KEY (IDMaestro),
    CONSTRAINT uq_FIR_Maestro_TipoCodigo UNIQUE (Tipo, Codigo)
);
GO

CREATE TABLE dbo.FIR_MaestroAuditoria (
    IDMaestroAuditoria INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    IDMaestro    INT          NOT NULL,
    Tipo         VARCHAR(50)  NOT NULL,
    Codigo       VARCHAR(20)  NOT NULL,
    Descripcion  VARCHAR(100) NOT NULL,
    Orden        INT          NOT NULL,
    Activo       BIT          NOT NULL,
    IDUsuarioCreador      VARCHAR(15) NOT NULL,
    FechaCreacion         SMALLDATETIME NOT NULL,
    IDUsuarioModificador  VARCHAR(15) NULL,
    FechaModificacion     SMALLDATETIME NULL,
    TipoOperacion  CHAR(1)       NOT NULL,
    IDUsuario      VARCHAR(15)   NOT NULL,
    IDEquipo       VARCHAR(15)   NULL,
    FechaCambio    SMALLDATETIME NOT NULL
);
GO

-- =============================================
-- 1.5 TABLA USUARIO
-- =============================================
CREATE TABLE dbo.FIR_Usuario (
    IDUsuario    VARCHAR(15)  NOT NULL,
    Correo       VARCHAR(100) NOT NULL,
    Clave        VARCHAR(50)  NOT NULL,
    Rol          VARCHAR(50)  NOT NULL,
    Activo       BIT          NOT NULL CONSTRAINT df_FIR_Usuario_Activo DEFAULT(1),
    IDUsuarioCreador      VARCHAR(15) NOT NULL,
    FechaCreacion         SMALLDATETIME NOT NULL,
    IDUsuarioModificador  VARCHAR(15) NULL,
    FechaModificacion     SMALLDATETIME NULL,
    CONSTRAINT pk_FIR_Usuario PRIMARY KEY (IDUsuario)
);
GO

CREATE TABLE dbo.FIR_UsuarioAuditoria (
    IDUsuarioAuditoria INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    IDUsuario    VARCHAR(15)  NOT NULL,
    Correo       VARCHAR(100) NOT NULL,
    Clave        VARCHAR(50)  NOT NULL,
    Rol          VARCHAR(50)  NOT NULL,
    Activo       BIT          NOT NULL,
    IDUsuarioCreador      VARCHAR(15) NOT NULL,
    FechaCreacion         SMALLDATETIME NOT NULL,
    IDUsuarioModificador  VARCHAR(15) NULL,
    FechaModificacion     SMALLDATETIME NULL,
    TipoOperacion  CHAR(1)       NOT NULL,
    IDUsuarioAccion VARCHAR(15)  NOT NULL,
    IDEquipo       VARCHAR(15)   NULL,
    FechaCambio    SMALLDATETIME NOT NULL
);
GO

-- =============================================
-- 2. TABLA DOCUMENTO
-- =============================================
CREATE TABLE dbo.FIR_Documento (
    IDDocumento        INT           IDENTITY(1,1) NOT NULL,
    Asunto             VARCHAR(300)  NOT NULL,
    IDTipoDoc          INT           NOT NULL,
    AreaResponsable    VARCHAR(150)  NOT NULL,
    FechaCreacionDoc   DATE          NOT NULL,
    CodigoDocumento    VARCHAR(50)   NOT NULL,
    IDEstadoDoc        INT           NOT NULL,
    DiasMaxRevision    INT           NOT NULL CONSTRAINT df_FIR_Documento_DiasMaxRevision DEFAULT(5),
    IDUsuarioCreador      VARCHAR(15)   NOT NULL,
    FechaCreacion         SMALLDATETIME NOT NULL,
    IDUsuarioModificador  VARCHAR(15)   NULL,
    FechaModificacion     SMALLDATETIME NULL,
    CONSTRAINT pk_FIR_Documento PRIMARY KEY (IDDocumento),
    CONSTRAINT fk_FIR_Documento_TipoDoc   FOREIGN KEY (IDTipoDoc)   REFERENCES dbo.FIR_Maestro(IDMaestro),
    CONSTRAINT fk_FIR_Documento_EstadoDoc FOREIGN KEY (IDEstadoDoc) REFERENCES dbo.FIR_Maestro(IDMaestro),
    CONSTRAINT ch_FIR_Documento_DiasMaxRevision CHECK (DiasMaxRevision > 0)
);
GO

CREATE TABLE dbo.FIR_DocumentoAuditoria (
    IDDocumentoAuditoria  INT           IDENTITY(1,1) NOT NULL PRIMARY KEY,
    IDDocumento           INT           NOT NULL,
    Asunto                VARCHAR(300)  NOT NULL,
    IDTipoDoc             INT           NOT NULL,
    AreaResponsable       VARCHAR(150)  NOT NULL,
    FechaCreacionDoc      DATE          NOT NULL,
    CodigoDocumento       VARCHAR(50)   NOT NULL,
    IDEstadoDoc           INT           NOT NULL,
    DiasMaxRevision       INT           NOT NULL,
    IDUsuarioCreador      VARCHAR(15)   NOT NULL,
    FechaCreacion         SMALLDATETIME NOT NULL,
    IDUsuarioModificador  VARCHAR(15)   NULL,
    FechaModificacion     SMALLDATETIME NULL,
    TipoOperacion  CHAR(1)       NOT NULL,
    IDUsuario      VARCHAR(15)   NOT NULL,
    IDEquipo       VARCHAR(15)   NULL,
    FechaCambio    SMALLDATETIME NOT NULL
);
GO

-- =============================================
-- 3. TABLA DOCUMENTO VERSION
-- Guarda cada iteracion (subida) del PDF para revision
-- =============================================
CREATE TABLE dbo.FIR_DocumentoVersion (
    IDDocVersion       INT           IDENTITY(1,1) NOT NULL,
    IDDocumento        INT           NOT NULL,
    RutaArchivo        VARCHAR(500)  NOT NULL,
    Iteracion          INT           NOT NULL,
    FechaSubida        SMALLDATETIME NOT NULL,
    IDUsuarioCreador      VARCHAR(15)   NOT NULL,
    FechaCreacion         SMALLDATETIME NOT NULL,
    IDUsuarioModificador  VARCHAR(15)   NULL,
    FechaModificacion     SMALLDATETIME NULL,
    CONSTRAINT pk_FIR_DocumentoVersion PRIMARY KEY (IDDocVersion),
    CONSTRAINT fk_FIR_DocumentoVersion_Documento FOREIGN KEY (IDDocumento) REFERENCES dbo.FIR_Documento(IDDocumento)
);
GO

CREATE TABLE dbo.FIR_DocumentoVersionAuditoria (
    IDDocVersionAuditoria INT           IDENTITY(1,1) NOT NULL PRIMARY KEY,
    IDDocVersion       INT           NOT NULL,
    IDDocumento        INT           NOT NULL,
    RutaArchivo        VARCHAR(500)  NOT NULL,
    Iteracion          INT           NOT NULL,
    FechaSubida        SMALLDATETIME NOT NULL,
    IDUsuarioCreador      VARCHAR(15)   NOT NULL,
    FechaCreacion         SMALLDATETIME NOT NULL,
    IDUsuarioModificador  VARCHAR(15)   NULL,
    FechaModificacion     SMALLDATETIME NULL,
    TipoOperacion  CHAR(1)       NOT NULL,
    IDUsuario      VARCHAR(15)   NOT NULL,
    IDEquipo       VARCHAR(15)   NULL,
    FechaCambio    SMALLDATETIME NOT NULL
);
GO

-- =============================================
-- 4. TABLA DOCUMENTO REVISOR
-- Revisión de una iteración (versión) específica
-- =============================================
CREATE TABLE dbo.FIR_DocumentoRevision (
    IDRevision         INT           IDENTITY(1,1) NOT NULL,
    IDDocVersion       INT           NOT NULL,
    IDUsuarioRevisor   VARCHAR(15)   NOT NULL,
    IDEstadoRevision   INT           NOT NULL,
    Correccion         VARCHAR(1000) NULL,
    FechaRevision      SMALLDATETIME NULL,
    DiasMaxRevision    INT           NOT NULL CONSTRAINT df_FIR_DocumentoRevision_Dias DEFAULT(5),
    IDUsuarioCreador      VARCHAR(15)   NOT NULL,
    FechaCreacion         SMALLDATETIME NOT NULL,
    IDUsuarioModificador  VARCHAR(15)   NULL,
    FechaModificacion     SMALLDATETIME NULL,
    CONSTRAINT pk_FIR_DocumentoRevision PRIMARY KEY (IDRevision),
    CONSTRAINT fk_FIR_DocumentoRevision_DocVersion FOREIGN KEY (IDDocVersion) REFERENCES dbo.FIR_DocumentoVersion(IDDocVersion),
    CONSTRAINT fk_FIR_DocumentoRevision_Usuario FOREIGN KEY (IDUsuarioRevisor) REFERENCES dbo.FIR_Usuario(IDUsuario),
    CONSTRAINT fk_FIR_DocumentoRevision_EstadoRevision FOREIGN KEY (IDEstadoRevision) REFERENCES dbo.FIR_Maestro(IDMaestro),
    CONSTRAINT uq_FIR_DocumentoRevision_DocRevisor UNIQUE (IDDocVersion, IDUsuarioRevisor),
    CONSTRAINT ch_FIR_DocumentoRevision_Dias CHECK (DiasMaxRevision > 0)
);
GO

CREATE TABLE dbo.FIR_DocumentoRevisionAuditoria (
    IDRevisionAuditoria INT           IDENTITY(1,1) NOT NULL PRIMARY KEY,
    IDRevision         INT           NOT NULL,
    IDDocVersion       INT           NOT NULL,
    IDUsuarioRevisor   VARCHAR(15)   NOT NULL,
    IDEstadoRevision   INT           NOT NULL,
    Correccion         VARCHAR(1000) NULL,
    FechaRevision      SMALLDATETIME NULL,
    DiasMaxRevision    INT           NOT NULL,
    IDUsuarioCreador      VARCHAR(15)   NOT NULL,
    FechaCreacion         SMALLDATETIME NOT NULL,
    IDUsuarioModificador  VARCHAR(15)   NULL,
    FechaModificacion     SMALLDATETIME NULL,
    TipoOperacion  CHAR(1)       NOT NULL,
    IDUsuario      VARCHAR(15)   NOT NULL,
    IDEquipo       VARCHAR(15)   NULL,
    FechaCambio    SMALLDATETIME NOT NULL
);
GO

-- =============================================
-- 5. TABLA DOCUMENTO FIRMANTE
-- Firmado secuencial del documento
-- =============================================
CREATE TABLE dbo.FIR_DocumentoFirmante (
    IDFirmante          INT           IDENTITY(1,1) NOT NULL,
    IDDocumento         INT           NOT NULL,
    IDUsuarioFirmante   VARCHAR(15)   NOT NULL,
    Orden               INT           NOT NULL,
    IDRolFirmante       INT           NOT NULL,
    IDEstadoFirma       INT           NOT NULL,
    FechaFirma          SMALLDATETIME NULL,
    ObservacionFirma    VARCHAR(500)  NULL,
    SerieToken          VARCHAR(100)  NULL,
    HuellaCertificado   VARCHAR(200)  NULL,
    IDDocVersionFirmada INT           NULL,
    IDUsuarioCreador      VARCHAR(15)   NOT NULL,
    FechaCreacion         SMALLDATETIME NOT NULL,
    IDUsuarioModificador  VARCHAR(15)   NULL,
    FechaModificacion     SMALLDATETIME NULL,
    CONSTRAINT pk_FIR_DocumentoFirmante PRIMARY KEY (IDFirmante),
    CONSTRAINT fk_FIR_DocumentoFirmante_Documento FOREIGN KEY (IDDocumento) REFERENCES dbo.FIR_Documento(IDDocumento),
    CONSTRAINT fk_FIR_DocumentoFirmante_Usuario FOREIGN KEY (IDUsuarioFirmante) REFERENCES dbo.FIR_Usuario(IDUsuario),
    CONSTRAINT fk_FIR_DocumentoFirmante_RolFirmante FOREIGN KEY (IDRolFirmante) REFERENCES dbo.FIR_Maestro(IDMaestro),
    CONSTRAINT fk_FIR_DocumentoFirmante_EstadoFirma FOREIGN KEY (IDEstadoFirma) REFERENCES dbo.FIR_Maestro(IDMaestro),
    CONSTRAINT fk_FIR_DocumentoFirmante_DocVersion FOREIGN KEY (IDDocVersionFirmada) REFERENCES dbo.FIR_DocumentoVersion(IDDocVersion),
    CONSTRAINT uq_FIR_DocumentoFirmante_DocOrden UNIQUE (IDDocumento, Orden),
    CONSTRAINT uq_FIR_DocumentoFirmante_DocEmpleado UNIQUE (IDDocumento, IDUsuarioFirmante),
    CONSTRAINT ch_FIR_DocumentoFirmante_Orden CHECK (Orden > 0)
);
GO

CREATE TABLE dbo.FIR_DocumentoFirmanteAuditoria (
    IDFirmanteAuditoria INT           IDENTITY(1,1) NOT NULL PRIMARY KEY,
    IDFirmante          INT           NOT NULL,
    IDDocumento         INT           NOT NULL,
    IDUsuarioFirmante   VARCHAR(15)   NOT NULL,
    Orden               INT           NOT NULL,
    IDRolFirmante       INT           NOT NULL,
    IDEstadoFirma       INT           NOT NULL,
    FechaFirma          SMALLDATETIME NULL,
    ObservacionFirma    VARCHAR(500)  NULL,
    SerieToken          VARCHAR(100)  NULL,
    HuellaCertificado   VARCHAR(200)  NULL,
    IDDocVersionFirmada INT           NULL,
    IDUsuarioCreador      VARCHAR(15)   NOT NULL,
    FechaCreacion         SMALLDATETIME NOT NULL,
    IDUsuarioModificador  VARCHAR(15)   NULL,
    FechaModificacion     SMALLDATETIME NULL,
    TipoOperacion  CHAR(1)       NOT NULL,
    IDUsuario      VARCHAR(15)   NOT NULL,
    IDEquipo       VARCHAR(15)   NULL,
    FechaCambio    SMALLDATETIME NOT NULL
);
GO

-- =============================================
-- 6. TABLA HISTORIAL ESTADO
-- =============================================
CREATE TABLE dbo.FIR_HistorialEstado (
    IDHistorial       INT           IDENTITY(1,1) NOT NULL,
    IDDocumento       INT           NOT NULL,
    IDEstadoAnterior  INT           NULL,
    IDEstadoNuevo     INT           NOT NULL,
    Observacion       VARCHAR(500)  NULL,
    IDUsuarioCreador  VARCHAR(15)   NOT NULL,
    FechaCreacion     SMALLDATETIME NOT NULL,
    CONSTRAINT pk_FIR_HistorialEstado PRIMARY KEY (IDHistorial),
    CONSTRAINT fk_FIR_HistorialEstado_Documento FOREIGN KEY (IDDocumento) REFERENCES dbo.FIR_Documento(IDDocumento),
    CONSTRAINT fk_FIR_HistorialEstado_EstadoAnterior FOREIGN KEY (IDEstadoAnterior) REFERENCES dbo.FIR_Maestro(IDMaestro),
    CONSTRAINT fk_FIR_HistorialEstado_EstadoNuevo FOREIGN KEY (IDEstadoNuevo) REFERENCES dbo.FIR_Maestro(IDMaestro)
);
GO

-- =============================================
-- 7. TABLA ALERTA
-- =============================================
CREATE TABLE dbo.FIR_Alerta (
    IDAlerta      INT           IDENTITY(1,1) NOT NULL,
    IDDocumento   INT           NOT NULL,
    IDUsuario     VARCHAR(15)   NOT NULL,
    IDTipoAlerta  INT           NOT NULL,
    Enviada       BIT           NOT NULL CONSTRAINT df_FIR_Alerta_Enviada DEFAULT(0),
    FechaEnvio    SMALLDATETIME NULL,
    IDUsuarioCreador      VARCHAR(15)   NOT NULL,
    FechaCreacion         SMALLDATETIME NOT NULL,
    IDUsuarioModificador  VARCHAR(15)   NULL,
    FechaModificacion     SMALLDATETIME NULL,
    CONSTRAINT pk_FIR_Alerta PRIMARY KEY (IDAlerta),
    CONSTRAINT fk_FIR_Alerta_Documento FOREIGN KEY (IDDocumento) REFERENCES dbo.FIR_Documento(IDDocumento),
    CONSTRAINT fk_FIR_Alerta_Usuario FOREIGN KEY (IDUsuario) REFERENCES dbo.FIR_Usuario(IDUsuario),
    CONSTRAINT fk_FIR_Alerta_TipoAlerta FOREIGN KEY (IDTipoAlerta) REFERENCES dbo.FIR_Maestro(IDMaestro)
);
GO

CREATE TABLE dbo.FIR_AlertaAuditoria (
    IDAlertaAuditoria INT           IDENTITY(1,1) NOT NULL PRIMARY KEY,
    IDAlerta      INT           NOT NULL,
    IDDocumento   INT           NOT NULL,
    IDUsuario     VARCHAR(15)   NOT NULL,
    IDTipoAlerta  INT           NOT NULL,
    Enviada       BIT           NOT NULL,
    FechaEnvio    SMALLDATETIME NULL,
    IDUsuarioCreador      VARCHAR(15)   NOT NULL,
    FechaCreacion         SMALLDATETIME NOT NULL,
    IDUsuarioModificador  VARCHAR(15)   NULL,
    FechaModificacion     SMALLDATETIME NULL,
    TipoOperacion  CHAR(1)       NOT NULL,
    IDUsuarioAudita VARCHAR(15)  NOT NULL, -- Renombrado para no chocar
    IDEquipo       VARCHAR(15)   NULL,
    FechaCambio    SMALLDATETIME NOT NULL
);
GO

-- ==============================================================================
-- PROCEDIMIENTOS ALMACENADOS
-- ==============================================================================

-- 1. REGISTRAR DOCUMENTO INICIAL
IF OBJECT_ID('dbo.USP_FIR_Documento_Registrar', 'P') IS NOT NULL DROP PROCEDURE dbo.USP_FIR_Documento_Registrar;
GO
CREATE PROCEDURE dbo.USP_FIR_Documento_Registrar
    @Asunto VARCHAR(300),
    @IDTipoDoc INT,
    @AreaResponsable VARCHAR(150),
    @FechaCreacionDoc DATE,
    @CodigoDocumento VARCHAR(50),
    @RutaArchivo VARCHAR(500),
    @DiasMaxRevision INT,
    @IDUsuarioCreador VARCHAR(15),
    @IDEquipo VARCHAR(15),
    @JsonRevisores NVARCHAR(MAX), -- Formato: [{"IDUsuarioRevisor": "usr1", "DiasMax": 5}]
    @JsonFirmantes NVARCHAR(MAX)  -- Formato: [{"IDUsuarioFirmante": "usr2", "Orden": 1, "IDRol": 5}]
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRAN;

        DECLARE @FechaActual SMALLDATETIME = GETDATE();
        DECLARE @IDEstadoEnRevision INT;
        SELECT @IDEstadoEnRevision = IDMaestro FROM FIR_Maestro WHERE Tipo = 'ESTADO_DOC' AND Codigo = 'EN_REVISION';
        
        DECLARE @IDEstadoRevPendiente INT;
        SELECT @IDEstadoRevPendiente = IDMaestro FROM FIR_Maestro WHERE Tipo = 'ESTADO_REVISION' AND Codigo = 'PENDIENTE';

        DECLARE @IDEstadoFirmaPendiente INT;
        SELECT @IDEstadoFirmaPendiente = IDMaestro FROM FIR_Maestro WHERE Tipo = 'ESTADO_FIRMA' AND Codigo = 'PENDIENTE';

        -- 1. Insertar Documento
        DECLARE @T_Doc TABLE (ID INT);
        INSERT INTO FIR_Documento (Asunto, IDTipoDoc, AreaResponsable, FechaCreacionDoc, CodigoDocumento, IDEstadoDoc, DiasMaxRevision, IDUsuarioCreador, FechaCreacion)
        OUTPUT INSERTED.IDDocumento INTO @T_Doc
        VALUES (@Asunto, @IDTipoDoc, @AreaResponsable, @FechaCreacionDoc, @CodigoDocumento, @IDEstadoEnRevision, @DiasMaxRevision, @IDUsuarioCreador, @FechaActual);

        DECLARE @IDDocumento INT = (SELECT TOP 1 ID FROM @T_Doc);

        -- Auditoria Documento
        INSERT INTO FIR_DocumentoAuditoria (IDDocumento, Asunto, IDTipoDoc, AreaResponsable, FechaCreacionDoc, CodigoDocumento, IDEstadoDoc, DiasMaxRevision, IDUsuarioCreador, FechaCreacion, TipoOperacion, IDUsuario, IDEquipo, FechaCambio)
        VALUES (@IDDocumento, @Asunto, @IDTipoDoc, @AreaResponsable, @FechaCreacionDoc, @CodigoDocumento, @IDEstadoEnRevision, @DiasMaxRevision, @IDUsuarioCreador, @FechaActual, 'I', @IDUsuarioCreador, @IDEquipo, @FechaActual);

        -- Historial
        INSERT INTO FIR_HistorialEstado (IDDocumento, IDEstadoAnterior, IDEstadoNuevo, Observacion, IDUsuarioCreador, FechaCreacion)
        VALUES (@IDDocumento, NULL, @IDEstadoEnRevision, 'Documento registrado inicial', @IDUsuarioCreador, @FechaActual);

        -- 2. Insertar Version 1
        DECLARE @T_Ver TABLE (ID INT);
        INSERT INTO FIR_DocumentoVersion (IDDocumento, RutaArchivo, Iteracion, FechaSubida, IDUsuarioCreador, FechaCreacion)
        OUTPUT INSERTED.IDDocVersion INTO @T_Ver
        VALUES (@IDDocumento, @RutaArchivo, 1, @FechaActual, @IDUsuarioCreador, @FechaActual);

        DECLARE @IDDocVersion INT = (SELECT TOP 1 ID FROM @T_Ver);

        -- Auditoria Version
        INSERT INTO FIR_DocumentoVersionAuditoria (IDDocVersion, IDDocumento, RutaArchivo, Iteracion, FechaSubida, IDUsuarioCreador, FechaCreacion, TipoOperacion, IDUsuario, IDEquipo, FechaCambio)
        VALUES (@IDDocVersion, @IDDocumento, @RutaArchivo, 1, @FechaActual, @IDUsuarioCreador, @FechaActual, 'I', @IDUsuarioCreador, @IDEquipo, @FechaActual);

        -- 3. Insertar Revisores
        INSERT INTO FIR_DocumentoRevision (IDDocVersion, IDUsuarioRevisor, IDEstadoRevision, DiasMaxRevision, IDUsuarioCreador, FechaCreacion)
        SELECT @IDDocVersion, JSON_VALUE(value, '$.IDUsuarioRevisor'), @IDEstadoRevPendiente, CAST(JSON_VALUE(value, '$.DiasMax') AS INT), @IDUsuarioCreador, @FechaActual
        FROM OPENJSON(@JsonRevisores);

        INSERT INTO FIR_DocumentoRevisionAuditoria (IDRevision, IDDocVersion, IDUsuarioRevisor, IDEstadoRevision, DiasMaxRevision, IDUsuarioCreador, FechaCreacion, TipoOperacion, IDUsuario, IDEquipo, FechaCambio)
        SELECT IDRevision, IDDocVersion, IDUsuarioRevisor, IDEstadoRevision, DiasMaxRevision, IDUsuarioCreador, FechaCreacion, 'I', @IDUsuarioCreador, @IDEquipo, @FechaActual
        FROM FIR_DocumentoRevision WHERE IDDocVersion = @IDDocVersion;

        -- 4. Insertar Firmantes
        INSERT INTO FIR_DocumentoFirmante (IDDocumento, IDUsuarioFirmante, Orden, IDRolFirmante, IDEstadoFirma, IDUsuarioCreador, FechaCreacion)
        SELECT @IDDocumento, JSON_VALUE(value, '$.IDUsuarioFirmante'), CAST(JSON_VALUE(value, '$.Orden') AS INT), CAST(JSON_VALUE(value, '$.IDRol') AS INT), @IDEstadoFirmaPendiente, @IDUsuarioCreador, @FechaActual
        FROM OPENJSON(@JsonFirmantes);

        INSERT INTO FIR_DocumentoFirmanteAuditoria (IDFirmante, IDDocumento, IDUsuarioFirmante, Orden, IDRolFirmante, IDEstadoFirma, IDUsuarioCreador, FechaCreacion, TipoOperacion, IDUsuario, IDEquipo, FechaCambio)
        SELECT IDFirmante, IDDocumento, IDUsuarioFirmante, Orden, IDRolFirmante, IDEstadoFirma, IDUsuarioCreador, FechaCreacion, 'I', @IDUsuarioCreador, @IDEquipo, @FechaActual
        FROM FIR_DocumentoFirmante WHERE IDDocumento = @IDDocumento;

        COMMIT TRAN;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        THROW;
    END CATCH
END;
GO

-- 2. REGISTRAR REVISION
IF OBJECT_ID('dbo.USP_FIR_Documento_RegistrarRevision', 'P') IS NOT NULL DROP PROCEDURE dbo.USP_FIR_Documento_RegistrarRevision;
GO
CREATE PROCEDURE dbo.USP_FIR_Documento_RegistrarRevision
    @IDRevision INT,
    @IDEstadoRevisionNuevo INT, -- Aprobado u Observado
    @Correccion VARCHAR(1000),
    @IDUsuarioModificador VARCHAR(15),
    @IDEquipo VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRAN;
        DECLARE @FechaActual SMALLDATETIME = GETDATE();
        DECLARE @IDDocVersion INT;
        DECLARE @IDDocumento INT;
        DECLARE @IDEstadoDocActual INT;

        SELECT @IDDocVersion = IDDocVersion FROM FIR_DocumentoRevision WHERE IDRevision = @IDRevision;
        SELECT @IDDocumento = IDDocumento FROM FIR_DocumentoVersion WHERE IDDocVersion = @IDDocVersion;
        SELECT @IDEstadoDocActual = IDEstadoDoc FROM FIR_Documento WHERE IDDocumento = @IDDocumento;

        -- Actualizar Revisión
        UPDATE FIR_DocumentoRevision
        SET IDEstadoRevision = @IDEstadoRevisionNuevo,
            Correccion = @Correccion,
            FechaRevision = @FechaActual,
            IDUsuarioModificador = @IDUsuarioModificador,
            FechaModificacion = @FechaActual
        WHERE IDRevision = @IDRevision;

        -- Auditoria Revisión
        INSERT INTO FIR_DocumentoRevisionAuditoria (IDRevision, IDDocVersion, IDUsuarioRevisor, IDEstadoRevision, Correccion, FechaRevision, DiasMaxRevision, IDUsuarioCreador, FechaCreacion, IDUsuarioModificador, FechaModificacion, TipoOperacion, IDUsuario, IDEquipo, FechaCambio)
        SELECT IDRevision, IDDocVersion, IDUsuarioRevisor, IDEstadoRevision, Correccion, FechaRevision, DiasMaxRevision, IDUsuarioCreador, FechaCreacion, IDUsuarioModificador, FechaModificacion, 'M', @IDUsuarioModificador, @IDEquipo, @FechaActual
        FROM FIR_DocumentoRevision WHERE IDRevision = @IDRevision;

        -- Verificar si todos revisaron
        DECLARE @TotalRevisores INT, @Revisados INT, @Observados INT;
        SELECT @TotalRevisores = COUNT(*) FROM FIR_DocumentoRevision WHERE IDDocVersion = @IDDocVersion;
        
        -- Obtener códigos de estado
        DECLARE @IDE_RevPendiente INT, @IDE_RevAprobado INT, @IDE_RevObservado INT;
        SELECT @IDE_RevPendiente = IDMaestro FROM FIR_Maestro WHERE Tipo='ESTADO_REVISION' AND Codigo='PENDIENTE';
        SELECT @IDE_RevObservado = IDMaestro FROM FIR_Maestro WHERE Tipo='ESTADO_REVISION' AND Codigo='OBSERVADO';

        SELECT @Revisados = COUNT(*) FROM FIR_DocumentoRevision WHERE IDDocVersion = @IDDocVersion AND IDEstadoRevision <> @IDE_RevPendiente;
        SELECT @Observados = COUNT(*) FROM FIR_DocumentoRevision WHERE IDDocVersion = @IDDocVersion AND IDEstadoRevision = @IDE_RevObservado;

        IF @Revisados = @TotalRevisores
        BEGIN
            DECLARE @NuevoEstadoDoc INT;
            IF @Observados > 0
                SELECT @NuevoEstadoDoc = IDMaestro FROM FIR_Maestro WHERE Tipo='ESTADO_DOC' AND Codigo='OBSERVADO';
            ELSE
                SELECT @NuevoEstadoDoc = IDMaestro FROM FIR_Maestro WHERE Tipo='ESTADO_DOC' AND Codigo='APROB_FIRMA';

            UPDATE FIR_Documento
            SET IDEstadoDoc = @NuevoEstadoDoc,
                IDUsuarioModificador = @IDUsuarioModificador,
                FechaModificacion = @FechaActual
            WHERE IDDocumento = @IDDocumento;

            -- Auditoria Documento
            INSERT INTO FIR_DocumentoAuditoria (IDDocumento, Asunto, IDTipoDoc, AreaResponsable, FechaCreacionDoc, CodigoDocumento, IDEstadoDoc, DiasMaxRevision, IDUsuarioCreador, FechaCreacion, IDUsuarioModificador, FechaModificacion, TipoOperacion, IDUsuario, IDEquipo, FechaCambio)
            SELECT IDDocumento, Asunto, IDTipoDoc, AreaResponsable, FechaCreacionDoc, CodigoDocumento, IDEstadoDoc, DiasMaxRevision, IDUsuarioCreador, FechaCreacion, IDUsuarioModificador, FechaModificacion, 'M', @IDUsuarioModificador, @IDEquipo, @FechaActual
            FROM FIR_Documento WHERE IDDocumento = @IDDocumento;

            -- Historial
            INSERT INTO FIR_HistorialEstado (IDDocumento, IDEstadoAnterior, IDEstadoNuevo, Observacion, IDUsuarioCreador, FechaCreacion)
            VALUES (@IDDocumento, @IDEstadoDocActual, @NuevoEstadoDoc, 'Actualizado por fin de revisiones', @IDUsuarioModificador, @FechaActual);
        END

        COMMIT TRAN;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        THROW;
    END CATCH
END;
GO

-- 3. SUBIR CORRECCION (NUEVA VERSION)
IF OBJECT_ID('dbo.USP_FIR_Documento_SubirCorreccion', 'P') IS NOT NULL DROP PROCEDURE dbo.USP_FIR_Documento_SubirCorreccion;
GO
CREATE PROCEDURE dbo.USP_FIR_Documento_SubirCorreccion
    @IDDocumento INT,
    @RutaArchivo VARCHAR(500),
    @IDUsuarioModificador VARCHAR(15),
    @IDEquipo VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRAN;
        DECLARE @FechaActual SMALLDATETIME = GETDATE();
        DECLARE @IteracionActual INT;
        SELECT @IteracionActual = MAX(Iteracion) FROM FIR_DocumentoVersion WHERE IDDocumento = @IDDocumento;
        
        DECLARE @IDDocVersionAnterior INT;
        SELECT @IDDocVersionAnterior = IDDocVersion FROM FIR_DocumentoVersion WHERE IDDocumento = @IDDocumento AND Iteracion = @IteracionActual;

        DECLARE @NuevaIteracion INT = ISNULL(@IteracionActual, 0) + 1;

        -- 1. Crear nueva versión
        DECLARE @T_Ver TABLE (ID INT);
        INSERT INTO FIR_DocumentoVersion (IDDocumento, RutaArchivo, Iteracion, FechaSubida, IDUsuarioCreador, FechaCreacion)
        OUTPUT INSERTED.IDDocVersion INTO @T_Ver
        VALUES (@IDDocumento, @RutaArchivo, @NuevaIteracion, @FechaActual, @IDUsuarioModificador, @FechaActual);

        DECLARE @NuevoIDDocVersion INT = (SELECT TOP 1 ID FROM @T_Ver);

        INSERT INTO FIR_DocumentoVersionAuditoria (IDDocVersion, IDDocumento, RutaArchivo, Iteracion, FechaSubida, IDUsuarioCreador, FechaCreacion, TipoOperacion, IDUsuario, IDEquipo, FechaCambio)
        VALUES (@NuevoIDDocVersion, @IDDocumento, @RutaArchivo, @NuevaIteracion, @FechaActual, @IDUsuarioModificador, @FechaActual, 'I', @IDUsuarioModificador, @IDEquipo, @FechaActual);

        -- 2. Copiar Revisores con estado PENDIENTE
        DECLARE @IDEstadoRevPendiente INT;
        SELECT @IDEstadoRevPendiente = IDMaestro FROM FIR_Maestro WHERE Tipo = 'ESTADO_REVISION' AND Codigo = 'PENDIENTE';

        INSERT INTO FIR_DocumentoRevision (IDDocVersion, IDUsuarioRevisor, IDEstadoRevision, DiasMaxRevision, IDUsuarioCreador, FechaCreacion)
        SELECT @NuevoIDDocVersion, IDUsuarioRevisor, @IDEstadoRevPendiente, DiasMaxRevision, @IDUsuarioModificador, @FechaActual
        FROM FIR_DocumentoRevision WHERE IDDocVersion = @IDDocVersionAnterior;

        INSERT INTO FIR_DocumentoRevisionAuditoria (IDRevision, IDDocVersion, IDUsuarioRevisor, IDEstadoRevision, DiasMaxRevision, IDUsuarioCreador, FechaCreacion, TipoOperacion, IDUsuario, IDEquipo, FechaCambio)
        SELECT IDRevision, IDDocVersion, IDUsuarioRevisor, IDEstadoRevision, DiasMaxRevision, IDUsuarioCreador, FechaCreacion, 'I', @IDUsuarioModificador, @IDEquipo, @FechaActual
        FROM FIR_DocumentoRevision WHERE IDDocVersion = @NuevoIDDocVersion;

        -- 3. Cambiar estado de documento a EN_REVISION
        DECLARE @IDEstadoEnRevision INT;
        SELECT @IDEstadoEnRevision = IDMaestro FROM FIR_Maestro WHERE Tipo = 'ESTADO_DOC' AND Codigo = 'EN_REVISION';
        DECLARE @IDEstadoDocActual INT = (SELECT IDEstadoDoc FROM FIR_Documento WHERE IDDocumento = @IDDocumento);

        UPDATE FIR_Documento
        SET IDEstadoDoc = @IDEstadoEnRevision,
            IDUsuarioModificador = @IDUsuarioModificador,
            FechaModificacion = @FechaActual
        WHERE IDDocumento = @IDDocumento;

        INSERT INTO FIR_DocumentoAuditoria (IDDocumento, Asunto, IDTipoDoc, AreaResponsable, FechaCreacionDoc, CodigoDocumento, IDEstadoDoc, DiasMaxRevision, IDUsuarioCreador, FechaCreacion, IDUsuarioModificador, FechaModificacion, TipoOperacion, IDUsuario, IDEquipo, FechaCambio)
        SELECT IDDocumento, Asunto, IDTipoDoc, AreaResponsable, FechaCreacionDoc, CodigoDocumento, IDEstadoDoc, DiasMaxRevision, IDUsuarioCreador, FechaCreacion, IDUsuarioModificador, FechaModificacion, 'M', @IDUsuarioModificador, @IDEquipo, @FechaActual
        FROM FIR_Documento WHERE IDDocumento = @IDDocumento;

        INSERT INTO FIR_HistorialEstado (IDDocumento, IDEstadoAnterior, IDEstadoNuevo, Observacion, IDUsuarioCreador, FechaCreacion)
        VALUES (@IDDocumento, @IDEstadoDocActual, @IDEstadoEnRevision, 'Sube correccion PDF', @IDUsuarioModificador, @FechaActual);

        COMMIT TRAN;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        THROW;
    END CATCH
END;
GO

-- 4. FIRMAR DOCUMENTO
IF OBJECT_ID('dbo.USP_FIR_Documento_Firmar', 'P') IS NOT NULL DROP PROCEDURE dbo.USP_FIR_Documento_Firmar;
GO
CREATE PROCEDURE dbo.USP_FIR_Documento_Firmar
    @IDFirmante INT,
    @SerieToken VARCHAR(100),
    @HuellaCertificado VARCHAR(200),
    @Observacion VARCHAR(500),
    @IDUsuarioModificador VARCHAR(15),
    @IDEquipo VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRAN;
        DECLARE @FechaActual SMALLDATETIME = GETDATE();
        DECLARE @IDDocumento INT;
        SELECT @IDDocumento = IDDocumento FROM FIR_DocumentoFirmante WHERE IDFirmante = @IDFirmante;

        DECLARE @IDDocVersionActual INT;
        SELECT @IDDocVersionActual = MAX(IDDocVersion) FROM FIR_DocumentoVersion WHERE IDDocumento = @IDDocumento;

        DECLARE @IDEstadoFirmado INT;
        SELECT @IDEstadoFirmado = IDMaestro FROM FIR_Maestro WHERE Tipo='ESTADO_FIRMA' AND Codigo='FIRMADO';

        -- 1. Actualizar Firma
        UPDATE FIR_DocumentoFirmante
        SET IDEstadoFirma = @IDEstadoFirmado,
            FechaFirma = @FechaActual,
            SerieToken = @SerieToken,
            HuellaCertificado = @HuellaCertificado,
            ObservacionFirma = @Observacion,
            IDDocVersionFirmada = @IDDocVersionActual,
            IDUsuarioModificador = @IDUsuarioModificador,
            FechaModificacion = @FechaActual
        WHERE IDFirmante = @IDFirmante;

        INSERT INTO FIR_DocumentoFirmanteAuditoria (IDFirmante, IDDocumento, IDUsuarioFirmante, Orden, IDRolFirmante, IDEstadoFirma, FechaFirma, ObservacionFirma, SerieToken, HuellaCertificado, IDDocVersionFirmada, IDUsuarioCreador, FechaCreacion, IDUsuarioModificador, FechaModificacion, TipoOperacion, IDUsuario, IDEquipo, FechaCambio)
        SELECT IDFirmante, IDDocumento, IDUsuarioFirmante, Orden, IDRolFirmante, IDEstadoFirma, FechaFirma, ObservacionFirma, SerieToken, HuellaCertificado, IDDocVersionFirmada, IDUsuarioCreador, FechaCreacion, IDUsuarioModificador, FechaModificacion, 'M', @IDUsuarioModificador, @IDEquipo, @FechaActual
        FROM FIR_DocumentoFirmante WHERE IDFirmante = @IDFirmante;

        -- 2. Validar si todos firmaron
        DECLARE @TotalFirmantes INT, @Firmados INT;
        SELECT @TotalFirmantes = COUNT(*) FROM FIR_DocumentoFirmante WHERE IDDocumento = @IDDocumento;
        SELECT @Firmados = COUNT(*) FROM FIR_DocumentoFirmante WHERE IDDocumento = @IDDocumento AND IDEstadoFirma = @IDEstadoFirmado;

        IF @Firmados = @TotalFirmantes
        BEGIN
            DECLARE @IDE_DocFinalizado INT;
            SELECT @IDE_DocFinalizado = IDMaestro FROM FIR_Maestro WHERE Tipo='ESTADO_DOC' AND Codigo='FINALIZADO';
            
            DECLARE @IDEstadoDocActual INT = (SELECT IDEstadoDoc FROM FIR_Documento WHERE IDDocumento = @IDDocumento);

            UPDATE FIR_Documento
            SET IDEstadoDoc = @IDE_DocFinalizado,
                IDUsuarioModificador = @IDUsuarioModificador,
                FechaModificacion = @FechaActual
            WHERE IDDocumento = @IDDocumento;

            INSERT INTO FIR_DocumentoAuditoria (IDDocumento, Asunto, IDTipoDoc, AreaResponsable, FechaCreacionDoc, CodigoDocumento, IDEstadoDoc, DiasMaxRevision, IDUsuarioCreador, FechaCreacion, IDUsuarioModificador, FechaModificacion, TipoOperacion, IDUsuario, IDEquipo, FechaCambio)
            SELECT IDDocumento, Asunto, IDTipoDoc, AreaResponsable, FechaCreacionDoc, CodigoDocumento, IDEstadoDoc, DiasMaxRevision, IDUsuarioCreador, FechaCreacion, IDUsuarioModificador, FechaModificacion, 'M', @IDUsuarioModificador, @IDEquipo, @FechaActual
            FROM FIR_Documento WHERE IDDocumento = @IDDocumento;

            INSERT INTO FIR_HistorialEstado (IDDocumento, IDEstadoAnterior, IDEstadoNuevo, Observacion, IDUsuarioCreador, FechaCreacion)
            VALUES (@IDDocumento, @IDEstadoDocActual, @IDE_DocFinalizado, 'Documento finalizado exitosamente', @IDUsuarioModificador, @FechaActual);
        END

        COMMIT TRAN;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        THROW;
    END CATCH
END;
GO

-- ==============================================================================
-- 5. LOGIN DE USUARIO
-- ==============================================================================
IF OBJECT_ID('dbo.USP_FIR_Usuario_Login', 'P') IS NOT NULL DROP PROCEDURE dbo.USP_FIR_Usuario_Login;
GO
CREATE PROCEDURE dbo.USP_FIR_Usuario_Login
    @Correo VARCHAR(100),
    @Clave VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Retorna los datos del usuario si las credenciales son correctas y está activo.
    -- El campo 'Rol' determinará si es 'Administrador', 'Registrador', 'Firmante', o 'Revisor'
    SELECT 
        IDUsuario,
        Correo,
        Rol,
        Activo
    FROM FIR_Usuario
    WHERE Correo = @Correo 
      AND Clave = @Clave
      AND Activo = 1;
END;
GO