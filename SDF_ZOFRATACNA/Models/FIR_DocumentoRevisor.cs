using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SDF_ZOFRATACNA.Models
{
    public class FIR_DocumentoRevisor
    {
        public int IDDocumentoRevisor { get; set; }
        public int IDDocumento { get; set; }
        public string LoginUsuario { get; set; }
        public string NombreRevisor { get; set; }
        public string CorreoRevisor { get; set; }
        public int DiasMaxRevision { get; set; }
        public DateTime? FechaLimite { get; set; }
        public bool Completado { get; set; }
        public string CodigoResultado { get; set; }
        public DateTime? FechaRevision { get; set; }
        public int Version { get; set; }
        public string IDUsuarioCreador { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string IDUsuarioModificador { get; set; }
        public DateTime? FechaModificacion { get; set; }

        public static bool TodosRevisaron(int idDocumento)
        {
            string sql = "SELECT COUNT(*) AS Faltantes FROM FIR_DocumentoRevisor WHERE IDDocumento = @ID AND Completado = 0";
            System.Data.DataTable dt = SDF_ZOFRATACNA.App_Code.DAL.ConexionBD.EjecutarConsultaFirmaSQL(sql, new System.Data.SqlClient.SqlParameter[] { new System.Data.SqlClient.SqlParameter("@ID", idDocumento) });
            if (dt != null && dt.Rows.Count > 0)
            {
                return Convert.ToInt32(dt.Rows[0]["Faltantes"]) == 0;
            }
            return true;
        }

        public static void RegistrarRevision(int idDocumento, string loginRevisor, string codigoResultado, string observaciones)
        {
            string sqlTx = @"
                BEGIN TRY
                    BEGIN TRANSACTION;

                    -- 1. Actualizar el estado del revisor actual
                    UPDATE dbo.FIR_DocumentoRevisor
                    SET Completado = 1,
                        CodigoResultado = @CodigoResultado,
                        FechaRevision = GETDATE(),
                        IDUsuarioModificador = @LoginRevisor,
                        FechaModificacion = GETDATE()
                    WHERE IDDocumento = @ID AND LoginUsuario = @LoginRevisor;

                    -- 2. Insertar observación si existe
                    IF LEN(ISNULL(@Observaciones, '')) > 0
                    BEGIN
                        INSERT INTO dbo.FIR_Observacion (IDDocumento, LoginUsuario, NombreRevisor, Descripcion, Version, IDUsuarioCreador, FechaCreacion)
                        SELECT @ID, @LoginRevisor, ISNULL(NombreRevisor, @LoginRevisor), @Observaciones, Version, @LoginRevisor, GETDATE()
                        FROM dbo.FIR_DocumentoRevisor
                        WHERE IDDocumento = @ID AND LoginUsuario = @LoginRevisor;
                    END

                    -- 3. Comprobar si TODOS ya revisaron
                    DECLARE @Faltantes INT;
                    SELECT @Faltantes = COUNT(*) FROM dbo.FIR_DocumentoRevisor WHERE IDDocumento = @ID AND Completado = 0;

                    IF @Faltantes = 0
                    BEGIN
                        -- Todos revisaron. ¿Alguien observó?
                        DECLARE @ConObservacion INT;
                        SELECT @ConObservacion = COUNT(*) FROM dbo.FIR_DocumentoRevisor WHERE IDDocumento = @ID AND CodigoResultado = 'OBS';

                        IF @ConObservacion > 0
                        BEGIN
                            -- Pasa a estado Observado (OBS)
                            UPDATE dbo.FIR_Documento SET CodigoEstado = 'OBS', FechaUltimaAccion = GETDATE() WHERE IDDocumento = @ID;
                        END
                        ELSE
                        BEGIN
                            -- Pasa a estado Aprobado para Firma (APR_FIRMA)
                            UPDATE dbo.FIR_Documento SET CodigoEstado = 'APR_FIRMA', FechaUltimaAccion = GETDATE() WHERE IDDocumento = @ID;
                        END
                    END

                    COMMIT TRANSACTION;
                END TRY
                BEGIN CATCH
                    IF @@TRANCOUNT > 0
                        ROLLBACK TRANSACTION;
                    THROW;
                END CATCH
            ";

            System.Data.SqlClient.SqlParameter[] pars = {
                new System.Data.SqlClient.SqlParameter("@ID", idDocumento),
                new System.Data.SqlClient.SqlParameter("@LoginRevisor", loginRevisor),
                new System.Data.SqlClient.SqlParameter("@CodigoResultado", codigoResultado),
                new System.Data.SqlClient.SqlParameter("@Observaciones", string.IsNullOrEmpty(observaciones) ? (object)DBNull.Value : observaciones)
            };

            SDF_ZOFRATACNA.App_Code.DAL.ConexionBD.EjecutarAccionFirmaSQL(sqlTx, pars);
        }

        public static System.Data.DataTable ListarPendientesRevision(string loginUsuario, string filtroBusqueda)
        {
            string sql = @"
                SELECT 
                    vd.IDDocumento, vd.Asunto, vd.CodigoDocumento,
                    vd.AreaResponsable, vd.FechaDocumento AS FechaCreacionDoc,
                    vd.IDUsuarioCreador,
                    vd.EstadoDocumento, vd.TipoDocumento,
                    vd.RutaArchivoPDF AS RutaArchivo,
                    f.IDDocumento AS IDFirmante, -- Reutilizamos esto en la UI
                    0 AS Orden, f.FechaCreacion AS FechaAsignacion,
                    'Pendiente' AS EstadoFirma
                FROM dbo.FIR_DocumentoRevisor f
                INNER JOIN dbo.FIR_VW_DocumentosPendientes vd ON vd.IDDocumento = f.IDDocumento
                WHERE f.LoginUsuario = @IDUsuario
                  AND f.Completado = 0";

            if (!string.IsNullOrEmpty(filtroBusqueda))
            {
                sql += " AND (vd.Asunto LIKE @Busqueda OR vd.CodigoDocumento LIKE @Busqueda OR vd.IDUsuarioCreador LIKE @Busqueda)";
            }

            sql += " ORDER BY f.FechaCreacion DESC";

            System.Data.SqlClient.SqlParameter[] pars = { 
                new System.Data.SqlClient.SqlParameter("@IDUsuario", loginUsuario),
                new System.Data.SqlClient.SqlParameter("@Busqueda", "%" + filtroBusqueda + "%")
            };
            
            return SDF_ZOFRATACNA.App_Code.DAL.ConexionBD.EjecutarConsultaFirmaSQL(sql, pars);
        }
    }
}