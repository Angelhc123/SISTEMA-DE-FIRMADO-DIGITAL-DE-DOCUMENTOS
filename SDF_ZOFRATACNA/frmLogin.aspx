<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="SDF_ZOFRATACNA.frmLogin" %>
<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SDF ZOFRATACNA — Simulador de Acceso</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet" />
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #001e40 0%, #003366 60%, #00509e 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        /* ── Tarjeta principal ── */
        .card-simulador {
            background: rgba(255,255,255,0.97);
            border-radius: 1.25rem;
            box-shadow: 0 24px 64px rgba(0,0,0,0.28);
            width: 100%;
            max-width: 760px;
            overflow: hidden;
        }

        /* ── Encabezado ── */
        .card-header {
            background: linear-gradient(90deg, #001e40, #003d82);
            color: #fff;
            padding: 1.5rem 2rem;
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        .card-header .material-symbols-outlined { font-size: 2.2rem; }
        .card-header h1 { font-size: 1.2rem; font-weight: 700; letter-spacing: 0.02em; }
        .card-header p  { font-size: 0.78rem; opacity: 0.75; margin-top: 2px; }

        /* ── Aviso de simulación ── */
        .aviso-sim {
            background: #fff8e1;
            border-left: 4px solid #f59e0b;
            margin: 1.5rem 2rem 0;
            padding: 0.75rem 1rem;
            border-radius: 0.5rem;
            font-size: 0.8rem;
            color: #92400e;
            display: flex;
            align-items: flex-start;
            gap: 0.5rem;
        }
        .aviso-sim .material-symbols-outlined { font-size: 1.1rem; margin-top: 1px; flex-shrink: 0; }

        /* ── Secciones de rol ── */
        .roles-wrapper { padding: 1.5rem 2rem 2rem; display: flex; flex-direction: column; gap: 1.25rem; }

        .rol-group { border: 1px solid #e2e8f0; border-radius: 0.75rem; overflow: hidden; }

        .rol-group-header {
            display: flex;
            align-items: center;
            gap: 0.6rem;
            padding: 0.65rem 1rem;
            font-size: 0.78rem;
            font-weight: 600;
            letter-spacing: 0.06em;
            text-transform: uppercase;
        }
        .rol-group-header .material-symbols-outlined { font-size: 1rem; }

        .rol-group-header.admin   { background: #eff6ff; color: #1d4ed8; border-bottom: 1px solid #dbeafe; }
        .rol-group-header.reg     { background: #f0fdf4; color: #15803d; border-bottom: 1px solid #bbf7d0; }
        .rol-group-header.firmante{ background: #fdf4ff; color: #7e22ce; border-bottom: 1px solid #e9d5ff; }

        .rol-group-body { display: flex; flex-wrap: wrap; gap: 0.75rem; padding: 1rem; }

        /* ── Botones de simulación ── */
        .btn-sim {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            border: none;
            border-radius: 0.6rem;
            padding: 0.65rem 1.2rem;
            font-size: 0.83rem;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.12s ease, box-shadow 0.12s ease, opacity 0.12s ease;
            text-decoration: none;
            font-family: inherit;
        }
        .btn-sim:hover  { transform: translateY(-2px); opacity: 0.92; }
        .btn-sim:active { transform: translateY(0);    box-shadow: none !important; }
        .btn-sim .material-symbols-outlined { font-size: 1.05rem; }

        .btn-admin   { background: #1d4ed8; color: #fff; box-shadow: 0 4px 12px rgba(29,78,216,0.3); }
        .btn-reg     { background: #16a34a; color: #fff; box-shadow: 0 4px 12px rgba(22,163,74,0.3); }
        .btn-firmante{ background: #7c3aed; color: #fff; box-shadow: 0 4px 12px rgba(124,58,237,0.3); }

        /* ── Etiqueta de usuario simulado ── */
        .user-tag {
            font-size: 0.68rem;
            font-weight: 500;
            opacity: 0.75;
            display: block;
            margin-top: 1px;
        }

        /* ── Mensaje de error ── */
        .msg-error {
            background: #fef2f2;
            border: 1px solid #fecaca;
            color: #b91c1c;
            padding: 0.6rem 1rem;
            border-radius: 0.5rem;
            font-size: 0.8rem;
            margin: 0 2rem 1rem;
        }

        /* ── Footer ── */
        .card-footer {
            background: #f8fafc;
            border-top: 1px solid #e2e8f0;
            padding: 0.75rem 2rem;
            text-align: center;
            font-size: 0.7rem;
            color: #94a3b8;
        }
    </style>
</head>
<body>
    <div class="card-simulador">
        <!-- Encabezado -->
        <div class="card-header">
            <span class="material-symbols-outlined">shield_person</span>
            <div>
                <h1>SDF ZOFRATACNA — Panel de Simulación</h1>
                <p>Seleccione un perfil de usuario para iniciar el flujo de trabajo</p>
            </div>
        </div>

        <form id="frmSimulador" runat="server">

            <!-- Aviso de modo simulación -->
            <div class="aviso-sim">
                <span class="material-symbols-outlined">info</span>
                <span>
                    <strong>Modo de demostración.</strong> No se requiere contraseña.
                    Al presionar un botón, las variables de sesión se establecen manualmente
                    y se redirige al panel correspondiente, simulando la autenticación del SAS de ZOFRATACNA.
                </span>
            </div>

            <!-- Mensaje de error (oculto por defecto) -->
            <asp:Label ID="lblError" runat="server" CssClass="msg-error" Visible="false" />

            <div class="roles-wrapper">

                <!-- ── Administrador ── -->
                <div class="rol-group">
                    <div class="rol-group-header admin">
                        <span class="material-symbols-outlined">manage_accounts</span>
                        Administrador
                    </div>
                    <div class="rol-group-body">
                        <asp:Button ID="cmdAdminUno" runat="server"
                            CssClass="btn-sim btn-admin"
                            Text="&#xe8a3; Administrador 1"
                            OnClick="cmdAdminUno_Click"
                            ToolTip="Inicia sesión como Administrador Zofra" />
                    </div>
                </div>

                <!-- ── Registrador ── -->
                <div class="rol-group">
                    <div class="rol-group-header reg">
                        <span class="material-symbols-outlined">edit_document</span>
                        Registrador
                    </div>
                    <div class="rol-group-body">
                        <asp:Button ID="cmdRegistradorUno" runat="server"
                            CssClass="btn-sim btn-reg"
                            Text="Registrador 1"
                            OnClick="cmdRegistradorUno_Click"
                            ToolTip="Maria Quispe Ramos" />
                        <asp:Button ID="cmdRegistradorDos" runat="server"
                            CssClass="btn-sim btn-reg"
                            Text="Registrador 2"
                            OnClick="cmdRegistradorDos_Click"
                            ToolTip="Pedro Vargas Torres" />
                        <asp:Button ID="cmdRegistradorTres" runat="server"
                            CssClass="btn-sim btn-reg"
                            Text="Registrador 3"
                            OnClick="cmdRegistradorTres_Click"
                            ToolTip="Rosa Condori Mamani" />
                    </div>
                </div>

                <!-- ── Firmante ── -->
                <div class="rol-group">
                    <div class="rol-group-header firmante">
                        <span class="material-symbols-outlined">draw</span>
                        Firmante
                    </div>
                    <div class="rol-group-body">
                        <asp:Button ID="cmdFirmanteUno" runat="server"
                            CssClass="btn-sim btn-firmante"
                            Text="Firmante 1"
                            OnClick="cmdFirmanteUno_Click"
                            ToolTip="Jorge Apaza Huanca" />
                        <asp:Button ID="cmdFirmanteDos" runat="server"
                            CssClass="btn-sim btn-firmante"
                            Text="Firmante 2"
                            OnClick="cmdFirmanteDos_Click"
                            ToolTip="Ana Ccoa Flores" />
                        <asp:Button ID="cmdFirmanteTres" runat="server"
                            CssClass="btn-sim btn-firmante"
                            Text="Firmante 3"
                            OnClick="cmdFirmanteTres_Click"
                            ToolTip="Luis Huanca Pari" />
                    </div>
                </div>

            </div><!-- /roles-wrapper -->
        </form>

        <div class="card-footer">
            &copy; 2026 ZOFRATACNA &mdash; Sistema de Firma Digital &mdash; <em>Modo Demo</em>
        </div>
    </div>
</body>
</html>