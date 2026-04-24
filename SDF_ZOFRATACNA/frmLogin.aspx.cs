using System;
using System.Web.UI;

// ============================================================
// Nombre del programa  : frmLogin
// Descripción          : Panel de simulación de acceso al SDF.
//                        En lugar de conectar con el SAS de ZOFRATACNA,
//                        cada botón establece manualmente las variables
//                        de sesión de un perfil de usuario y redirige
//                        al panel correspondiente. Usado exclusivamente
//                        para demostraciones y pruebas de flujo.
// Fecha desarrollo     : 24/04/2026
// Desarrollador        : Equipo TI ZOFRATACNA
// Fecha mantenimiento  :
// Persona que lo realizó:
// Nro. solicitud mant. :
// Descripción mant.    :
// ============================================================

namespace SDF_ZOFRATACNA
{
    public partial class frmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Limpiar sesión anterior al cargar el simulador
            if (!IsPostBack)
            {
                Session.Clear();
            }
        }

        // ── Método privado central ──────────────────────────────────────────
        // Carga las variables de sesión manualmente (simula respuesta del SAS)
        // y redirige al panel del rol indicado.
        // ─────────────────────────────────────────────────────────────────────
        private void SimularAcceso(
            string strIdUsuario,
            string strNombres,
            string strLoginUsuario,
            string strRol,
            string strUnidadOrganica,
            string strUrlDestino)
        {
            // Poblar variables de sesión con los mismos nombres usados en todos los formularios
            Session["IdUsuario"]       = strIdUsuario;
            Session["Nombres"]         = strNombres;
            Session["strUsuario"]      = strLoginUsuario;   // Compatibilidad con estándar SAS
            Session["Rol"]             = strRol;
            Session["UnidadOrganica"]  = strUnidadOrganica;
            Session["UrlFoto"]         = "";                // Sin foto en modo demo

            // Redirigir al panel del rol
            Response.Redirect(strUrlDestino);
        }

        // ── Administrador ────────────────────────────────────────────────────

        protected void cmdAdminUno_Click(object sender, EventArgs e)
        {
            SimularAcceso(
                strIdUsuario:       "admin01",
                strNombres:         "Administrador Zofra",
                strLoginUsuario:    "admin01",
                strRol:             "ADMIN",
                strUnidadOrganica:  "Gerencia TI",
                strUrlDestino:      "~/Formularios/Administracion/frmDashboardAdmin.aspx"
            );
        }

        // ── Registradores ────────────────────────────────────────────────────

        protected void cmdRegistradorUno_Click(object sender, EventArgs e)
        {
            SimularAcceso(
                strIdUsuario:       "reg01",
                strNombres:         "Maria Quispe Ramos",
                strLoginUsuario:    "mquispe",
                strRol:             "REG",
                strUnidadOrganica:  "Secretaria General",
                strUrlDestino:      "~/Formularios/Documentos/frmDashboardRegistrador.aspx"
            );
        }

        protected void cmdRegistradorDos_Click(object sender, EventArgs e)
        {
            SimularAcceso(
                strIdUsuario:       "reg02",
                strNombres:         "Pedro Vargas Torres",
                strLoginUsuario:    "pvargas",
                strRol:             "REG",
                strUnidadOrganica:  "Sub-Gerencia Administrativa",
                strUrlDestino:      "~/Formularios/Documentos/frmDashboardRegistrador.aspx"
            );
        }

        protected void cmdRegistradorTres_Click(object sender, EventArgs e)
        {
            SimularAcceso(
                strIdUsuario:       "reg03",
                strNombres:         "Rosa Condori Mamani",
                strLoginUsuario:    "rcondori",
                strRol:             "REG",
                strUnidadOrganica:  "Operaciones",
                strUrlDestino:      "~/Formularios/Documentos/frmDashboardRegistrador.aspx"
            );
        }

        // ── Firmantes ────────────────────────────────────────────────────────

        protected void cmdFirmanteUno_Click(object sender, EventArgs e)
        {
            SimularAcceso(
                strIdUsuario:       "firm01",
                strNombres:         "Jorge Apaza Huanca",
                strLoginUsuario:    "japaza",
                strRol:             "FIR",
                strUnidadOrganica:  "Gerencia General",
                strUrlDestino:      "~/Formularios/Firma/frmDashboardFirmante.aspx"
            );
        }

        protected void cmdFirmanteDos_Click(object sender, EventArgs e)
        {
            SimularAcceso(
                strIdUsuario:       "firm02",
                strNombres:         "Ana Ccoa Flores",
                strLoginUsuario:    "accoa",
                strRol:             "FIR",
                strUnidadOrganica:  "Sub-Gerencia Legal",
                strUrlDestino:      "~/Formularios/Firma/frmDashboardFirmante.aspx"
            );
        }

        protected void cmdFirmanteTres_Click(object sender, EventArgs e)
        {
            SimularAcceso(
                strIdUsuario:       "firm03",
                strNombres:         "Luis Huanca Pari",
                strLoginUsuario:    "lhuanca",
                strRol:             "FIR",
                strUnidadOrganica:  "Presidencia Ejecutiva",
                strUrlDestino:      "~/Formularios/Firma/frmDashboardFirmante.aspx"
            );
        }
    }
}