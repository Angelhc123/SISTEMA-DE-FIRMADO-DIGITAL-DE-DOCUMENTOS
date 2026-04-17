<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmDashboardAdmin.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Administracion.frmDashboardAdmin" %>

<!DOCTYPE html>
<html class="light" lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>SDF ZOFRATACNA - Dashboard Admin</title>

    <link href="https://fonts.googleapis.com" rel="preconnect" />
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Public+Sans:wght@400;600;700&display=swap" rel="stylesheet" />

    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet" />

    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "inverse-surface": "#2d3133", "tertiary": "#381300", "secondary-container": "#cbe7f5",
                        "surface-container": "#eceef0", "primary": "#001e40", "surface-container-high": "#e6e8ea",
                        "primary-fixed-dim": "#a7c8ff", "surface-container-lowest": "#ffffff", "on-primary-container": "#799dd6",
                        "on-primary-fixed-variant": "#1f477b", "surface-container-low": "#f2f4f6", "on-tertiary-container": "#d8885c",
                        "surface-variant": "#e0e3e5", "primary-container": "#003366", "on-surface": "#191c1e",
                        "on-secondary-fixed": "#021f29", "on-secondary": "#ffffff", "surface-bright": "#f8f9fb",
                        "error-container": "#ffdad6", "on-primary-fixed": "#001b3c", "tertiary-container": "#592300",
                        "tertiary-fixed": "#ffdbca", "outline-variant": "#c3c6d1", "surface": "#f8f9fb",
                        "inverse-primary": "#a7c8ff", "on-surface-variant": "#43474f", "surface-tint": "#3a5f94",
                        "on-tertiary": "#ffffff", "on-tertiary-fixed": "#341100", "inverse-on-surface": "#eff1f3",
                        "primary-fixed": "#d5e3ff", "secondary-fixed-dim": "#afcbd8", "on-background": "#191c1e",
                        "secondary": "#48626e", "error": "#ba1a1a", "on-primary": "#ffffff", "on-secondary-container": "#4e6874",
                        "background": "#f8f9fb", "on-secondary-fixed-variant": "#304a55", "on-tertiary-fixed-variant": "#723610",
                        "surface-dim": "#d8dadc", "on-error-container": "#93000a", "secondary-fixed": "#cbe7f5",
                        "on-error": "#ffffff", "tertiary-fixed-dim": "#ffb690", "outline": "#737780"
                    },
                    "borderRadius": {
                        "DEFAULT": "0.125rem", "lg": "0.25rem", "xl": "0.5rem", "full": "0.75rem"
                    },
                    "fontFamily": {
                        "headline": ["Public Sans", "sans-serif"],
                        "body": ["Inter", "sans-serif"],
                        "label": ["Inter", "sans-serif"]
                    }
                }
            }
        }
    </script>
    <style>
        .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 300, 'GRAD' 0, 'opsz' 24; }
        .ds-shadow { box-shadow: 0 20px 40px rgba(25, 28, 30, 0.06); }
        body { line-height: 1.5; }
    </style>
