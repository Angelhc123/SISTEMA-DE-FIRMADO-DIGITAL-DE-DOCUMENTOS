<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmMisDocumentosFirmante.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Firma.frmMisDocumentosFirmante" %>
<!DOCTYPE html>

<html lang="es">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>SDF ZOFRATACNA - Mis Documentos (Firmante)</title>
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
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f8f9fb; }
        h1, h2, h3, h4, h5, h6 { font-family: 'Public Sans', sans-serif; }
    </style>
</head>
<body class="bg-background text-on-background antialiased flex h-screen overflow-hidden">
    <form id="form1" runat="server" class="flex w-full h-screen overflow-hidden">
        <!-- SideNavBar Unificada -->
<nav class="bg-white dark:bg-slate-900 fixed left-0 top-0 h-screen w-72 border-r border-outline-variant/20 z-40 shadow-[4px_0_20px_rgba(0,30,64,0.03)]">
    <div class="flex flex-col h-full">
        <div class="mb-8 px-6 pt-6">
            <div class="flex items-center space-x-3">
                <div class="w-10 h-10 bg-primary rounded-xl flex items-center justify-center text-white shadow-md">
                    <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">account_balance</span>
                </div>
                <div>
                    <h1 class="text-xl font-bold text-primary font-headline">SDF ZOFRATACNA</h1>
                    <p class="text-xs text-on-surface-variant font-body">Plataforma de Confianza Digital</p>
                </div>
            </div>
        </div>
        
        <div class="flex-1 px-3 space-y-1">
            <p class="px-3 text-[10px] font-bold text-outline uppercase tracking-wider mt-2 mb-2">Principal</p>
            
            <!-- Dashboard (Activo) -->
            <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-primary bg-primary-fixed/30 font-semibold" href="~/Formularios/Firma/frmDashboardFirmante.aspx">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">dashboard</span>
                <span>Dashboard</span>
            </a>
            
            <!-- Mis Documentos (Firmar) -->
            <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-low transition-all duration-200" href="~/Formularios/Firma/frmMisDocumentosFirmante.aspx">
                <span class="material-symbols-outlined">draw</span>
                <span>Por Firmar</span>
                <span class="ml-auto bg-error-container text-error text-xs font-bold px-2 py-0.5 rounded-full">4</span>
            </a>
            
            <!-- Mis Documentos (Revisar) -->
            <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-low transition-all duration-200" href="~/Formularios/Firma/frmMisDocumentosRevisor.aspx">
                <span class="material-symbols-outlined">rate_review</span>
                <span>Por Revisar</span>
                <span class="ml-auto bg-tertiary-fixed text-tertiary text-xs font-bold px-2 py-0.5 rounded-full">12</span>
            </a>
            
            <div class="h-px bg-outline-variant/30 my-4 mx-2"></div>
            <p class="px-3 text-[10px] font-bold text-outline uppercase tracking-wider mt-2 mb-2">Archivos</p>
            
            <!-- Archivo Firmante -->
            <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-low transition-all duration-200" href="~/Formularios/Firma/frmArchivoFirmante.aspx">
                <span class="material-symbols-outlined">checklist</span>
                <span>Documentos Firmados</span>
            </a>
            
            <!-- Archivo Revisor -->
            <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-low transition-all duration-200" href="~/Formularios/Firma/frmArchivoRevisor.aspx">
                <span class="material-symbols-outlined">history</span>
                <span>Historial de Revisiones</span>
            </a>
            
            <div class="h-px bg-outline-variant/30 my-4 mx-2"></div>
            <p class="px-3 text-[10px] font-bold text-outline uppercase tracking-wider mt-2 mb-2">Sistema</p>
            
            <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-low transition-all duration-200" href="~/Formularios/Comunes/frmMiPerfil.aspx">
                <span class="material-symbols-outlined">settings</span>
                <span>Ajustes</span>
            </a>
            <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-low transition-all duration-200" href="~/Formularios/Comunes/frmSoporte.aspx">
                <span class="material-symbols-outlined">contact_support</span>
                <span>Soporte</span>
            </a>
        </div>
        
        <div class="mt-auto p-4 border-t border-outline-variant/20">
            <div class="flex items-center gap-3">
                <asp:Image ID="Image1" runat="server" CssClass="w-10 h-10 rounded-full object-cover border-2 border-white shadow-sm" ImageUrl="https://ui-avatars.com/api/?background=001e40&color=fff&name=Usuario" />
                <div class="flex-1">
                    <asp:Label ID="Label1" runat="server" CssClass="text-sm font-semibold text-primary block" Text="Usuario"></asp:Label>
                    <asp:Label ID="lblRolUsuario" runat="server" CssClass="text-xs text-on-surface-variant" Text="Firmante / Revisor"></asp:Label>
                </div>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="text-outline hover:text-error transition-colors" OnClick="btnLogout_Click">
                    <span class="material-symbols-outlined">logout</span>
                </asp:LinkButton>
            </div>
        </div>
    </div>
