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

-- NOTA: La tabla FIR_Usuario fue eliminada.
-- La autenticacion es gestionada por el SAS de ZOFRATACNA.
-- El campo IDUsuarioRevisor e IDUsuarioFirmante almacenan el LoginUsuario del SAS.

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
    -- FK a FIR_Usuario eliminada: IDUsuarioRevisor corresponde al LoginUsuario del SAS
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
-- (Login administrado externamente)
-- ==============================================================================


-- ==============================================================================
-- BLOQUE C: Datos semilla FIR_Maestro
-- DESCRIPCION: Valores de catálogo necesarios para que los SPs de negocio
--              resuelvan estados de documentos, revisiones, firmas y alertas.
-- ==============================================================================
IF NOT EXISTS (SELECT 1 FROM dbo.FIR_Maestro WHERE Tipo='ESTADO_DOC')
BEGIN
    INSERT INTO dbo.FIR_Maestro (Tipo,Codigo,Descripcion,Orden,Activo,IDUsuarioCreador,FechaCreacion) VALUES
    ('ESTADO_DOC','EN_REVISION','En Revision',1,1,'admin',GETDATE()),
    ('ESTADO_DOC','OBSERVADO','Observado',2,1,'admin',GETDATE()),
    ('ESTADO_DOC','APROB_FIRMA','Aprobado para Firma',3,1,'admin',GETDATE()),
    ('ESTADO_DOC','EN_FIRMA','En Proceso de Firma',4,1,'admin',GETDATE()),
    ('ESTADO_DOC','FINALIZADO','Finalizado y Firmado',5,1,'admin',GETDATE()),
    ('ESTADO_REVISION','PENDIENTE','Pendiente de Revision',1,1,'admin',GETDATE()),
    ('ESTADO_REVISION','APROBADO','Aprobado',2,1,'admin',GETDATE()),
    ('ESTADO_REVISION','OBSERVADO','Observado',3,1,'admin',GETDATE()),
    ('ESTADO_FIRMA','PENDIENTE','Pendiente de Firma',1,1,'admin',GETDATE()),
    ('ESTADO_FIRMA','FIRMADO','Firmado',2,1,'admin',GETDATE()),
    ('ESTADO_FIRMA','OBSERVADO','Observado por Firmante',3,1,'admin',GETDATE()),
    ('TIPO_DOC','RESOLUCION','Resolucion Directoral',1,1,'admin',GETDATE()),
    ('TIPO_DOC','CONTRATO','Contrato',2,1,'admin',GETDATE()),
    ('TIPO_DOC','MEMORANDUM','Memorandum',3,1,'admin',GETDATE()),
    ('TIPO_DOC','ACTA','Acta',4,1,'admin',GETDATE()),
    ('TIPO_ALERTA','PENDIENTE_REVISION','Pendiente de revision',1,1,'admin',GETDATE()),
    ('TIPO_ALERTA','PENDIENTE_FIRMA','Pendiente de firma',2,1,'admin',GETDATE()),
    ('TIPO_ALERTA','VENCIMIENTO','Proximo a vencer',3,1,'admin',GETDATE()),
    ('ROL_FIRMANTE','GERENTE','Gerente General',1,1,'admin',GETDATE()),
    ('ROL_FIRMANTE','SUBGERENTE','Sub-Gerente',2,1,'admin',GETDATE()),
    ('ROL_FIRMANTE','JEFE','Jefe de Area',3,1,'admin',GETDATE());
END;
GO


-- ==============================================================================
-- BLOQUE F: Vista FIR_VW_DocumentosPendientes
-- DESCRIPCION: Resume documentos con sus estados actuales para los dashboards.
-- Usado por: frmDashboardRegistrador, frmMisDocumentos, frmMisDocumentosFirmante
-- ==============================================================================
IF OBJECT_ID('dbo.FIR_VW_DocumentosPendientes','V') IS NOT NULL DROP VIEW dbo.FIR_VW_DocumentosPendientes;
GO
CREATE VIEW dbo.FIR_VW_DocumentosPendientes AS
SELECT
    d.IDDocumento,
    d.Asunto,
    d.CodigoDocumento,
    d.AreaResponsable,
    d.FechaCreacionDoc,
    d.DiasMaxRevision,
    d.IDUsuarioCreador,
    meDoc.Descripcion   AS EstadoDocumento,
    meDoc.Codigo        AS CodigoEstadoDoc,
    meTipo.Descripcion  AS TipoDocumento,
    meTipo.Codigo       AS CodigoTipoDoc,
    dv.IDDocVersion,
    dv.Iteracion,
    dv.RutaArchivo
