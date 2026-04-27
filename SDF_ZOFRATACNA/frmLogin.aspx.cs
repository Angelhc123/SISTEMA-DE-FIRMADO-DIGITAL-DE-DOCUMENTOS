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
// Fecha mantenimiento  : 27/04/2026
// Persona que lo realizó: Equipo TI ZOFRATACNA
// Nro. solicitud mant. : SDF-001
// Descripción mant.    : Se completaron los datos de los firmantes para
//                        que sean consistentes con el registrador de documentos.
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
        // Versión COMPLETA con todos los datos que espera el sistema.
        // ─────────────────────────────────────────────────────────────────────
        private void SimularAcceso(
            string strIdUsuario,
            string strNombres,
            string strLoginUsuario,
            string strRol,
            string strUnidadOrganica,
            int intIDRol,
            string strRolDescripcion,
            string strUrlDestino)
        {
            // Poblar variables de sesión con los mismos nombres usados en todos los formularios
            Session["IdUsuario"]       = strIdUsuario;
            Session["Nombres"]         = strNombres;
            Session["strUsuario"]      = strLoginUsuario;   // Compatibilidad con estándar SAS
            Session["Rol"]             = strRol;
            Session["UnidadOrganica"]  = strUnidadOrganica;
            Session["IDRol"]           = intIDRol;          // ← NUEVO: ID del rol en FIR_Maestro
            Session["RolDescripcion"]  = strRolDescripcion; // ← NUEVO: Descripción del rol
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
                intIDRol:           1,                     // Rol Administrador
                strRolDescripcion:  "Administrador del Sistema",
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
                intIDRol:           10,                    // Rol Registrador Secretaria
                strRolDescripcion:  "Registrador de Documentos",
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
                intIDRol:           11,                    // Rol Registrador Administrativo
                strRolDescripcion:  "Registrador de Documentos",
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
                intIDRol:           12,                    // Rol Registrador Operaciones
                strRolDescripcion:  "Registrador de Documentos",
                strUrlDestino:      "~/Formularios/Documentos/frmDashboardRegistrador.aspx"
            );
        }

        // ── Firmantes (COMPLETOS y CONSISTENTES con frmRegistrarDocumento) ───
        // Estos datos coinciden EXACTAMENTE con los definidos en 
        // CargarUsuariosPrueba() de frmRegistrarDocumento.aspx.cs
        
        protected void cmdFirmanteUno_Click(object sender, EventArgs e)
        {
            SimularAcceso(
                strIdUsuario:       "firm01",
                strNombres:         "Jorge Apaza Huanca",
                strLoginUsuario:    "japaza",
                strRol:             "FIR",
                strUnidadOrganica:  "Gerencia General",
                intIDRol:           17,                    // ← IDRol = Gerente General
                strRolDescripcion:  "Gerente General",     // ← Coincide con frmRegistrarDocumento
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
                strUnidadOrganica:  "Sub-Gerencia General",
                intIDRol:           18,                    // ← IDRol = Sub-Gerente
                strRolDescripcion:  "Sub-Gerente",         // ← Coincide con frmRegistrarDocumento
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
                strUnidadOrganica:  "Jefatura de Area",
                intIDRol:           19,                    // ← IDRol = Jefe de Area
                strRolDescripcion:  "Jefe de Area",        // ← Coincide con frmRegistrarDocumento
                strUrlDestino:      "~/Formularios/Firma/frmDashboardFirmante.aspx"
            );
        }
        
    }
}