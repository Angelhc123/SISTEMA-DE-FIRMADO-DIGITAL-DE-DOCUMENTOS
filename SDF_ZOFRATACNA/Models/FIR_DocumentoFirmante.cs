using System;
using System.Data;
using System.Data.SqlClient;
using SDF_ZOFRATACNA.App_Code.DAL;

namespace SDF_ZOFRATACNA.Models
{
    public class FIR_DocumentoFirmante
    {
        #region Propiedades
        public int IDDocumentoFirmante { get; set; }
        public int IDDocumento { get; set; }
        public string LoginUsuario { get; set; }
        public int OrdenFirma { get; set; }
        public string CodigoRolFirmante { get; set; }
        public bool? EsAprobado { get; set; }
        public string Comentario { get; set; }
        #endregion

        #region Métodos
        public static DataTable ListarPendientesFirma(string loginUsuario, string filtroBusqueda)
        {
            string sql = @"
                SELECT 
                    vd.IDDocumento, vd.Asunto, vd.CodigoDocumento,
                    vd.AreaResponsable, vd.FechaDocumento AS FechaCreacionDoc,
                    vd.IDUsuarioCreador,
                    vd.EstadoDocumento, vd.TipoDocumento,
                    vd.RutaArchivoPDF AS RutaArchivo,
                    f.IDDocumentoFirmante AS IDFirmante, f.OrdenFirma AS Orden, f.FechaCreacion AS FechaAsignacion,
                    CASE 
                        WHEN f.CodigoEstadoFirma = 'PEN' THEN 'Pendiente'
                        WHEN f.CodigoEstadoFirma = 'FIR' THEN 'Firmado'
                        ELSE 'Pendiente' 
                    END AS EstadoFirma,
                    CAST(CASE WHEN NOT EXISTS (
                        SELECT 1 FROM dbo.FIR_DocumentoFirmante f2
                        WHERE f2.IDDocumento = f.IDDocumento
                          AND f2.OrdenFirma < f.OrdenFirma
                          AND f2.CodigoEstadoFirma <> 'FIR'
                    ) THEN 1 ELSE 0 END AS BIT) AS EsMiTurno
                FROM dbo.FIR_DocumentoFirmante f
                INNER JOIN dbo.FIR_VW_DocumentosPendientes vd ON vd.IDDocumento = f.IDDocumento
                WHERE f.LoginUsuario = @IDUsuario
                  AND f.CodigoEstadoFirma = 'PEN'";

            if (!string.IsNullOrEmpty(filtroBusqueda))
            {
                sql += " AND (vd.Asunto LIKE @Busqueda OR vd.CodigoDocumento LIKE @Busqueda OR vd.IDUsuarioCreador LIKE @Busqueda)";
            }

            sql += " ORDER BY EsMiTurno DESC, f.OrdenFirma ASC, vd.FechaDocumento ASC";

            SqlParameter[] pars = { 
                new SqlParameter("@IDUsuario", loginUsuario),
                new SqlParameter("@Busqueda", "%" + filtroBusqueda + "%")
            };
            
            return ConexionBD.EjecutarConsultaFirmaSQL(sql, pars);
        }

        public static int ContarFirmadosHoy(string loginUsuario)
        {
            string sql = @"
                SELECT COUNT(*) FROM dbo.FIR_DocumentoFirmante 
                WHERE LoginUsuario = @IDUsuario
                  AND CodigoEstadoFirma = 'FIR'
                  AND CAST(FechaFirma AS DATE) = CAST(GETDATE() AS DATE)";
            DataTable dt = ConexionBD.EjecutarConsultaFirmaSQL(
                sql, new SqlParameter[] { new SqlParameter("@IDUsuario", loginUsuario) });
            return dt.Rows.Count > 0 ? Convert.ToInt32(dt.Rows[0][0]) : 0;
        }

        public static bool Firmar(int idDocumentoFirmante, string serieToken, string huellaCertificado, string observacion, string idUsuarioModificador, string idEquipo, string rutaPDFFirmado = null)
        {
            try
            {
                SqlParameter[] pars = {
                    new SqlParameter("@IDDocumentoFirmante", idDocumentoFirmante),
                    new SqlParameter("@SerieToken", string.IsNullOrEmpty(serieToken) ? DBNull.Value : (object)serieToken),
                    new SqlParameter("@HuellaCertificado", string.IsNullOrEmpty(huellaCertificado) ? DBNull.Value : (object)huellaCertificado),
                    new SqlParameter("@Observacion", string.IsNullOrEmpty(observacion) ? DBNull.Value : (object)observacion),
                    new SqlParameter("@IDUsuarioModificador", string.IsNullOrEmpty(idUsuarioModificador) ? DBNull.Value : (object)idUsuarioModificador),
                    new SqlParameter("@IDEquipo", idEquipo ?? Environment.MachineName),
                    new SqlParameter("@RutaPDFFirmado", string.IsNullOrEmpty(rutaPDFFirmado) ? DBNull.Value : (object)rutaPDFFirmado)
                };

                ConexionBD.EjecutarAccionFirma("USP_FIR_Documento_Firmar", pars);
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al firmar documento: " + ex.Message);
            }
        }

