<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmConfiguracionAdmin.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Administracion.frmConfiguracionAdmin" %>

<!DOCTYPE html>
<html class="light" lang="es">
<head runat="server">
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>SDF ZOFRATACNA - Ajustes de Administración</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@400;600;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "surface-container-highest": "#e0e3e5",
                        "primary-fixed-dim": "#a7c8ff",
                        "on-primary-fixed-variant": "#1f477b",
                        "on-primary-container": "#799dd6",
                        "primary": "#001e40",
                        "surface-container-high": "#e6e8ea",
                        "tertiary": "#381300",
                        "surface-container": "#eceef0",
                        "secondary-container": "#cbe7f5",
                        "inverse-surface": "#2d3133",
                        "on-secondary": "#ffffff",
                        "surface-bright": "#f8f9fb",
                        "error-container": "#ffdad6",
                        "tertiary-container": "#592300",
                        "on-primary-fixed": "#001b3c",
                        "on-surface": "#191c1e",
                        "on-secondary-fixed": "#021f29",
                        "surface-variant": "#e0e3e5",
                        "primary-container": "#003366",
                        "surface-container-low": "#f2f4f6",
                        "on-tertiary-container": "#d8885c",
                        "secondary-fixed-dim": "#afcbd8",
                        "on-background": "#191c1e",
                        "secondary": "#48626e",
                        "error": "#ba1a1a",
                        "surface-tint": "#3a5f94",
                        "on-tertiary-fixed": "#341100",
                        "on-tertiary": "#ffffff",
                        "primary-fixed": "#d5e3ff",
                        "inverse-on-surface": "#eff1f3",
                        "tertiary-fixed": "#ffdbca",
                        "outline-variant": "#c3c6d1",
                        "surface": "#f8f9fb",
                        "on-surface-variant": "#43474f",
                        "inverse-primary": "#a7c8ff",
                        "surface-dim": "#d8dadc",
                        "secondary-fixed": "#cbe7f5",
                        "on-error-container": "#93000a",
                        "tertiary-fixed-dim": "#ffb690",
                        "surface-container-lowest": "#ffffff",
                        "on-error": "#ffffff",
                        "outline": "#737780",
                        "on-secondary-fixed-variant": "#304a55",
                        "on-tertiary-fixed-variant": "#723610",
                        "background": "#f8f9fb",
                        "on-primary": "#ffffff",
                        "on-secondary-container": "#4e6874"
                    },
                    borderRadius: {
                        "DEFAULT": "0.125rem",
                        "lg": "0.25rem",
                        "xl": "0.5rem",
                        "full": "0.75rem"
                    },
                    fontFamily: {
                        "headline": ["Public Sans", "sans-serif"],
                        "body": ["Inter", "sans-serif"],
                        "label": ["Inter", "sans-serif"]
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-background text-on-background font-body antialiased selection:bg-primary-container selection:text-on-primary min-h-screen flex">
    <form id="form1" runat="server">
        <nav class="fixed left-0 top-0 h-screen w-72 border-r border-transparent bg-slate-100 flex flex-col p-4 z-40">
            <div class="flex items-center gap-4 px-4 py-6 mb-4">
                <div class="w-12 h-12 rounded-xl bg-primary flex items-center justify-center shrink-0">
                    <span class="material-symbols-outlined text-on-primary" style="font-variation-settings: 'FILL' 1;">account_balance</span>
                </div>
                <div>
                    <h1 class="text-xl font-bold text-[#001e40] font-headline tracking-tight">SDF ZOFRATACNA</h1>
                    <p class="text-xs text-slate-500 font-label">Arquitectura de Confianza</p>
                </div>
            </div>
            
            <ul class="flex flex-col gap-1 flex-1">
                <li>
                    <a class="flex items-center gap-3 px-4 py-3 text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 font-public-sans font-semibold tracking-tight rounded-lg" href="~/Formularios/Administracion/frmDashboardAdmin.aspx" runat="server">
                        <span class="material-symbols-outlined font-light">dashboard</span>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li>
                    <a class="flex items-center gap-3 px-4 py-3 text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 font-public-sans font-semibold tracking-tight rounded-lg" href="~/Formularios/Administracion/frmReporteExhaustivo.aspx" runat="server">
                        <span class="material-symbols-outlined font-light">analytics</span>
                        <span>Reportes y Estadísticas</span>
                    </a>
                </li>
                <li>
                    <!-- Active Tab -->
                    <a class="flex items-center gap-3 px-4 py-3 text-[#001e40] dark:text-white font-bold bg-white dark:bg-slate-800 rounded-lg shadow-sm font-public-sans tracking-tight scale-95 transition-transform" href="~/Formularios/Administracion/frmConfiguracionAdmin.aspx" runat="server">
                        <span class="material-symbols-outlined font-light">settings_applications</span>
                        <span>Configuración de Sistema</span>
                    </a>
                </li>
                <li>
                    <a class="flex items-center gap-3 px-4 py-3 text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 font-public-sans font-semibold tracking-tight rounded-lg" href="~/Formularios/Administracion/frmGestionUsuarios.aspx" runat="server">
                        <span class="material-symbols-outlined font-light">manage_accounts</span>
                        <span>Gestión de Usuarios</span>
                    </a>
                </li>
                <li>
                    <a class="flex items-center gap-3 px-4 py-3 text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 font-public-sans font-semibold tracking-tight rounded-lg" href="~/Formularios/Comunes/frmSoporte.aspx" runat="server">
                        <span class="material-symbols-outlined font-light">contact_support</span>
                        <span>Soporte</span>
                    </a>
                </li>
            </ul>
        </nav>

        <header class="fixed top-0 right-0 w-[calc(100%-18rem)] h-16 z-50 bg-white/85 backdrop-blur-md border-b border-slate-200/50 shadow-sm flex items-center justify-between px-8 font-inter text-sm">
            <div class="flex-1 flex items-center">
                <!-- Search hidden for structural alignment or own layout -->
            </div>
            
            <div class="flex items-center gap-6">
                <div class="flex items-center gap-2 text-slate-600">
                    <button type="button" class="p-2 rounded-full hover:text-[#003366] hover:bg-surface-container transition-all opacity-90 hover:opacity-100">
                        <span class="material-symbols-outlined">notifications</span>
                    </button>
                    <button type="button" class="p-2 rounded-full hover:text-[#003366] hover:bg-surface-container transition-all opacity-90 hover:opacity-100">
                        <span class="material-symbols-outlined">help_outline</span>
                    </button>
                </div>
                
                <div class="h-8 w-px bg-outline-variant/30"></div>
                
                <div class="flex items-center gap-3">
                    <img alt="Usuario Session" class="w-8 h-8 rounded-full border border-surface-container-high" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCvdMtdE3DO-EPwhOJYSdSTjtVE_cP871X6_fAoICkHD-zt9FGPssRY7Z2iG03AbL1XbKKkSCiwhYTv634oCfNQpPA6WqYshQyypDlIjVQEjFsDn3GNMEyIylgC_g3YMDJNDMwSJqKkRqI1SdZZLEssg6dttJU7rt0lF0gEPhT-4qiQ1-7rMBIzFU_FGbSI8OEr96EaTXYEVowjXfzc0YkyhOMzk3D39HUnIzBI4JNNjN_r8lGFb3MEHYkDEV2bW8RzQVAgKuUL9MSz" />
                    <div class="hidden sm:flex flex-col items-end mr-2">
                        <span class="text-sm font-semibold text-[#001e40] dark:text-white"><asp:Literal ID="litUsuario" runat="server"></asp:Literal></span>
                        <span class="text-[10px] text-slate-500 font-medium uppercase tracking-wider">Administrador</span>
                    </div>
                    <a href="~/Formularios/Comunes/frmMiPerfil.aspx" runat="server" class="text-slate-500 hover:text-[#001e40] dark:hover:text-white transition-all font-medium text-sm flex items-center gap-1 mx-2" title="Mi Perfil">
                        <span class="material-symbols-outlined text-lg">person</span>
                    </a>
                    <asp:LinkButton ID="btnCerrarSesion" runat="server" CssClass="text-slate-500 hover:text-red-500 transition-all font-medium text-sm flex items-center gap-1" OnClick="btnCerrarSesion_Click" title="Cerrar Sesión">
                        <span class="material-symbols-outlined text-lg">logout</span>
                    </asp:LinkButton>
                </div>
            </div>
        </header>

        <main class="ml-72 mt-16 p-10 bg-surface-container-low min-h-screen">
            <div class="mb-8">
                <div class="flex items-center gap-2 text-sm text-on-surface-variant mb-2">
                    <span>Ajustes</span>
                    <span class="material-symbols-outlined text-sm">chevron_right</span>
                    <span class="text-primary font-medium">Configuración Maestro</span>
                </div>
                <h2 class="text-3xl font-semibold font-headline text-on-surface tracking-tight">Catálogos del Sistema</h2>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">
                <div class="lg:col-span-8 flex flex-col gap-6">
                    <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 bg-surface-container-lowest p-4 rounded-xl">
                        <div class="relative w-full sm:w-72">
                            <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-outline">search</span>
                            <asp:TextBox ID="txtBusqueda" runat="server" CssClass="w-full pl-10 pr-4 py-2 bg-surface-container rounded-lg border-0 text-sm" placeholder="Buscar..." AutoPostBack="true" OnTextChanged="txtBusqueda_TextChanged"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnNuevo" runat="server" Text="+ Nuevo Registro" OnClick="btnNuevo_Click" CssClass="bg-primary text-on-primary px-4 py-2 rounded-lg text-sm font-medium cursor-pointer" />
                    </div>

                    <div class="bg-surface-container-lowest rounded-xl overflow-hidden flex flex-col relative border border-outline-variant/15">
                        <div class="overflow-x-auto">
                            <table class="w-full text-left border-collapse">
                                <thead>
                                    <tr class="border-b border-outline-variant/15 text-xs uppercase text-outline">
                                        <th class="px-6 py-4">Código</th>
                                        <th class="px-6 py-4">Dominio</th>
                                        <th class="px-6 py-4">Descripción</th>
                                        <th class="px-6 py-4">Valor</th>
                                        <th class="px-6 py-4">Estado</th>
                                        <th class="px-6 py-4 text-right">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody class="text-sm font-body">
                                    <asp:Repeater ID="rptCatalogos" runat="server" OnItemCommand="rptCatalogos_ItemCommand">
                                        <ItemTemplate>
                                            <tr class="hover:bg-surface-container-high border-b border-outline-variant/5">
                                                <td class="px-6 py-4 font-medium"><%# Eval("Cod_Maestro") %></td>
                                                <td class="px-6 py-4 text-on-surface-variant"><%# Eval("Dominio") %></td>
                                                <td class="px-6 py-4"><%# Eval("Descripcion") %></td>
                                                <td class="px-6 py-4"><%# Eval("Valor_Fisico") %></td>
                                                <td class="px-6 py-4">
                                                    <span class='<%# Convert.ToBoolean(Eval("Ind_Activo")) ? "inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-secondary-fixed text-on-secondary-fixed-variant" : "inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-surface-container-highest text-on-surface-variant" %>'>
                                                        <%# Convert.ToBoolean(Eval("Ind_Activo")) ? "Activo" : "Inactivo" %>
                                                    </span>
                                                </td>
                                                <td class="px-6 py-4 text-right">
                                                    <asp:LinkButton ID="btnEditar" runat="server" CommandName="Editar" CommandArgument='<%# Eval("Cod_Maestro") %>' CssClass="text-on-surface-variant hover:text-primary">
                                                        <span class="material-symbols-outlined text-[20px]">edit</span>
                                                    </asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="lg:col-span-4">
                    <div class="bg-surface-container-lowest rounded-xl border border-outline-variant/15 sticky top-24">
                        <div class="p-6 border-b border-outline-variant/15">
                            <h3 class="font-headline font-semibold text-lg">Detalle de Registro</h3>
                            <asp:Literal ID="litModo" runat="server" Text="<p class='text-xs text-on-surface-variant'>Seleccione un registro para editar</p>"></asp:Literal>
                        </div>
                        <div class="p-6 space-y-5">
                            <div>
                                <label class="block text-xs font-semibold text-on-surface-variant uppercase mb-1">Dominio</label>
                                <asp:TextBox ID="txtDominio" runat="server" CssClass="w-full bg-surface-container-low border border-outline-variant/30 rounded-lg px-3 py-2 text-sm"></asp:TextBox>
                            </div>
                            <div>
                                <label class="block text-xs font-semibold text-on-surface-variant uppercase mb-1">Código Interno</label>
                                <asp:TextBox ID="txtCodigoInterno" runat="server" CssClass="w-full bg-surface-container-low border border-outline-variant/30 rounded-lg px-3 py-2 text-sm"></asp:TextBox>
                            </div>
                            <div>
                                <label class="block text-xs font-semibold text-on-surface-variant uppercase mb-1">Descripción</label>
                                <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Rows="2" CssClass="w-full border border-outline-variant/40 rounded-lg px-3 py-2 text-sm"></asp:TextBox>
                            </div>
                            <div>
                                <label class="block text-xs font-semibold text-on-surface-variant uppercase mb-1">Valor Físico / Alias</label>
                                <asp:TextBox ID="txtValor" runat="server" CssClass="w-full border border-outline-variant/40 rounded-lg px-3 py-2 text-sm"></asp:TextBox>
                            </div>
                            <div class="flex items-center justify-between">
                                <label class="text-sm font-medium">Estado del Registro</label>
                                <asp:CheckBox ID="chkActivo" runat="server" />
                            </div>
                        </div>
                        <div class="p-6 border-t border-outline-variant/15 flex justify-end gap-3">
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cambios" OnClick="btnGuardar_Click" CssClass="bg-primary text-on-primary px-4 py-2 rounded-lg text-sm font-medium cursor-pointer" />
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </form>
</body>
</html>