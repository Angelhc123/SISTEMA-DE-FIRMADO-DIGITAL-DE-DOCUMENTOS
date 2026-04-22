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
    IDEmpleadoRevisor  VARCHAR(15)   NOT NULL,
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
    CONSTRAINT fk_FIR_DocumentoRevision_EstadoRevision FOREIGN KEY (IDEstadoRevision) REFERENCES dbo.FIR_Maestro(IDMaestro),
    CONSTRAINT uq_FIR_DocumentoRevision_DocRevisor UNIQUE (IDDocVersion, IDEmpleadoRevisor),
    CONSTRAINT ch_FIR_DocumentoRevision_Dias CHECK (DiasMaxRevision > 0)
);
GO

CREATE TABLE dbo.FIR_DocumentoRevisionAuditoria (
    IDRevisionAuditoria INT           IDENTITY(1,1) NOT NULL PRIMARY KEY,
    IDRevision         INT           NOT NULL,
    IDDocVersion       INT           NOT NULL,
    IDEmpleadoRevisor  VARCHAR(15)   NOT NULL,
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
    IDEmpleadoFirmante  VARCHAR(15)   NOT NULL,
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
    CONSTRAINT uq_FIR_DocumentoFirmante_DocEmpleado UNIQUE (IDDocumento, IDEmpleadoFirmante),
    CONSTRAINT ch_FIR_DocumentoFirmante_Orden CHECK (Orden > 0)
);
GO

CREATE TABLE dbo.FIR_DocumentoFirmanteAuditoria (
    IDFirmanteAuditoria INT           IDENTITY(1,1) NOT NULL PRIMARY KEY,
    IDFirmante          INT           NOT NULL,
    IDDocumento         INT           NOT NULL,
    IDEmpleadoFirmante  VARCHAR(15)   NOT NULL,
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
    IDEmpleado    VARCHAR(15)   NOT NULL,
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
    IDEmpleado    VARCHAR(15)   NOT NULL,
    IDTipoAlerta  INT           NOT NULL,
    Enviada       BIT           NOT NULL,
    FechaEnvio    SMALLDATETIME NULL,
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