</nav>

        <!-- Main Content -->
        <div class="flex-1 flex flex-col md:ml-72 relative w-full h-screen overflow-hidden">
            <!-- TopNavBar -->
            <header class="bg-surface-bright/85 backdrop-blur-md fixed top-0 right-0 w-full md:w-[calc(100%-18rem)] h-16 z-50 shadow-sm border-b border-surface-container-highest">
                <div class="flex items-center justify-between px-8 h-full">
                    <div class="flex-1 max-w-md relative hidden md:block">
                        <span class="material-symbols-outlined absolute left-3 top-1/2 transform -translate-y-1/2 text-outline">search</span>
                        <asp:TextBox ID="txtBuscar" runat="server" CssClass="w-full bg-surface-container-low border border-outline-variant/15 rounded-full py-2 pl-10 pr-4 text-sm font-body text-on-surface focus:outline-none focus:ring-2 focus:ring-primary/10 transition-shadow" placeholder="Buscar documentos..."></asp:TextBox>
                    </div>
                    <button class="md:hidden p-2 text-primary" type="button">
                        <span class="material-symbols-outlined">menu</span>
                    </button>
                    <div class="flex items-center space-x-4">
                        <button type="button" class="text-slate-600 hover:text-[#003366] transition-all">
                            <span class="material-symbols-outlined">notifications</span>
                        </button>
                        <button type="button" class="text-slate-600 hover:text-[#003366] transition-all">
                            <span class="material-symbols-outlined">help_outline</span>
                        </button>
                        <div class="h-6 w-px bg-outline-variant/30 mx-2"></div>
                        <div class="flex items-center space-x-3 text-sm font-inter">
                            <asp:Image ID="imgPerfil" runat="server" CssClass="w-8 h-8 rounded-full border border-surface-container-highest" ImageUrl="https://lh3.googleusercontent.com/aida-public/AB6AXuCcK9V6QQUc6IYRIU-4v3vDsYO_mg1vTQiLlaHANIyrI_pxzyFF1khc6nltPet2t6Q2PmuhpbISHgpQ3mmvA2DOJ87edJ7YDn0Rui42MzGtQu4lxHPNhGvE9iQI3ZWE4pC6y_NBz3eamnqXP2CM_sNRt_nmlq5auCIyTJPkH_gsEQ47hynYaBhxJnCVto8ScoaI01JnMrwWHHhqxlfItGPJiaSdN_bToWxwrY8GUU0SvkPyy492S2Dmf8r1o1T19kKQQGnYgEY9k1lc" />
                            <asp:Label ID="lblNombreUsuario" runat="server" CssClass="hidden lg:block font-medium" Text="Carlos Mendoza"></asp:Label>
                            <asp:LinkButton ID="btnLogout" runat="server" CssClass="text-sm font-medium text-slate-500 hover:text-error transition-colors flex items-center gap-2" OnClick="btnLogout_Click">
                                <span class="material-symbols-outlined text-[18px]">logout</span>
                                <span>Cerrar Sesión</span>
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </header>

            <!-- Canvas -->
            <main class="flex-1 overflow-y-auto pt-24 px-4 sm:px-6 md:px-8 lg:px-10 pb-12 w-full max-w-[1200px] mx-auto">
                <div class="mb-8">
                    <h2 class="text-3xl font-headline font-semibold text-primary mb-2">Bandeja de Firma</h2>
                    <p class="text-on-surface-variant font-body text-base max-w-2xl leading-relaxed">
                        Documentos pendientes de su rúbrica digital.
                    </p>
                </div>

                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
                    <!-- Priority Action Card -->
                    <div class="lg:col-span-2 bg-surface-container-lowest rounded-xl shadow-[0_4px_20px_rgba(25,28,30,0.03)] border border-outline-variant/15 p-6 flex flex-col justify-between relative overflow-hidden group">
                        <div class="absolute -right-10 -top-10 w-40 h-40 bg-primary/5 rounded-full blur-2xl"></div>
                        <div class="relative z-10">
                            <div class="flex items-center justify-between mb-6">
                                <span class="bg-tertiary-fixed text-on-tertiary-fixed-variant text-xs font-semibold px-3 py-1 rounded-full font-label tracking-wide flex items-center gap-1">
                                    <span class="material-symbols-outlined text-[14px]">priority_high</span> Acción Requerida
                                </span>
                                <span class="text-sm font-body text-on-surface-variant flex items-center gap-1">
                                    <span class="material-symbols-outlined text-[16px]">schedule</span> Vence en 2 horas
                                </span>
                            </div>
                            <asp:Label ID="lblDocumentoPrioritario" runat="server" CssClass="text-xl font-headline font-semibold text-primary mb-2" Text="Resolución Directoral N° 145-2023-ZOFRATACNA"></asp:Label>
                            <asp:Label ID="lblDescripcionPrioritario" runat="server" CssClass="font-body text-on-surface-variant text-sm mb-6 leading-relaxed block" Text="Aprobación de la modificación del Plan Operativo Institucional (POI)"></asp:Label>
                            <div class="flex flex-col sm:flex-row sm:items-center gap-6 mb-8">
                                <div class="flex items-center gap-3">
                                    <div class="w-10 h-10 rounded-full bg-surface-container flex items-center justify-center text-primary">
                                        <span class="material-symbols-outlined">person</span>
                                    </div>
                                    <div>
                                        <p class="text-xs font-label text-on-surface-variant">Remitente</p>
                                        <p class="text-sm font-body font-medium text-on-surface">Gerencia General</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="flex flex-col sm:flex-row gap-3 relative z-10 mt-auto">
                            <asp:LinkButton ID="btnFirmarPrioritario" runat="server" CssClass="flex-1 bg-gradient-to-r from-primary to-primary-container text-on-primary font-body font-medium py-3 px-6 rounded-lg hover:shadow-[0_8px_16px_rgba(0,30,64,0.15)] transition-all duration-200 flex items-center justify-center gap-2" OnClick="btnFirmarPrioritario_Click">
                                <span class="material-symbols-outlined text-[20px]">draw</span> Firmar Documento
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnRevisarPrioritario" runat="server" CssClass="sm:flex-none bg-surface-container text-primary font-body font-medium py-3 px-6 rounded-lg hover:bg-surface-container-high transition-colors duration-200 flex items-center justify-center gap-2" OnClick="btnRevisarPrioritario_Click">
                                <span class="material-symbols-outlined text-[20px]">visibility</span> Revisar
                            </asp:LinkButton>
                        </div>
                    </div>

                    <!-- Stats Card -->
                    <div class="bg-surface-container-low rounded-xl border border-outline-variant/15 p-6 flex flex-col justify-between">
                        <div>
                            <h4 class="font-headline font-semibold text-primary mb-4 flex items-center gap-2">
                                <span class="material-symbols-outlined">queue</span> Resumen de Cola
                            </h4>
                            <div class="space-y-4">
                                <div class="flex items-center justify-between p-3 bg-surface-container-lowest rounded-lg">
                                    <div class="flex items-center gap-3">
                                        <div class="w-8 h-8 rounded bg-tertiary-fixed flex items-center justify-center">
                                            <span class="material-symbols-outlined text-[18px]">pending_actions</span>
                                        </div>
                                        <span class="font-body text-sm text-on-surface font-medium">Por Firmar</span>
                                    </div>
                                    <asp:Label ID="lblPorFirmar" runat="server" CssClass="font-headline font-bold text-lg text-primary" Text="04"></asp:Label>
                                </div>
                                <div class="flex items-center justify-between p-3 bg-surface-container-lowest rounded-lg">
                                    <div class="flex items-center gap-3">
                                        <div class="w-8 h-8 rounded bg-primary-fixed flex items-center justify-center">
                                            <span class="material-symbols-outlined text-[18px]">check_circle</span>
                                        </div>
                                        <span class="font-body text-sm text-on-surface font-medium">Firmados Hoy</span>
                                    </div>
                                    <asp:Label ID="lblFirmadosHoy" runat="server" CssClass="font-headline font-bold text-lg text-primary" Text="12"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Secondary List -->
                <div class="mt-8 bg-surface-container-lowest rounded-xl shadow-[0_4px_20px_rgba(25,28,30,0.03)] border border-outline-variant/15 overflow-hidden">
                    <div class="px-6 py-4 border-b border-outline-variant/10 flex items-center justify-between bg-surface-container-low/50">
                        <h3 class="font-headline font-semibold text-primary">Cola de Espera</h3>
                        <asp:LinkButton ID="btnVerTodos" runat="server" CssClass="text-sm font-body font-medium text-primary flex items-center gap-1 hover:text-primary-container transition-colors" OnClick="btnVerTodos_Click">
                            Ver Todos <span class="material-symbols-outlined text-[18px]">arrow_forward</span>
                        </asp:LinkButton>
                    </div>
                    <div class="p-2">
                        <div class="flex flex-col sm:flex-row sm:items-center justify-between p-4 hover:bg-surface-container-high transition-colors rounded-lg gap-4">
                            <div class="flex items-start gap-4">
                                <div class="w-10 h-10 rounded-lg bg-surface-container flex flex-col items-center justify-center border border-outline-variant/20 flex-shrink-0">
                                    <span class="text-[10px] font-label uppercase font-bold">Ord</span>
                                    <span class="font-headline font-bold text-sm text-primary">02</span>
                                </div>
                                <div>
                                    <h4 class="font-body font-medium text-on-surface text-sm mb-1">Informe Técnico de Evaluación de Impacto Ambiental</h4>
                                    <p class="font-body text-xs text-on-surface-variant">Oficina de Ingeniería • Ingresado: Hoy, 10:30 AM</p>
                                </div>
                            </div>
                            <div class="flex items-center justify-end gap-2">
                                <span class="bg-surface-container text-on-surface-variant text-[11px] font-semibold px-2 py-1 rounded font-label">En espera</span>
                            </div>
                        </div>
                        <div class="flex flex-col sm:flex-row sm:items-center justify-between p-4 hover:bg-surface-container-high transition-colors rounded-lg gap-4">
                            <div class="flex items-start gap-4">
                                <div class="w-10 h-10 rounded-lg bg-surface-container flex flex-col items-center justify-center border border-outline-variant/20 flex-shrink-0">
                                    <span class="text-[10px] font-label uppercase font-bold">Ord</span>
                                    <span class="font-headline font-bold text-sm text-primary">03</span>
                                </div>
                                <div>
                                    <h4 class="font-body font-medium text-on-surface text-sm mb-1">Memorándum Múltiple N° 045-2023 - Asignación de Recursos</h4>
                                    <p class="font-body text-xs text-on-surface-variant">Recursos Humanos • Ingresado: Ayer, 16:45 PM</p>
                                </div>
                            </div>
                            <div class="flex items-center justify-end gap-2">
                                <span class="bg-surface-container text-on-surface-variant text-[11px] font-semibold px-2 py-1 rounded font-label">En espera</span>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </form>
</body>
</html>