FROM dbo.FIR_Documento d
INNER JOIN dbo.FIR_Maestro meDoc  ON meDoc.IDMaestro  = d.IDEstadoDoc
INNER JOIN dbo.FIR_Maestro meTipo ON meTipo.IDMaestro = d.IDTipoDoc
OUTER APPLY (
    SELECT TOP 1 IDDocVersion, Iteracion, RutaArchivo
    FROM dbo.FIR_DocumentoVersion
    WHERE IDDocumento = d.IDDocumento
    ORDER BY Iteracion DESC
) dv;
GO

-- ==============================================================================
-- BLOQUE G: Vista FIR_VW_SeguimientoAuditoria
-- DESCRIPCION: Linea de tiempo de estados por documento para trazabilidad.
-- Usado por: frmSeguimientoAuditoria.aspx
-- ==============================================================================
IF OBJECT_ID('dbo.FIR_VW_SeguimientoAuditoria','V') IS NOT NULL DROP VIEW dbo.FIR_VW_SeguimientoAuditoria;
GO
CREATE VIEW dbo.FIR_VW_SeguimientoAuditoria AS
SELECT
    h.IDHistorial,
    h.IDDocumento,
    d.Asunto,
    d.CodigoDocumento,
    meAnterior.Descripcion AS EstadoAnterior,
    meNuevo.Descripcion    AS EstadoNuevo,
    h.Observacion,
    h.IDUsuarioCreador     AS UsuarioAccion,
    h.FechaCreacion        AS FechaCambio
FROM dbo.FIR_HistorialEstado h
INNER JOIN dbo.FIR_Documento d           ON d.IDDocumento = h.IDDocumento
LEFT  JOIN dbo.FIR_Maestro meAnterior    ON meAnterior.IDMaestro = h.IDEstadoAnterior
INNER JOIN dbo.FIR_Maestro meNuevo       ON meNuevo.IDMaestro    = h.IDEstadoNuevo;
GO

-- ==============================================================================
-- BLOQUE H: USP_FIR_Documento_ListarPorRegistrador
-- DESCRIPCION: Lista documentos creados por un registrador con su estado actual.
-- Usado por: frmMisDocumentos.aspx
-- ==============================================================================
IF OBJECT_ID('dbo.USP_FIR_Documento_ListarPorRegistrador','P') IS NOT NULL DROP PROCEDURE dbo.USP_FIR_Documento_ListarPorRegistrador;
GO
CREATE PROCEDURE dbo.USP_FIR_Documento_ListarPorRegistrador
    @IDUsuarioCreador VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT
        IDDocumento, Asunto, CodigoDocumento, AreaResponsable,
        FechaCreacionDoc, EstadoDocumento, CodigoEstadoDoc,
        TipoDocumento, Iteracion, RutaArchivo
    FROM dbo.FIR_VW_DocumentosPendientes
    WHERE IDUsuarioCreador = @IDUsuarioCreador
    ORDER BY FechaCreacionDoc DESC;
END;
GO

