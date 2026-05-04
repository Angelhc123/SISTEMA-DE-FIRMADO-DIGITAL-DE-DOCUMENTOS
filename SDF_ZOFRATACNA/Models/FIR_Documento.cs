using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Script.Serialization;
using SDF_ZOFRATACNA.App_Code.DAL;

namespace SDF_ZOFRATACNA.Models
{
    public class FIR_Documento
    {
        #region Propiedades
        public int IDDocumento { get; set; }
        public string Asunto { get; set; }
        public string CodigoTipoDocumento { get; set; }
        public string AreaResponsable { get; set; }
        public DateTime FechaDocumento { get; set; }
        public string CodigoDocumento { get; set; }
        public string RutaArchivoPDF { get; set; }
        public string CodigoEstado { get; set; }
        public int Version { get; set; }
        public string LoginRegistrador { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime? FechaUltimaAccion { get; set; }
        #endregion

        #region Clases anidadas
        public class FirmanteJson
        {
            public string IDUsuarioFirmante { get; set; }
            public string NombreFirmante { get; set; }
            public string CorreoFirmante { get; set; }
            public int Orden { get; set; }
            public string CodigoRol { get; set; }
        }
        #endregion

        #region Métodos
        public static int Registrar(
            string asunto,
            string codigoTipoDocumento,
            string areaResponsable,
            DateTime fechaDocumento,
            string codigoDocumento,
            string rutaArchivoPDF,
            string loginRegistrador,
            string idEquipo,
            List<FirmanteJson> firmantes)
        {
            try
            {
                // Validar que la carpeta Temp exista
                string tempFolder = System.Web.Hosting.HostingEnvironment.MapPath("~/Temp/");
                if (!Directory.Exists(tempFolder))
                    Directory.CreateDirectory(tempFolder);

                // Generar nombre único para el archivo
                string tipoDoc = codigoTipoDocumento;
                string areaResp = areaResponsable.Replace(" ", "_");
                string fechaStr = DateTime.Now.ToString("yyyyMMdd_HHmmss_fff");
                string guid = Guid.NewGuid().ToString().Substring(0, 8);

                string nuevoNombre = $"{tipoDoc}_{areaResp}_{fechaStr}_{guid}.pdf";
                string rutaRelativa = "~/Temp/" + nuevoNombre;
                string rutaFisica = Path.Combine(tempFolder, nuevoNombre);

                // Copiar archivo a la carpeta Temp
                if (File.Exists(rutaArchivoPDF.Replace("~/", System.Web.Hosting.HostingEnvironment.MapPath("~/"))))
                {
                    File.Copy(rutaArchivoPDF.Replace("~/", System.Web.Hosting.HostingEnvironment.MapPath("~/")), rutaFisica, true);
                }

                // Serializar firmantes a JSON
                JavaScriptSerializer js = new JavaScriptSerializer();
                string jsonFirmantes = js.Serialize(firmantes);

                // Ejecutar SP
                SqlParameter[] pars = {
                    new SqlParameter("@Asunto", asunto),
                    new SqlParameter("@CodigoTipoDocumento", codigoTipoDocumento),
                    new SqlParameter("@AreaResponsable", areaResponsable),
                    new SqlParameter("@FechaDocumento", fechaDocumento),
                    new SqlParameter("@CodigoDocumento", codigoDocumento),
                    new SqlParameter("@RutaArchivoPDF", rutaRelativa),
                    new SqlParameter("@LoginRegistrador", loginRegistrador),
                    new SqlParameter("@IDEquipo", idEquipo ?? Environment.MachineName),
                    new SqlParameter("@JsonFirmantes", jsonFirmantes)
                };

                DataTable dt = ConexionBD.EjecutarConsultaFirma("USP_FIR_Documento_Registrar", pars);

                if (dt != null && dt.Rows.Count > 0)
                    return Convert.ToInt32(dt.Rows[0]["IDDocumento"]);

                return 0;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al registrar documento: " + ex.Message);
            }
        }

        public static DataTable ListarPorRegistrador(string loginRegistrador)
        {
            try
            {
                string sql = @"
                    SELECT 
                        d.IDDocumento, d.Asunto, d.CodigoDocumento,
                        d.AreaResponsable, d.FechaDocumento,
                        d.CodigoEstado, d.Version,
                        m.Descripcion AS Estado,
                        t.Descripcion AS TipoDocumento,
                        d.RutaArchivoPDF,
                        d.FechaCreacion
                    FROM FIR_Documento d
                    LEFT JOIN FIR_Maestro m ON m.Tipo = 'ESTADO_DOC' AND m.Codigo = d.CodigoEstado
                    LEFT JOIN FIR_Maestro t ON t.Tipo = 'TIPO_DOC' AND t.Codigo = d.CodigoTipoDocumento
                    WHERE d.LoginRegistrador = @LoginRegistrador
                    ORDER BY d.FechaCreacion DESC";

                SqlParameter[] pars = { new SqlParameter("@LoginRegistrador", loginRegistrador) };
                return ConexionBD.EjecutarConsultaFirmaSQL(sql, pars);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar documentos: " + ex.Message);
            }
        }
        public static string ObtenerRutaPDF(int idDocumento)
        {
            try
            {
                string sql = "SELECT RutaArchivoPDF FROM FIR_Documento WHERE IDDocumento = @ID";
                DataTable dt = ConexionBD.EjecutarConsultaFirmaSQL(sql, new SqlParameter[] { new SqlParameter("@ID", idDocumento) });
                if (dt.Rows.Count > 0)
                    return dt.Rows[0]["RutaArchivoPDF"].ToString();
                return "";
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener ruta del PDF: " + ex.Message);
            }
        }

        public static void SubirCorreccion(int idDocumento, string login, string rutaRelativa)
        {
            string sqlTx = @"
                BEGIN TRY
                    BEGIN TRANSACTION;

                    DECLARE @NewVersion INT;
                    SELECT @NewVersion = Version + 1 FROM dbo.FIR_Documento WHERE IDDocumento = @ID;

                    -- Actualizar Documento
                    UPDATE dbo.FIR_Documento
                    SET Version = @NewVersion, 
                        RutaArchivoPDF = @Ruta, 
                        CodigoEstado = 'EN_REV',
                        FechaUltimaAccion = GETDATE(),
                        IDUsuarioModificador = @Login,
                        FechaModificacion = GETDATE()
                    WHERE IDDocumento = @ID;

                    -- Insertar en Historial de Versiones
                    INSERT INTO dbo.FIR_VersionDocumento (IDDocumento, NumeroVersion, RutaArchivo, Motivo, IDUsuarioCreador, FechaCreacion)
                    VALUES (@ID, @NewVersion, @Ruta, 'Corrección por observaciones', @Login, GETDATE());

                    -- Insertar Auditoría
                    INSERT INTO dbo.FIR_DocumentoAuditoria (IDDocumento, IDUsuario, TipoOperacion, TipoAccion, Descripcion, FechaCambio)
                    VALUES (@ID, @Login, 'M', 'CORRECCION', 'Se subió una nueva versión corrigiendo observaciones. Versión: ' + CAST(@NewVersion AS VARCHAR), GETDATE());

                    -- Reiniciar Revisores
                    UPDATE dbo.FIR_DocumentoFirmante
                    SET EsAprobado = NULL,
                        Comentario = NULL,
                        IDUsuarioModificador = @Login,
                        FechaModificacion = GETDATE()
                    WHERE IDDocumento = @ID;

                    COMMIT TRANSACTION;
                END TRY
                BEGIN CATCH
                    IF @@TRANCOUNT > 0
                        ROLLBACK TRANSACTION;
                    THROW;
                END CATCH
            ";

            SqlParameter[] pars = {
                new SqlParameter("@ID", idDocumento),
                new SqlParameter("@Ruta", rutaRelativa),
                new SqlParameter("@Login", login)
            };

            ConexionBD.EjecutarAccionFirmaSQL(sqlTx, pars);
        }
        #endregion
    }
}