</head>
<body class="bg-background text-on-surface font-body antialiased">
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
                    <!-- Active Tab -->
                    <a class="flex items-center gap-3 px-4 py-3 text-[#001e40] dark:text-white font-bold bg-white dark:bg-slate-800 rounded-lg shadow-sm font-public-sans tracking-tight scale-95 transition-transform" href="~/Formularios/Administracion/frmDashboardAdmin.aspx" runat="server">
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
                    <a class="flex items-center gap-3 px-4 py-3 text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 font-public-sans font-semibold tracking-tight rounded-lg" href="~/Formularios/Administracion/frmConfiguracionAdmin.aspx" runat="server">
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
                <div class="relative w-96">
                    <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-outline">search</span>
                    <asp:TextBox ID="txtBusqueda" runat="server" CssClass="w-full bg-surface-container-low border border-outline-variant/15 rounded-full py-2 pl-10 pr-4 text-on-surface focus:outline-none focus:ring-2 focus:ring-primary/10 transition-shadow" placeholder="Buscar expedientes, firmas..."></asp:TextBox>
                </div>
            </div>
            <div class="flex items-center gap-6">
                <div class="flex items-center gap-2 text-slate-600">
                    <button type="button" class="p-2 rounded-full hover:text-[#003366] hover:bg-surface-container transition-all opacity-90 hover:opacity-100">
                        <span class="material-symbols-outlined">notifications</span>
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
                    <asp:LinkButton ID="btnLogout" runat="server" CssClass="text-slate-500 hover:text-red-500 transition-all font-medium text-sm flex items-center gap-1" OnClick="btnLogout_Click" title="Cerrar Sesión">
                        <span class="material-symbols-outlined text-lg">logout</span>
                    </asp:LinkButton>
                </div>
            </div>
        </header>

        <main class="ml-72 mt-16 p-10 bg-surface-container-low min-h-screen">
            <div class="max-w-[1200px] mx-auto space-y-8">
                <div class="flex items-end justify-between">
                    <div>
                        <h2 class="text-3xl font-headline font-semibold text-primary mb-1">Métricas del Sistema</h2>
                        <p class="text-on-surface-variant text-sm">Resumen operativo y estado de la plataforma SDF.</p>
                    </div>
                    <div class="text-sm text-on-surface-variant">
                        Última actualización: <asp:Label ID="lblFecha" runat="server"></asp:Label>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                    <div class="bg-surface-container-lowest rounded-xl p-6 ds-shadow relative overflow-hidden group">
                        <div class="absolute top-0 right-0 p-6 opacity-10 group-hover:scale-110 transition-transform duration-500">
                            <span class="material-symbols-outlined text-6xl text-primary" style="font-variation-settings: 'FILL' 1;">description</span>
                        </div>
                        <p class="text-sm text-on-surface-variant font-medium mb-1">Documentos Totales</p>
                        <p class="text-4xl font-headline font-semibold text-primary"><asp:Label ID="lblTotalDocs" runat="server" Text="12,458"></asp:Label></p>
                        <div class="mt-4 flex items-center gap-1 text-xs text-primary-container">
                            <span class="material-symbols-outlined text-[16px]">trending_up</span>
                            <span>+12% vs mes anterior</span>
                        </div>
                    </div>
                    <div class="bg-surface-container-lowest rounded-xl p-6 ds-shadow relative overflow-hidden group">
                        <div class="absolute top-0 right-0 p-6 opacity-10 group-hover:scale-110 transition-transform duration-500">
                            <span class="material-symbols-outlined text-6xl text-tertiary" style="font-variation-settings: 'FILL' 1;">pending_actions</span>
                        </div>
                        <p class="text-sm text-on-surface-variant font-medium mb-1">Firmas Pendientes</p>
                        <p class="text-4xl font-headline font-semibold text-tertiary"><asp:Label ID="lblPendientes" runat="server" Text="342"></asp:Label></p>
                        <div class="mt-4 flex items-center gap-1 text-xs text-tertiary-container">
                            <span class="material-symbols-outlined text-[16px]">info</span>
                            <span>Requieren atención inmediata</span>
                        </div>
                    </div>
                    <div class="bg-surface-container-lowest rounded-xl p-6 ds-shadow relative overflow-hidden group">
                        <div class="absolute top-0 right-0 p-6 opacity-10 group-hover:scale-110 transition-transform duration-500">
                            <span class="material-symbols-outlined text-6xl text-primary-container" style="font-variation-settings: 'FILL' 1;">speed</span>
                        </div>
                        <p class="text-sm text-on-surface-variant font-medium mb-1">Carga del Sistema</p>
                        <p class="text-4xl font-headline font-semibold text-primary">28%</p>
                        <div class="mt-4 flex items-center gap-1 text-xs text-on-surface-variant">
                            <span class="material-symbols-outlined text-[16px]">check_circle</span>
                            <span>Operación normal</span>
                        </div>
                    </div>
                    <div class="bg-surface-container-lowest rounded-xl p-6 ds-shadow relative overflow-hidden group">
                        <div class="absolute top-0 right-0 p-6 opacity-10 group-hover:scale-110 transition-transform duration-500">
                            <span class="material-symbols-outlined text-6xl text-secondary" style="font-variation-settings: 'FILL' 1;">group</span>
                        </div>
                        <p class="text-sm text-on-surface-variant font-medium mb-1">Usuarios Activos</p>
                        <p class="text-4xl font-headline font-semibold text-primary">89</p>
                        <div class="mt-4 flex items-center gap-1 text-xs text-secondary">
                            <span class="material-symbols-outlined text-[16px]">group_add</span>
                            <span>12 conectados ahora</span>
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
                    <div class="lg:col-span-2 bg-surface-container-lowest rounded-xl p-6 ds-shadow flex flex-col">
                        <div class="flex items-center justify-between mb-6">
                            <h3 class="font-headline font-semibold text-primary text-lg">Volumen de Procesamiento</h3>
                            <a href="#" class="text-sm text-primary-container font-medium hover:text-primary transition-colors flex items-center gap-1">
                                Ver reporte completo <span class="material-symbols-outlined text-[18px]">chevron_right</span>
                            </a>
                        </div>
                        <div class="flex-1 bg-surface rounded-lg border border-outline-variant/15 relative overflow-hidden min-h-[300px] flex items-center justify-center">
                            <div class="absolute inset-0 bg-gradient-to-tr from-surface-container-low to-surface opacity-50"></div>
                            <div class="absolute bottom-0 left-0 w-full h-full flex items-end px-4 gap-2 opacity-20">
                                <div class="w-full bg-primary-container rounded-t-sm h-[40%]"></div>
                                <div class="w-full bg-primary-container rounded-t-sm h-[60%]"></div>
                                <div class="w-full bg-primary-container rounded-t-sm h-[30%]"></div>
                                <div class="w-full bg-primary-container rounded-t-sm h-[80%]"></div>
                                <div class="w-full bg-primary-container rounded-t-sm h-[50%]"></div>
                                <div class="w-full bg-primary-container rounded-t-sm h-[90%]"></div>
                                <div class="w-full bg-primary-container rounded-t-sm h-[70%]"></div>
                            </div>
                            <div class="relative z-10 flex flex-col items-center text-on-surface-variant">
                                <span class="material-symbols-outlined text-4xl mb-2 opacity-50">bar_chart</span>
                                <span class="text-sm font-medium">Gráfico interactivo de flujo documental</span>
                            </div>
                        </div>
                    </div>

                    <div class="bg-surface-container-lowest rounded-xl p-6 ds-shadow flex flex-col">
                        <div class="flex items-center justify-between mb-6">
                            <h3 class="font-headline font-semibold text-primary text-lg">Cuellos de Botella</h3>
                            <span class="material-symbols-outlined text-tertiary">warning</span>
                        </div>
                        <div class="space-y-2 flex-1">
                            <div class="p-3 rounded-lg hover:bg-surface-container-high transition-colors flex items-start gap-3 cursor-pointer group">
                                <div class="w-8 h-8 rounded-full bg-error-container text-on-error-container flex items-center justify-center shrink-0 mt-1">
                                    <span class="material-symbols-outlined text-[18px]">error</span>
                                </div>
                                <div>
                                    <p class="text-sm font-medium text-primary group-hover:text-primary-container transition-colors">EXP-2023-0892</p>
                                    <p class="text-xs text-on-surface-variant line-clamp-1">Observado por falta de anexos legales.</p>
                                    <div class="mt-2 inline-flex px-2 py-0.5 rounded-full bg-error-container text-on-error-container text-[10px] font-bold uppercase tracking-wide">Observado - 48h</div>
                                </div>
                            </div>
                            <div class="p-3 rounded-lg hover:bg-surface-container-high transition-colors flex items-start gap-3 cursor-pointer group">
                                <div class="w-8 h-8 rounded-full bg-tertiary-fixed text-on-tertiary-fixed-variant flex items-center justify-center shrink-0 mt-1">
                                    <span class="material-symbols-outlined text-[18px]">schedule</span>
                                </div>
                                <div>
                                    <p class="text-sm font-medium text-primary group-hover:text-primary-container transition-colors">CON-2023-1104</p>
                                    <p class="text-xs text-on-surface-variant line-clamp-1">Esperando firma de Gerencia General.</p>
                                    <div class="mt-2 inline-flex px-2 py-0.5 rounded-full bg-tertiary-fixed text-on-tertiary-fixed-variant text-[10px] font-bold uppercase tracking-wide">Pendiente - 24h</div>
                                </div>
                            </div>
                        </div>
                        <button type="button" class="mt-4 w-full py-2 text-sm font-medium text-primary border border-outline-variant/30 rounded-lg hover:bg-surface-container transition-colors">
                            Ver todos los retrasos
                        </button>
                    </div>
                </div>
            </div>
        </main>
    </form>
</body>
</html>