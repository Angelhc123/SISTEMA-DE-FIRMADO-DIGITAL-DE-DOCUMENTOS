<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="SDF_ZOFRATACNA.frmLogin" %>
<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SDF ZOFRATACNA — Acceso</title>
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
        .grupo { margin-bottom: 1.5rem; }
        .grupo-titulo {
            font-size: 0.75rem;
            font-weight: 600;
            color: #475569;
            margin-bottom: 0.5rem;
        }
        select, input[type="submit"].btn-acceso {
            width: 100%;
            padding: 0.75rem;
            border-radius: 8px;
            border: 1px solid #cbd5e1;
            font-family: 'Inter', sans-serif;
            font-size: 0.9rem;
        }
        select:focus {
            outline: none;
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37,99,235,0.1);
        }
        input[type="submit"].btn-acceso {
            background: #001e40;
            color: white;
            font-weight: 600;
            border: none;
            cursor: pointer;
            transition: background 0.2s;
            margin-top: 1rem;
        }
        input[type="submit"].btn-acceso:hover { background: #1e3a8a; }
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
            <p>Acceso al Sistema de Firma Digital</p>
        </div>

        <form id="frmLogin" runat="server">
            <asp:ScriptManager ID="smPrincipal" runat="server" />
            <asp:UpdatePanel ID="upLogin" runat="server">
                <ContentTemplate>
                    <div class="grupo">
                        <div class="grupo-titulo">Seleccione su Rol</div>
                        <asp:DropDownList ID="ddlRoles" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRoles_SelectedIndexChanged">
                            <asp:ListItem Text="-- Seleccione un Rol --" Value="" />
                            <asp:ListItem Text="Administrador" Value="ADMIN" />
                            <asp:ListItem Text="Registrador" Value="REGISTRADOR" />
                            <asp:ListItem Text="Firmador-Revisor" Value="FIRMADOR_REVISOR" />
                        </asp:DropDownList>
                    </div>

                    <div class="grupo">
                        <div class="grupo-titulo">Seleccione su Usuario</div>
                        <asp:DropDownList ID="ddlUsuarios" runat="server" Enabled="false">
                            <asp:ListItem Text="-- Seleccione un usuario --" Value="" />
                        </asp:DropDownList>
                    </div>

                    <asp:Button ID="btnIngresar" runat="server" Text="Ingresar al Sistema" CssClass="btn-acceso" OnClick="btnIngresar_Click" />
                    
                    <asp:Label ID="lblError" runat="server" Visible="false" Style="color:#b91c1c; font-size:0.8rem; display:block; margin-top:1rem; text-align:center;" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </form>

        <div class="footer">&copy; 2026 ZOFRATACNA &mdash; Sistema de Firma Digital</div>
    </div>
</body>
</html>