        public static DataTable ListarPendientesRevision(string loginUsuario, string filtroBusqueda)
        {
            string sql = @"
                SELECT 
                    vd.IDDocumento, vd.Asunto, vd.CodigoDocumento,
                    vd.AreaResponsable, vd.FechaDocumento AS FechaCreacionDoc,
                    vd.IDUsuarioCreador,
                    vd.EstadoDocumento, vd.TipoDocumento,
                    vd.RutaArchivoPDF AS RutaArchivo,
                    f.IDDocumentoFirmante AS IDFirmante, f.OrdenFirma AS Orden, f.FechaCreacion AS FechaAsignacion,
                    'Pendiente' AS EstadoFirma
                FROM dbo.FIR_DocumentoFirmante f
                INNER JOIN dbo.FIR_VW_DocumentosPendientes vd ON vd.IDDocumento = f.IDDocumento
                WHERE f.LoginUsuario = @IDUsuario
                  AND f.EsAprobado IS NULL";

            if (!string.IsNullOrEmpty(filtroBusqueda))
            {
                sql += " AND (vd.Asunto LIKE @Busqueda OR vd.CodigoDocumento LIKE @Busqueda OR vd.IDUsuarioCreador LIKE @Busqueda)";
            }

            sql += " ORDER BY f.FechaCreacion DESC";

            SqlParameter[] pars = { 
                new SqlParameter("@IDUsuario", loginUsuario),
                new SqlParameter("@Busqueda", "%" + filtroBusqueda + "%")
            };
            
            return ConexionBD.EjecutarConsultaFirmaSQL(sql, pars);
        }

        public static void RegistrarRevision(int idDocumentoFirmante, bool esAprobado, string comentario, string loginUsuario, string idEquipo)
        {
            string sql = @"
                -- 1. Actualizar estado de aprobación del Revisor
                UPDATE FIR_DocumentoFirmante
                SET EsAprobado = @EsAprobado, 
                    Comentario = @Comentario,
                    IDUsuarioModificador = @IDUsuario, 
                    FechaModificacion = GETDATE()
                WHERE IDDocumentoFirmante = @IDFirmante;

                -- Obtener IDDocumento
                DECLARE @IDDocumento INT;
                SELECT @IDDocumento = IDDocumento FROM FIR_DocumentoFirmante WHERE IDDocumentoFirmante = @IDFirmante;

                -- 2. Auditoría
                INSERT INTO FIR_DocumentoAuditoria (IDDocumento, IDUsuario, IDEquipo, TipoOperacion, TipoAccion, Descripcion, FechaCambio)
                VALUES (@IDDocumento, @IDUsuario, @IDEquipo, 'M', 'REVISION', 
                        CASE WHEN @EsAprobado = 1 THEN 'Documento APROBADO por revisor' ELSE 'Documento OBSERVADO por revisor' END, GETDATE());

                -- 3. Lógica de cambio de estado de Documento
                IF @EsAprobado = 0
                BEGIN
                    UPDATE FIR_Documento 
                    SET CodigoEstado = 'OBS', 
                        IDUsuarioModificador = @IDUsuario, 
                        FechaModificacion = GETDATE() 
                    WHERE IDDocumento = @IDDocumento;
                END
                ELSE
                BEGIN
                    IF NOT EXISTS (SELECT 1 FROM FIR_DocumentoFirmante WHERE IDDocumento = @IDDocumento AND (EsAprobado IS NULL OR EsAprobado = 0))
                    BEGIN
                        UPDATE FIR_Documento 
                        SET CodigoEstado = 'APR_FIRMA', 
                            IDUsuarioModificador = @IDUsuario, 
                            FechaModificacion = GETDATE() 
                        WHERE IDDocumento = @IDDocumento;
                    END
                END
            ";

            SqlParameter[] p = {
                new SqlParameter("@EsAprobado", esAprobado),
                new SqlParameter("@Comentario", (object)comentario ?? DBNull.Value),
                new SqlParameter("@IDUsuario", loginUsuario),
                new SqlParameter("@IDFirmante", idDocumentoFirmante),
                new SqlParameter("@IDEquipo", idEquipo ?? "SISTEMA")
            };

            ConexionBD.EjecutarAccionFirmaSQL(sql, p);
        }
        #endregion
    }
}