-- ==============================================================================
-- BLOQUE I: USP_FIR_Documento_ListarRevisionPendiente
-- DESCRIPCION: Documentos pendientes de revision para un revisor especifico.
-- Usado por: frmMisDocumentosRevisor.aspx
-- ==============================================================================
IF OBJECT_ID('dbo.USP_FIR_Documento_ListarRevisionPendiente','P') IS NOT NULL DROP PROCEDURE dbo.USP_FIR_Documento_ListarRevisionPendiente;
GO
CREATE PROCEDURE dbo.USP_FIR_Documento_ListarRevisionPendiente
    @IDUsuarioRevisor VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT
        vd.IDDocumento, vd.Asunto, vd.CodigoDocumento,
        vd.AreaResponsable, vd.FechaCreacionDoc,
        vd.EstadoDocumento, vd.TipoDocumento,
        vd.IDDocVersion, vd.RutaArchivo,
        r.IDRevision, r.DiasMaxRevision, r.FechaCreacion AS FechaAsignacion
    FROM dbo.FIR_DocumentoRevision r
    INNER JOIN dbo.FIR_VW_DocumentosPendientes vd ON vd.IDDocVersion = r.IDDocVersion
    INNER JOIN dbo.FIR_Maestro me ON me.IDMaestro = r.IDEstadoRevision
    WHERE r.IDUsuarioRevisor = @IDUsuarioRevisor
      AND me.Codigo = 'PENDIENTE'
    ORDER BY vd.FechaCreacionDoc ASC;
END;
GO

-- ==============================================================================
-- BLOQUE J: USP_FIR_Documento_ListarFirmaPendiente
-- DESCRIPCION: Documentos pendientes de firma para un firmante, segun su orden.
-- Usado por: frmMisDocumentosFirmante.aspx
-- ==============================================================================
IF OBJECT_ID('dbo.USP_FIR_Documento_ListarFirmaPendiente','P') IS NOT NULL DROP PROCEDURE dbo.USP_FIR_Documento_ListarFirmaPendiente;
GO
CREATE PROCEDURE dbo.USP_FIR_Documento_ListarFirmaPendiente
    @IDUsuarioFirmante VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT
        vd.IDDocumento, vd.Asunto, vd.CodigoDocumento,
        vd.AreaResponsable, vd.FechaCreacionDoc,
        vd.EstadoDocumento, vd.TipoDocumento,
        vd.RutaArchivo,
        f.IDFirmante, f.Orden, f.FechaCreacion AS FechaAsignacion
    FROM dbo.FIR_DocumentoFirmante f
    INNER JOIN dbo.FIR_VW_DocumentosPendientes vd ON vd.IDDocumento = f.IDDocumento
    INNER JOIN dbo.FIR_Maestro me ON me.IDMaestro = f.IDEstadoFirma
    WHERE f.IDUsuarioFirmante = @IDUsuarioFirmante
      AND me.Codigo = 'PENDIENTE'
      AND NOT EXISTS (
          SELECT 1 FROM dbo.FIR_DocumentoFirmante f2
          INNER JOIN dbo.FIR_Maestro me2 ON me2.IDMaestro = f2.IDEstadoFirma
          WHERE f2.IDDocumento = f.IDDocumento
            AND f2.Orden < f.Orden
            AND me2.Codigo <> 'FIRMADO'
      )
    ORDER BY f.Orden ASC, vd.FechaCreacionDoc ASC;
END;
GO

-- ==============================================================================
-- BLOQUE K: USP_FIR_Documento_ListarArchivado
-- DESCRIPCION: Documentos finalizados (archivados) de un usuario.
-- Usado por: frmArchivoFirmante.aspx, frmArchivoRegistrador.aspx
-- ==============================================================================
IF OBJECT_ID('dbo.USP_FIR_Documento_ListarArchivado','P') IS NOT NULL DROP PROCEDURE dbo.USP_FIR_Documento_ListarArchivado;
GO
CREATE PROCEDURE dbo.USP_FIR_Documento_ListarArchivado
    @IDUsuario VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT DISTINCT
        vd.IDDocumento, vd.Asunto, vd.CodigoDocumento,
        vd.AreaResponsable, vd.FechaCreacionDoc,
        vd.TipoDocumento, vd.RutaArchivo
    FROM dbo.FIR_VW_DocumentosPendientes vd
    WHERE vd.CodigoEstadoDoc = 'FINALIZADO'
      AND (
          vd.IDUsuarioCreador = @IDUsuario
          OR EXISTS (SELECT 1 FROM dbo.FIR_DocumentoFirmante f WHERE f.IDDocumento=vd.IDDocumento AND f.IDUsuarioFirmante=@IDUsuario)
          OR EXISTS (SELECT 1 FROM dbo.FIR_DocumentoRevision r INNER JOIN dbo.FIR_DocumentoVersion dv ON dv.IDDocVersion=r.IDDocVersion WHERE dv.IDDocumento=vd.IDDocumento AND r.IDUsuarioRevisor=@IDUsuario)
      )
    ORDER BY vd.FechaCreacionDoc DESC;
