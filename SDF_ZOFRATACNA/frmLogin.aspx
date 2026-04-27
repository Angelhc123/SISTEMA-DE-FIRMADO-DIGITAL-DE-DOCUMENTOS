<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="SDF_ZOFRATACNA.frmLogin" %>
<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SDF ZOFRATACNA — Acceso Demo</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Inter', sans-serif;
            background: #001e40;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .panel {
            background: #fff;
            border-radius: 14px;
            padding: 2.5rem;
            width: 480px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.5);
        }

        .panel-logo {
            text-align: center;
            margin-bottom: 2rem;
        }
        .panel-logo h1 {
            font-size: 1.4rem;
            font-weight: 700;
            color: #001e40;
        }
        .panel-logo p {
            font-size: 0.8rem;
            color: #64748b;
            margin-top: 4px;
        }

        .aviso {
            background: #fef9c3;
            border-left: 3px solid #ca8a04;
            padding: 0.6rem 0.9rem;
            border-radius: 6px;
            font-size: 0.75rem;
            color: #78350f;
            margin-bottom: 1.8rem;
        }

        .grupo { margin-bottom: 1.5rem; }

        .grupo-titulo {
            font-size: 0.68rem;
            font-weight: 700;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            color: #94a3b8;
            margin-bottom: 0.6rem;
            padding-bottom: 0.4rem;
            border-bottom: 1px solid #e2e8f0;
        }

        .grupo-botones { display: flex; flex-wrap: wrap; gap: 0.5rem; }

        /* Botones ASP.NET — se resetea el estilo nativo */
        input[type="submit"].btn-acceso {
            border: none;
            border-radius: 8px;
            padding: 0.6rem 1.1rem;
            font-size: 0.82rem;
            font-weight: 600;
            cursor: pointer;
            font-family: 'Inter', sans-serif;
            transition: opacity 0.15s, transform 0.1s;
        }
        input[type="submit"].btn-acceso:hover  { opacity: 0.88; transform: translateY(-1px); }
        input[type="submit"].btn-acceso:active { transform: translateY(0); }

        .btn-admin    { background: #1d4ed8; color: #fff; }
        .btn-reg      { background: #16a34a; color: #fff; }
        .btn-firmante { background: #7c3aed; color: #fff; }

        .footer {
            text-align: center;
            font-size: 0.68rem;
            color: #94a3b8;
            margin-top: 1.5rem;
        }
    </style>
</head>
<body>
    <div class="panel">
        <div class="panel-logo">
            <h1>SDF ZOFRATACNA</h1>
            <p>Seleccione un usuario para simular el acceso</p>
        </div>

        <div class="aviso">
            &#9432; Modo demo — no se requiere contraseña. Los datos de sesión se cargan automáticamente.
        </div>

        <form id="frmSimulador" runat="server">

            <%-- Grupo: Administrador --%>
            <div class="grupo">
                <div class="grupo-titulo">Administrador</div>
                <div class="grupo-botones">
                    <asp:Button ID="cmdAdminUno" runat="server"
                        Text="Administrador 1"
                        CssClass="btn-acceso btn-admin"
                        OnClick="cmdAdminUno_Click" />
                </div>
            </div>

            <%-- Grupo: Registrador --%>
            <div class="grupo">
                <div class="grupo-titulo">Registrador</div>
                <div class="grupo-botones">
                    <asp:Button ID="cmdRegistradorUno" runat="server"
                        Text="Registrador 1"
                        CssClass="btn-acceso btn-reg"
                        OnClick="cmdRegistradorUno_Click" />
                    <asp:Button ID="cmdRegistradorDos" runat="server"
                        Text="Registrador 2"
                        CssClass="btn-acceso btn-reg"
                        OnClick="cmdRegistradorDos_Click" />
                    <asp:Button ID="cmdRegistradorTres" runat="server"
                        Text="Registrador 3"
                        CssClass="btn-acceso btn-reg"
                        OnClick="cmdRegistradorTres_Click" />
                </div>
            </div>

            <%-- Grupo: Firmante --%>
            <div class="grupo">
                <div class="grupo-titulo">Firmante</div>
                <div class="grupo-botones">
                    <asp:Button ID="cmdFirmanteUno" runat="server"
                        Text="Firmante 1"
                        CssClass="btn-acceso btn-firmante"
                        OnClick="cmdFirmanteUno_Click" />
                    <asp:Button ID="cmdFirmanteDos" runat="server"
                        Text="Firmante 2"
                        CssClass="btn-acceso btn-firmante"
                        OnClick="cmdFirmanteDos_Click" />
                    <asp:Button ID="cmdFirmanteTres" runat="server"
                        Text="Firmante 3"
                        CssClass="btn-acceso btn-firmante"
                        OnClick="cmdFirmanteTres_Click" />
                </div>
            </div>

            <%-- Mensaje de error (solo visible si ocurre un error de redirección) --%>
            <asp:Label ID="lblError" runat="server" Visible="false"
                Style="color:#b91c1c;font-size:0.78rem;" />

        </form>

        <div class="footer">&copy; 2026 ZOFRATACNA &mdash; Sistema de Firma Digital</div>
    </div>
</body>
</html>