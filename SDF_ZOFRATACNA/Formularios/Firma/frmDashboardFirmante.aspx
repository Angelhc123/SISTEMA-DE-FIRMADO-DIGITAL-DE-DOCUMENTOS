<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmDashboardFirmante.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Firma.frmDashboardFirmante" %>
<!DOCTYPE html>

<html lang="es">
<head runat="server">
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>SDF ZOFRATACNA - Dashboard Unificado</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@400;600;700;800;900&amp;family=Inter:wght@400;500;600&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#001e40",
                        "primary-container": "#003366",
                        "surface": "#f8f9fb",
                        "surface-container-low": "#f2f4f6",
                        "surface-container-lowest": "#ffffff",
                        "on-surface": "#191c1e",
                        "on-surface-variant": "#43474f",
                        "outline": "#737780",
                        "outline-variant": "#c3c6d1",
                        "error": "#ba1a1a",
                        "error-container": "#ffdad6",
                        "tertiary": "#381300",
                        "tertiary-fixed": "#ffdbca",
                        "primary-fixed": "#d5e3ff",
                        "success": "#2e7d32",
                        "success-container": "#c8e6c9"
                    },
                    borderRadius: {
                        DEFAULT: "0.125rem",
                        lg: "0.25rem",
                        xl: "0.5rem",
                        full: "0.75rem"
                    },
                    fontFamily: {
                        headline: ["Public Sans"],
                        body: ["Inter"],
                        label: ["Inter"]
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
<body class="bg-surface text-on-surface antialiased flex h-screen overflow-hidden">
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
                        <asp:Image ID="imgPerfil" runat="server" CssClass="w-10 h-10 rounded-full object-cover border-2 border-white shadow-sm" ImageUrl="https://ui-avatars.com/api/?background=001e40&color=fff&name=Usuario" />
                        <div class="flex-1">
                            <asp:Label ID="lblNombreUsuario" runat="server" CssClass="text-sm font-semibold text-primary block" Text="Usuario"></asp:Label>
                            <asp:Label ID="lblRolUsuario" runat="server" CssClass="text-xs text-on-surface-variant" Text="Firmante / Revisor"></asp:Label>
                        </div>
                        <asp:LinkButton ID="btnLogout" runat="server" CssClass="text-outline hover:text-error transition-colors" OnClick="btnLogout_Click">
                            <span class="material-symbols-outlined">logout</span>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="flex-1 flex flex-col md:ml-72 relative w-full h-screen overflow-hidden">
            <!-- TopNavBar -->
            <header class="bg-white/85 backdrop-blur-md fixed top-0 right-0 w-full md:w-[calc(100%-18rem)] h-16 z-50 shadow-sm border-b border-outline-variant/20">
                <div class="flex items-center justify-between px-8 h-full">
                    <div class="flex-1 max-w-md relative hidden md:block">
                        <span class="material-symbols-outlined absolute left-3 top-1/2 transform -translate-y-1/2 text-outline">search</span>
                        <asp:TextBox ID="txtBuscar" runat="server" CssClass="w-full bg-surface-container-low border border-outline-variant/30 rounded-full py-2 pl-10 pr-4 text-sm font-body focus:outline-none focus:ring-2 focus:ring-primary/20 transition-all" placeholder="Buscar en todo el sistema..."></asp:TextBox>
                    </div>
                    <div class="flex items-center space-x-4">
                        <button type="button" class="text-outline hover:text-primary transition-all relative">
                            <span class="material-symbols-outlined">notifications</span>
                            <span class="absolute -top-1 -right-1 w-3 h-3 bg-error rounded-full"></span>
                        </button>
                        <div class="h-6 w-px bg-outline-variant/30"></div>
                        <div class="flex items-center gap-2">
                            <div class="text-right hidden sm:block">
                                <p class="text-xs text-on-surface-variant">Bienvenido/a</p>
                                <asp:Label ID="lblNombreTop" runat="server" CssClass="text-sm font-semibold text-primary" Text="Usuario"></asp:Label>
                            </div>
                            <asp:Image ID="imgPerfilTop" runat="server" CssClass="w-8 h-8 rounded-full border border-outline-variant/30" ImageUrl="https://ui-avatars.com/api/?background=001e40&color=fff&name=Usuario" />
                        </div>
                    </div>
                </div>
            </header>

            <!-- Canvas -->
            <main class="flex-1 overflow-y-auto pt-24 px-4 sm:px-6 md:px-8 pb-12">
                <div class="max-w-[1400px] mx-auto">
                    <!-- Header -->
                    <div class="mb-8">
                        <h2 class="text-3xl font-headline font-bold text-primary mb-2">Panel de Control Unificado</h2>
                        <p class="text-on-surface-variant font-body text-base">Resumen de documentos pendientes de firma y revisión.</p>
                    </div>

                    <!-- Stats Grid - 4 cards -->
                    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-10">
                        <!-- Por Firmar -->
                        <div class="bg-surface-container-lowest rounded-2xl p-5 border border-outline-variant/20 shadow-sm hover:shadow-md transition-all">
                            <div class="flex items-center justify-between mb-3">
                                <div class="w-12 h-12 rounded-xl bg-primary-fixed/30 flex items-center justify-center">
                                    <span class="material-symbols-outlined text-primary text-2xl">draw</span>
                                </div>
                                <span class="text-3xl font-headline font-bold text-primary">
                                    <asp:Label ID="lblPorFirmar" runat="server" Text="4"></asp:Label>
                                </span>
                            </div>
                            <h3 class="font-semibold text-on-surface">Pendientes de Firma</h3>
                            <p class="text-xs text-on-surface-variant mt-1">Documentos que requieren su rúbrica</p>
                            <a runat="server" href="~/Formularios/Firma/frmMisDocumentosFirmante.aspx" class="inline-flex items-center gap-1 text-xs font-medium text-primary mt-3 hover:underline">Revisar <span class="material-symbols-outlined text-sm">arrow_forward</span></a>
                        </div>
                        
                        <!-- Por Revisar -->
                        <div class="bg-surface-container-lowest rounded-2xl p-5 border border-outline-variant/20 shadow-sm hover:shadow-md transition-all">
                            <div class="flex items-center justify-between mb-3">
                                <div class="w-12 h-12 rounded-xl bg-tertiary-fixed/30 flex items-center justify-center">
                                    <span class="material-symbols-outlined text-tertiary text-2xl">rate_review</span>
                                </div>
                                <span class="text-3xl font-headline font-bold text-tertiary">
                                    <asp:Label ID="lblPorRevisar" runat="server" Text="12"></asp:Label>
                                </span>
                            </div>
                            <h3 class="font-semibold text-on-surface">Pendientes de Revisión</h3>
                            <p class="text-xs text-on-surface-variant mt-1">Documentos que requieren su análisis</p>
                            <a runat="server" href="~/Formularios/Firma/frmMisDocumentosRevisor.aspx" class="inline-flex items-center gap-1 text-xs font-medium text-tertiary mt-3 hover:underline">Revisar <span class="material-symbols-outlined text-sm">arrow_forward</span></a>
                        </div>
                        
                        <!-- Firmados Hoy -->
                        <div class="bg-surface-container-lowest rounded-2xl p-5 border border-outline-variant/20 shadow-sm hover:shadow-md transition-all">
                            <div class="flex items-center justify-between mb-3">
                                <div class="w-12 h-12 rounded-xl bg-success-container/30 flex items-center justify-center">
                                    <span class="material-symbols-outlined text-success text-2xl">check_circle</span>
                                </div>
                                <span class="text-3xl font-headline font-bold text-success">
                                    <asp:Label ID="lblFirmadosHoy" runat="server" Text="8"></asp:Label>
                                </span>
                            </div>
                            <h3 class="font-semibold text-on-surface">Firmados Hoy</h3>
                            <p class="text-xs text-on-surface-variant mt-1">Documentos firmados en el día</p>
                        </div>
                        
                        <!-- Revisados Hoy -->
                        <div class="bg-surface-container-lowest rounded-2xl p-5 border border-outline-variant/20 shadow-sm hover:shadow-md transition-all">
                            <div class="flex items-center justify-between mb-3">
                                <div class="w-12 h-12 rounded-xl bg-primary-fixed/30 flex items-center justify-center">
                                    <span class="material-symbols-outlined text-primary text-2xl">assignment_turned_in</span>
                                </div>
                                <span class="text-3xl font-headline font-bold text-primary">
                                    <asp:Label ID="lblRevisadosHoy" runat="server" Text="6"></asp:Label>
                                </span>
                            </div>
                            <h3 class="font-semibold text-on-surface">Revisados Hoy</h3>
                            <p class="text-xs text-on-surface-variant mt-1">Documentos revisados en el día</p>
                        </div>
                    </div>

                    <!-- Two Column Layout -->
                    <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
                        <!-- Columna Izquierda: Documentos por Firmar (Prioritarios) -->
                        <div class="bg-surface-container-lowest rounded-2xl border border-outline-variant/20 overflow-hidden shadow-sm">
                            <div class="px-6 py-4 border-b border-outline-variant/20 bg-surface-container-low/30 flex justify-between items-center">
                                <div>
                                    <h3 class="font-headline font-semibold text-primary">Acción Requerida - Firma</h3>
                                    <p class="text-xs text-on-surface-variant mt-0.5">Documentos que requieren su firma digital</p>
                                </div>
                                <a runat="server" href="~/Formularios/Firma/frmMisDocumentosFirmante.aspx" class="text-sm text-primary font-medium hover:underline flex items-center gap-1">Ver todos <span class="material-symbols-outlined text-sm">arrow_forward</span></a>
                            </div>
                            <div class="divide-y divide-outline-variant/10">
                                <!-- Item 1 - Urgente -->
                                <div class="p-5 hover:bg-surface-container-low transition-colors">
                                    <div class="flex items-start justify-between">
                                        <div class="flex-1">
                                            <div class="flex items-center gap-2 mb-2">
                                                <span class="bg-error-container text-error text-xs font-bold px-2 py-0.5 rounded-full flex items-center gap-1">
                                                    <span class="material-symbols-outlined text-xs">priority_high</span> Urgente
                                                </span>
                                                <span class="text-xs text-on-surface-variant">Vence en 2 horas</span>
                                            </div>
                                            <h4 class="font-semibold text-on-surface">Resolución Directoral N° 145-2023-ZOFRATACNA</h4>
                                            <p class="text-sm text-on-surface-variant mt-1">Aprobación de la modificación del Plan Operativo Institucional (POI)</p>
                                            <div class="flex items-center gap-4 mt-3">
                                                <div class="flex items-center gap-1">
                                                    <span class="material-symbols-outlined text-sm text-outline">person</span>
                                                    <span class="text-xs text-on-surface-variant">Gerencia General</span>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:LinkButton ID="btnFirmarUrgente" runat="server" CssClass="bg-primary text-white px-4 py-2 rounded-lg text-sm font-medium flex items-center gap-1 hover:bg-primary-container transition-colors" OnClick="btnFirmarUrgente_Click">
                                            <span class="material-symbols-outlined text-sm">draw</span> Firmar
                                        </asp:LinkButton>
                                    </div>
                                </div>
                                <!-- Item 2 -->
                                <div class="p-5 hover:bg-surface-container-low transition-colors">
                                    <div class="flex items-start justify-between">
                                        <div class="flex-1">
                                            <div class="flex items-center gap-2 mb-2">
                                                <span class="bg-surface-container-high text-on-surface-variant text-xs font-bold px-2 py-0.5 rounded-full">Normal</span>
                                                <span class="text-xs text-on-surface-variant">Vence mañana</span>
                                            </div>
                                            <h4 class="font-semibold text-on-surface">Contrato de Arrendamiento Lote 45-B</h4>
                                            <p class="text-sm text-on-surface-variant mt-1">Renovación de contrato anual</p>
                                            <div class="flex items-center gap-4 mt-3">
                                                <div class="flex items-center gap-1">
                                                    <span class="material-symbols-outlined text-sm text-outline">person</span>
                                                    <span class="text-xs text-on-surface-variant">Gerencia Comercial</span>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:LinkButton ID="btnFirmarNormal" runat="server" CssClass="bg-primary text-white px-4 py-2 rounded-lg text-sm font-medium flex items-center gap-1 hover:bg-primary-container transition-colors" OnClick="btnFirmarNormal_Click">
                                            <span class="material-symbols-outlined text-sm">draw</span> Firmar
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Columna Derecha: Documentos por Revisar (Prioritarios) -->
                        <div class="bg-surface-container-lowest rounded-2xl border border-outline-variant/20 overflow-hidden shadow-sm">
                            <div class="px-6 py-4 border-b border-outline-variant/20 bg-surface-container-low/30 flex justify-between items-center">
                                <div>
                                    <h3 class="font-headline font-semibold text-tertiary">Acción Requerida - Revisión</h3>
                                    <p class="text-xs text-on-surface-variant mt-0.5">Documentos que requieren su análisis y dictamen</p>
                                </div>
                                <a runat="server" href="~/Formularios/Firma/frmMisDocumentosRevisor.aspx" class="text-sm text-tertiary font-medium hover:underline flex items-center gap-1">Ver todos <span class="material-symbols-outlined text-sm">arrow_forward</span></a>
                            </div>
                            <div class="divide-y divide-outline-variant/10">
                                <!-- Item 1 - Alta Prioridad -->
                                <div class="p-5 hover:bg-surface-container-low transition-colors">
                                    <div class="flex items-start justify-between">
                                        <div class="flex-1">
                                            <div class="flex items-center gap-2 mb-2">
                                                <span class="bg-error-container text-error text-xs font-bold px-2 py-0.5 rounded-full flex items-center gap-1">
                                                    <span class="material-symbols-outlined text-xs">priority_high</span> Alta Prioridad
                                                </span>
                                                <span class="text-xs text-on-surface-variant">Vence hoy</span>
                                            </div>
                                            <h4 class="font-semibold text-on-surface">Contrato de Arrendamiento Lote B-45</h4>
                                            <p class="text-sm text-on-surface-variant mt-1">Documento requiere revisión legal urgente</p>
                                            <div class="flex items-center gap-4 mt-3">
                                                <div class="flex items-center gap-1">
                                                    <span class="material-symbols-outlined text-sm text-outline">person</span>
                                                    <span class="text-xs text-on-surface-variant">Logística Interna</span>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:LinkButton ID="btnRevisarUrgente" runat="server" CssClass="bg-tertiary text-white px-4 py-2 rounded-lg text-sm font-medium flex items-center gap-1 hover:bg-tertiary/80 transition-colors" OnClick="btnRevisarUrgente_Click">
                                            <span class="material-symbols-outlined text-sm">rate_review</span> Revisar
                                        </asp:LinkButton>
                                    </div>
                                </div>
                                <!-- Item 2 -->
                                <div class="p-5 hover:bg-surface-container-low transition-colors">
                                    <div class="flex items-start justify-between">
                                        <div class="flex-1">
                                            <div class="flex items-center gap-2 mb-2">
                                                <span class="bg-surface-container-high text-on-surface-variant text-xs font-bold px-2 py-0.5 rounded-full">Media</span>
                                                <span class="text-xs text-on-surface-variant">Vence mañana</span>
                                            </div>
                                            <h4 class="font-semibold text-on-surface">Resolución Directoral 045-2023</h4>
                                            <p class="text-sm text-on-surface-variant mt-1">Aprobación de directiva interna</p>
                                            <div class="flex items-center gap-4 mt-3">
                                                <div class="flex items-center gap-1">
                                                    <span class="material-symbols-outlined text-sm text-outline">person</span>
                                                    <span class="text-xs text-on-surface-variant">Dirección General</span>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:LinkButton ID="btnRevisarNormal" runat="server" CssClass="bg-tertiary text-white px-4 py-2 rounded-lg text-sm font-medium flex items-center gap-1 hover:bg-tertiary/80 transition-colors" OnClick="btnRevisarNormal_Click">
                                            <span class="material-symbols-outlined text-sm">rate_review</span> Revisar
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </form>
</body>
</html>