END;
GO

-- ==============================================================================
-- BLOQUE L: USP_FIR_Maestro_Listar
-- DESCRIPCION: Lista registros del catálogo maestro por tipo o todos.
-- Usado por: frmConfiguracionAdmin.aspx
-- ==============================================================================
IF OBJECT_ID('dbo.USP_FIR_Maestro_Listar','P') IS NOT NULL DROP PROCEDURE dbo.USP_FIR_Maestro_Listar;
GO
CREATE PROCEDURE dbo.USP_FIR_Maestro_Listar
    @Tipo VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SELECT IDMaestro, Tipo, Codigo, Descripcion, Orden, Activo
    FROM dbo.FIR_Maestro
    WHERE (@Tipo IS NULL OR Tipo = @Tipo)
    ORDER BY Tipo, Orden;
END;
GO

-- ==============================================================================
-- BLOQUE M: USP_FIR_Maestro_Guardar
-- DESCRIPCION: Inserta o actualiza un registro del catalogo maestro.
-- Usado por: frmConfiguracionAdmin.aspx
-- ==============================================================================
IF OBJECT_ID('dbo.USP_FIR_Maestro_Guardar','P') IS NOT NULL DROP PROCEDURE dbo.USP_FIR_Maestro_Guardar;
GO
CREATE PROCEDURE dbo.USP_FIR_Maestro_Guardar
    @IDMaestro   INT,
    @Tipo        VARCHAR(50),
    @Codigo      VARCHAR(20),
    @Descripcion VARCHAR(100),
    @Orden       INT,
    @Activo      BIT,
    @IDUsuario   VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @Fecha SMALLDATETIME = GETDATE();
    IF @IDMaestro = 0
    BEGIN
        INSERT INTO dbo.FIR_Maestro (Tipo,Codigo,Descripcion,Orden,Activo,IDUsuarioCreador,FechaCreacion)
        VALUES (@Tipo,@Codigo,@Descripcion,@Orden,@Activo,@IDUsuario,@Fecha);
    END
    ELSE
    BEGIN
        UPDATE dbo.FIR_Maestro
        SET Descripcion=@Descripcion, Orden=@Orden, Activo=@Activo,
            IDUsuarioModificador=@IDUsuario, FechaModificacion=@Fecha
        WHERE IDMaestro=@IDMaestro;
    END;
END;
GO

-- ==============================================================================
-- BLOQUE O: USP_FIR_Estadisticas_Dashboard
-- DESCRIPCION: Cuenta documentos por estado para el panel de cada rol.
-- Usado por: frmDashboardAdmin, frmDashboardRegistrador, frmDashboardFirmante
-- ==============================================================================
IF OBJECT_ID('dbo.USP_FIR_Estadisticas_Dashboard','P') IS NOT NULL DROP PROCEDURE dbo.USP_FIR_Estadisticas_Dashboard;
GO
CREATE PROCEDURE dbo.USP_FIR_Estadisticas_Dashboard
    @IDUsuario VARCHAR(15),
    @Rol       VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT
        SUM(CASE WHEN CodigoEstadoDoc='EN_REVISION'  THEN 1 ELSE 0 END) AS EnRevision,
        SUM(CASE WHEN CodigoEstadoDoc='OBSERVADO'    THEN 1 ELSE 0 END) AS Observados,
        SUM(CASE WHEN CodigoEstadoDoc='APROB_FIRMA'  THEN 1 ELSE 0 END) AS AprobParaFirma,
        SUM(CASE WHEN CodigoEstadoDoc='EN_FIRMA'     THEN 1 ELSE 0 END) AS EnFirma,
        SUM(CASE WHEN CodigoEstadoDoc='FINALIZADO'   THEN 1 ELSE 0 END) AS Finalizados,
        COUNT(*)                                                          AS Total
    FROM dbo.FIR_VW_DocumentosPendientes;
END;
GO