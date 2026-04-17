<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmDashboardFirmante.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Firma.frmDashboardFirmante" %>
<!DOCTYPE html>

<html lang="es">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>SDF ZOFRATACNA - Dashboard Firmante</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@400;600;700&amp;family=Inter:wght@400;500;600&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
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
                    "borderRadius": {
                        "DEFAULT": "0.125rem",
                        "lg": "0.25rem",
                        "xl": "0.5rem",
                        "full": "0.75rem"
                    },
                    "fontFamily": {
                        "headline": ["Public Sans"],
                        "body": ["Inter"],
                        "label": ["Inter"]
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-background text-on-background font-body min-h-screen flex">
    <form id="form1" runat="server" class="flex w-full min-h-screen">
        <!-- SideNavBar -->
        <nav class="bg-slate-100 dark:bg-slate-900 text-[#003366] dark:text-blue-400 font-public-sans font-semibold tracking-tight fixed left-0 top-0 h-screen w-72 border-r border-transparent flex flex-col p-4 z-40">
            <div class="mb-8 px-4 py-2">
                <div class="flex items-center gap-3">
                    <div class="w-10 h-10 bg-primary rounded-lg flex items-center justify-center text-on-primary">
                        <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">account_balance</span>
                    </div>
                    <div>
                        <h1 class="text-xl font-bold text-[#001e40] dark:text-white leading-none">SDF ZOFRATACNA</h1>
                        <p class="text-xs font-normal text-slate-500 mt-1 block">Arquitectura de Confianza</p>
                    </div>
                </div>
            </div>
            <ul class="flex-1 space-y-2">
                <li>
                    <a runat="server" class="text-[#001e40] dark:text-white font-bold bg-white dark:bg-slate-800 rounded-lg shadow-sm scale-95 active:scale-90 transition-transform flex items-center gap-3 px-4 py-3" href="~/Formularios/Firma/frmDashboardFirmante.aspx">
                        <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">dashboard</span>
                        Dashboard
                    </a>
                </li>
                <li>
                    <a runat="server" class="text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 flex items-center gap-3 px-4 py-3 rounded-lg" href="~/Formularios/Firma/frmMisDocumentosFirmante.aspx">
                        <span class="material-symbols-outlined">description</span>
                        Mis Documentos
                    </a>
                </li>
                <li>
                    <a class="text-slate-300 dark:text-slate-600 cursor-not-allowed opacity-50 flex items-center gap-3 px-4 py-3 rounded-lg">
                        <span class="material-symbols-outlined">add_box</span>
                        Registrar Nuevo
                    </a>
                </li>
                <li>
                    <a runat="server" class="text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 flex items-center gap-3 px-4 py-3 rounded-lg" href="~/Formularios/Firma/frmArchivoFirmante.aspx">
                        <span class="material-symbols-outlined">archive</span>
                        Archivo
                    </a>
                </li>
                <li>
                    <a runat="server" class="text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 flex items-center gap-3 px-4 py-3 rounded-lg" href="~/Formularios/Comunes/frmMiPerfil.aspx">
                        <span class="material-symbols-outlined">settings</span>
                        Ajustes
                    </a>
                </li>
                <li>
                    <a runat="server" class="text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 flex items-center gap-3 px-4 py-3 rounded-lg" href="~/Formularios/Comunes/frmSoporte.aspx">
                        <span class="material-symbols-outlined">contact_support</span>
                        Soporte
                    </a>
                </li>
            </ul>
        </nav>

        <!-- TopNavBar -->
        <header class="bg-white/85 dark:bg-slate-950/85 backdrop-blur-md text-[#001e40] dark:text-white font-inter text-sm fixed top-0 right-0 w-[calc(100%-18rem)] h-16 z-50 border-b border-slate-200/50 dark:border-slate-800/50 shadow-sm dark:shadow-none flex items-center justify-between px-8">
            <div class="flex-1">
                <!-- Breadcrumb opcional -->
            </div>
            <div class="flex items-center gap-4 opacity-90 hover:opacity-100">
                <button type="button" class="text-slate-600 dark:text-slate-400 hover:text-[#003366] dark:hover:text-blue-300 transition-all p-2 rounded-full">
                    <span class="material-symbols-outlined">notifications</span>
                </button>
                <button type="button" class="text-slate-600 dark:text-slate-400 hover:text-[#003366] dark:hover:text-blue-300 transition-all p-2 rounded-full">
                    <span class="material-symbols-outlined">help_outline</span>
                </button>
                <div class="h-8 w-px bg-outline-variant/30 mx-2"></div>
                <div class="flex items-center gap-3">
                    <asp:Image ID="imgPerfil" runat="server" CssClass="w-8 h-8 rounded-full" ImageUrl="https://lh3.googleusercontent.com/aida-public/AB6AXuAaxALfWT64Q_EHMgU1gm4qrjhR2bMGY9EEiOoamGujsUW5zjIL6nJGFBSVrxDfe9uA_7p4E1Nc8YNp7YYTgpUIvak8wYhpGk552aHpsLLomd1Sy1V-arhskcYTzqtL-BEdQHuphHjInncxzDPKdOhwqxMQI4O6EZKiRLbF0Ks2g14K5RDROgPFoveA2OsLr2CB83MKdqStLuGxmXB2Vhm2AxIeqQ6pAuhk2lARIms00EWfW268rjtrSReL87OgTG3MjRqWE8R7q96X" />
                    <asp:Label ID="lblNombreUsuario" runat="server" CssClass="font-semibold text-[#003366]" Text="Firmante"></asp:Label>
                    <asp:LinkButton ID="btnLogout" runat="server" CssClass="text-slate-600 dark:text-slate-400 hover:text-error transition-all flex items-center gap-2" OnClick="btnLogout_Click">
                        <span class="material-symbols-outlined">logout</span>
                        <span>Cerrar Sesión</span>
                    </asp:LinkButton>
                </div>
            </div>
        </header>

        <!-- Main Content Canvas -->
        <main class="flex-1 md:ml-72 pt-20 px-4 md:px-10 pb-10 w-full max-w-[1200px] mx-auto">
            <!-- Header Section -->
            <div class="mb-10">
                <h2 class="font-headline text-3xl font-semibold text-primary tracking-tight">Dashboard del Firmante</h2>
                <p class="font-body text-on-surface-variant mt-2 text-lg">Resumen de documentos pendientes y acciones prioritarias.</p>
            </div>

            <!-- Metric Cards -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-10">
                <div class="bg-error-container rounded-xl p-6 flex flex-col justify-between border border-error/10 relative overflow-hidden">
                    <div class="absolute -right-4 -top-4 opacity-10">
                        <span class="material-symbols-outlined text-9xl text-error">warning</span>
                    </div>
                    <div>
                        <div class="flex items-center gap-2 text-on-error-container mb-2">
                            <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">assignment_late</span>
                            <span class="font-label font-semibold tracking-wide uppercase text-sm">Firma Urgente</span>
                        </div>
                        <asp:Label ID="lblFirmaUrgente" runat="server" CssClass="font-headline text-4xl font-semibold text-on-error-container" Text="12"></asp:Label>
                    </div>
                    <div class="mt-4">
                        <p class="font-body text-sm text-on-error-container/80">Documentos que vencen hoy.</p>
                    </div>
                </div>

                <div class="bg-tertiary-fixed rounded-xl p-6 flex flex-col justify-between border border-tertiary/10 relative overflow-hidden">
                    <div class="absolute -right-4 -top-4 opacity-10">
                        <span class="material-symbols-outlined text-9xl text-tertiary">pending_actions</span>
                    </div>
                    <div>
                        <div class="flex items-center gap-2 text-on-tertiary-fixed-variant mb-2">
                            <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">pending</span>
                            <span class="font-label font-semibold tracking-wide uppercase text-sm">Pendiente de Revisión</span>
                        </div>
                        <asp:Label ID="lblPendientes" runat="server" CssClass="font-headline text-4xl font-semibold text-on-tertiary-fixed-variant" Text="34"></asp:Label>
                    </div>
                    <div class="mt-4">
                        <p class="font-body text-sm text-on-tertiary-fixed-variant/80">Esperando su aprobación inicial.</p>
                    </div>
                </div>

                <div class="bg-surface-container-lowest rounded-xl p-6 flex flex-col justify-between shadow-[0_20px_40px_rgba(25,28,30,0.02)]">
                    <div>
                        <div class="flex items-center gap-2 text-primary mb-2">
                            <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">task_alt</span>
                            <span class="font-label font-semibold tracking-wide uppercase text-sm text-outline">Firmados (Últ. 7 Días)</span>
                        </div>
                        <asp:Label ID="lblFirmadosSemana" runat="server" CssClass="font-headline text-4xl font-semibold text-primary" Text="156"></asp:Label>
                    </div>
                    <div class="mt-4">
                        <p class="font-body text-sm text-on-surface-variant">Manteniendo un flujo constante.</p>
                    </div>
                </div>
            </div>

            <!-- Priority Action List Section -->
            <div class="bg-surface-container-low rounded-xl p-1 mb-10">
                <div class="bg-surface-container-lowest rounded-lg p-6">
                    <div class="flex items-center justify-between mb-6">
                        <h3 class="font-headline text-xl font-semibold text-primary">Acciones Requeridas Prioritarias</h3>
                        <asp:LinkButton ID="btnVerTodos" runat="server" CssClass="text-primary font-label text-sm hover:underline flex items-center gap-1" OnClick="btnVerTodos_Click">
                            Ver todos <span class="material-symbols-outlined text-sm">arrow_forward</span>
                        </asp:LinkButton>
                    </div>
                    <div class="space-y-2">
                        <!-- Item 1 -->
                        <div class="flex items-center justify-between p-4 rounded-lg hover:bg-surface-container-high transition-colors duration-200">
                            <div class="flex items-start gap-4">
                                <div class="mt-1">
                                    <span class="inline-flex items-center justify-center w-8 h-8 rounded-full bg-error-container text-on-error-container">
                                        <span class="material-symbols-outlined text-sm">priority_high</span>
                                    </span>
                                </div>
                                <div>
                                    <h4 class="font-body font-semibold text-on-surface">Contrato de Arrendamiento Lote 45-B</h4>
                                    <p class="font-body text-sm text-on-surface-variant">Remitente: Gerencia Comercial • Vence en 2 horas</p>
                                </div>
                            </div>
                            <div>
                                <asp:LinkButton ID="btnFirmar1" runat="server" CssClass="bg-primary text-on-primary font-label text-sm px-4 py-2 rounded shadow-sm hover:bg-primary-container transition-all duration-200 ease-out flex items-center gap-2" OnClick="btnFirmar_Click" CommandArgument="1">
                                    <span class="material-symbols-outlined text-sm">draw</span> Firmar
                                </asp:LinkButton>
                            </div>
                        </div>

                        <!-- Item 2 -->
                        <div class="flex items-center justify-between p-4 rounded-lg hover:bg-surface-container-high transition-colors duration-200">
                            <div class="flex items-start gap-4">
                                <div class="mt-1">
                                    <span class="inline-flex items-center justify-center w-8 h-8 rounded-full bg-tertiary-fixed text-on-tertiary-fixed-variant">
                                        <span class="material-symbols-outlined text-sm">schedule</span>
                                    </span>
                                </div>
                                <div>
                                    <h4 class="font-body font-semibold text-on-surface">Resolución de Gerencia General N° 102-2023</h4>
                                    <p class="font-body text-sm text-on-surface-variant">Remitente: Asesoría Legal • Vence hoy</p>
                                </div>
                            </div>
                            <div>
                                <asp:LinkButton ID="btnFirmar2" runat="server" CssClass="bg-primary text-on-primary font-label text-sm px-4 py-2 rounded shadow-sm hover:bg-primary-container transition-all duration-200 ease-out flex items-center gap-2" OnClick="btnFirmar_Click" CommandArgument="2">
                                    <span class="material-symbols-outlined text-sm">draw</span> Firmar
                                </asp:LinkButton>
                            </div>
                        </div>

                        <!-- Item 3 -->
                        <div class="flex items-center justify-between p-4 rounded-lg hover:bg-surface-container-high transition-colors duration-200">
                            <div class="flex items-start gap-4">
                                <div class="mt-1">
                                    <span class="inline-flex items-center justify-center w-8 h-8 rounded-full bg-secondary-fixed text-on-secondary-fixed-variant">
                                        <span class="material-symbols-outlined text-sm">info</span>
                                    </span>
                                </div>
                                <div>
                                    <h4 class="font-body font-semibold text-on-surface">Memorándum Múltiple N° 045-2023-GG</h4>
                                    <p class="font-body text-sm text-on-surface-variant">Remitente: Recursos Humanos • Para conocimiento</p>
                                </div>
                            </div>
                            <div>
                                <asp:LinkButton ID="btnRevisar3" runat="server" CssClass="bg-secondary-container text-on-secondary-container font-label text-sm px-4 py-2 rounded hover:bg-surface-variant transition-all duration-200 ease-out flex items-center gap-2" OnClick="btnRevisar_Click" CommandArgument="3">
                                    <span class="material-symbols-outlined text-sm">visibility</span> Revisar
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </form>
</body>
</html>