<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmMisDocumentosRevisor.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Firma.frmMisDocumentosRevisor" %>
<!DOCTYPE html>

<html class="light" lang="es">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>SDF ZOFRATACNA - Mis Documentos</title>
    <link href="https://fonts.googleapis.com" rel="preconnect"/>
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "on-surface-variant": "#44474e",
                        "on-primary": "#ffffff",
                        "outline-variant": "#c4c6cf",
                        "surface": "#faf9fc",
                        "secondary": "#565f6f",
                        "tertiary-container": "#381300",
                        "primary-container": "#001e40",
                        "tertiary-fixed": "#ffdbcb",
                        "on-secondary": "#ffffff",
                        "tertiary": "#0e0200",
                        "secondary-fixed-dim": "#bec7d9",
                        "surface-tint": "#485f84",
                        "on-tertiary-fixed-variant": "#6a3a20",
                        "on-error": "#ffffff",
                        "primary": "#000511",
                        "surface-container": "#efedf1",
                        "on-background": "#1a1c1e",
                        "on-secondary-fixed-variant": "#3f4756",
                        "on-primary-fixed": "#001b3b",
                        "surface-container-high": "#e9e7eb",
                        "error": "#ba1a1a",
                        "on-tertiary-container": "#b47858",
                        "inverse-surface": "#2f3033",
                        "surface-bright": "#faf9fc",
                        "secondary-container": "#d7e0f3",
                        "on-tertiary": "#ffffff",
                        "surface-dim": "#dbd9dd",
                        "inverse-primary": "#afc8f2",
                        "error-container": "#ffdad6",
                        "secondary-fixed": "#dae3f6",
                        "surface-container-lowest": "#ffffff",
                        "on-surface": "#1a1c1e",
                        "tertiary-fixed-dim": "#fdb793",
                        "surface-container-highest": "#e3e2e5",
                        "outline": "#74777f",
                        "on-error-container": "#93000a",
                        "on-primary-container": "#6f87ae",
                        "on-tertiary-fixed": "#341100",
                        "primary-fixed": "#d5e3ff",
                        "on-secondary-fixed": "#131c2a",
                        "surface-container-low": "#f4f3f6",
                        "on-secondary-container": "#5a6373",
                        "inverse-on-surface": "#f2f0f4",
                        "on-primary-fixed-variant": "#2f476b",
                        "background": "#faf9fc",
                        "surface-variant": "#e3e2e5",
                        "primary-fixed-dim": "#afc8f2"
                    },
                    "borderRadius": {
                        "DEFAULT": "0.125rem",
                        "lg": "0.25rem",
                        "xl": "0.5rem",
                        "full": "0.75rem"
                    },
                    "fontFamily": {
                        "headline": ["Public Sans"],
                        "body": ["Public Sans"],
                        "label": ["Public Sans"]
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-surface text-on-surface font-body antialiased flex h-screen overflow-hidden selection:bg-primary-container selection:text-white">
    <form id="form1" runat="server" class="flex w-full h-screen overflow-hidden">
        <!-- SideNavBar -->
        <aside class="bg-white dark:bg-slate-950 h-screen w-72 fixed left-0 top-0 border-r-0 shadow-[8px_0_24px_rgba(0,30,64,0.04)] z-50">
            <div class="flex flex-col h-full py-8">
                <div class="px-8 mb-12">
                    <div class="flex items-center gap-4">
                        <div class="w-10 h-10 bg-primary-container rounded-lg flex items-center justify-center text-white">
                            <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">account_balance</span>
                        </div>
                        <div>
                            <h1 class="text-lg font-black tracking-tighter text-[#001E40] dark:text-white uppercase">SDF ZOFRATACNA</h1>
                            <p class="text-xs text-on-surface-variant font-medium tracking-wide">Sistema de Firmado Digital</p>
                        </div>
                    </div>
                </div>
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
                    <asp:Label ID="Label2" runat="server" CssClass="text-xs text-on-surface-variant" Text="Firmante / Revisor"></asp:Label>
                </div>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="text-outline hover:text-error transition-colors" OnClick="btnLogout_Click">
                    <span class="material-symbols-outlined">logout</span>
                </asp:LinkButton>
            </div>
        </div>
    </div>
</nav>
                <div class="px-6 mt-auto">
                    <div class="flex items-center gap-3 pt-6 border-t border-outline-variant/20">
                        <asp:Image ID="imgPerfil" runat="server" CssClass="w-9 h-9 rounded-full object-cover" ImageUrl="https://lh3.googleusercontent.com/aida-public/AB6AXuDlWAp-oLnMuVAoGrFmM_6OZfOpawQJp86iuO_Hw1dtkPndj--0lvry3HxF0cOFXzdV5exUmrE_U3-PRmZ5yhZ8BT2dVRZpvkyfNe3xiojudqYk7zoFPcO-cFk6dh1S_CTTGHBu5cnS4FvjOTP59yzlvmuGZvkSLid4eIv6dAW-Ow_vNdaUqdj8cM2nu42OdfESLq9ZcO7LWzExtl7F0d2-jerUVhotulqbb4by4sKKpHafcmFr5Dk3O-pH1GGY930GQeFejPfBgLKa" />
                        <div>
                            <asp:Label ID="lblNombreUsuario" runat="server" CssClass="text-sm font-bold text-primary-container" Text="E. Revisor"></asp:Label>
                            <asp:Label ID="lblRolUsuario" runat="server" CssClass="text-xs text-on-surface-variant block" Text="Gerencia Legal"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </aside>

        <!-- Main Wrapper -->
        <div class="flex-1 ml-72 flex flex-col h-full bg-surface relative">
            <!-- TopNavBar -->
            <header class="bg-white/80 dark:bg-slate-950/80 backdrop-blur-xl fixed top-0 right-0 left-72 h-16 z-40 shadow-sm dark:shadow-none transition-all duration-300 ease-in-out font-public-sans text-sm tracking-wide text-[#001E40] dark:text-[#d5e3ff]">
                <div class="flex items-center justify-between px-10 h-full w-full">
                    <div class="flex items-center gap-4">
                        <span class="text-slate-400 hover:text-[#001E40] transition-colors cursor-pointer">Dashboard</span>
                        <span class="text-outline-variant material-symbols-outlined text-[16px]">chevron_right</span>
                        <span class="text-[#001E40] font-bold border-b-2 border-[#001E40] pb-1">Mis Documentos</span>
                    </div>
                    <div class="flex items-center gap-6">
                        <asp:LinkButton ID="btnLogout" runat="server" CssClass="text-slate-400 hover:text-[#001E40] transition-colors flex items-center gap-2" OnClick="btnLogout_Click">
                            <span class="material-symbols-outlined text-[20px]">logout</span>
                            Cerrar Sesión
                        </asp:LinkButton>
                    </div>
                </div>
            </header>

            <!-- Canvas / Main Content -->
            <main class="flex-1 overflow-y-auto pt-28 px-12 pb-20">
                <div class="mb-12 flex justify-between items-end">
                    <div>
                        <h2 class="text-[32px] font-headline font-extrabold tracking-tight text-primary-container leading-none mb-2">Bandeja de Revisión</h2>
                        <p class="text-on-surface-variant text-base">Documentos pendientes de evaluación y firma digital.</p>
                    </div>
                    <div class="flex gap-4">
                        <div class="relative">
                            <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-outline text-[20px]">search</span>
                            <asp:TextBox ID="txtBuscar" runat="server" CssClass="bg-surface-container-highest border-0 border-b-2 border-outline-variant focus:border-primary-container focus:ring-0 pl-10 pr-4 py-2 w-72 text-sm rounded-t-sm transition-colors" placeholder="Buscar por remitente o asunto..."></asp:TextBox>
                        </div>
                        <asp:LinkButton ID="btnFiltrar" runat="server" CssClass="bg-surface-container-highest text-on-surface hover:bg-surface-variant transition-colors px-4 py-2 rounded-md text-sm font-medium flex items-center gap-2" OnClick="btnFiltrar_Click">
                            <span class="material-symbols-outlined text-[18px]">filter_list</span>
                            Filtros
                        </asp:LinkButton>
                    </div>
                </div>

                <!-- Summary Stats -->
                <div class="grid grid-cols-3 gap-6 mb-12">
                    <div class="bg-surface-container-low p-6 rounded-lg flex flex-col justify-between h-32 relative overflow-hidden group">
                        <div class="absolute right-0 top-0 w-24 h-24 bg-error/5 rounded-bl-full -mr-4 -mt-4 transition-transform group-hover:scale-110"></div>
                        <p class="text-sm font-bold text-on-surface-variant uppercase tracking-wider z-10">Alta Prioridad</p>
                        <asp:Label ID="lblAltaPrioridad" runat="server" CssClass="text-4xl font-headline font-black text-error z-10" Text="03"></asp:Label>
                    </div>
                    <div class="bg-surface-container-low p-6 rounded-lg flex flex-col justify-between h-32">
                        <p class="text-sm font-bold text-on-surface-variant uppercase tracking-wider">Pendientes Hoy</p>
                        <asp:Label ID="lblPendientesHoy" runat="server" CssClass="text-4xl font-headline font-black text-primary-container" Text="12"></asp:Label>
                    </div>
                    <div class="bg-surface-container-low p-6 rounded-lg flex flex-col justify-between h-32 border-l-4 border-primary-container">
                        <p class="text-sm font-bold text-on-surface-variant uppercase tracking-wider">Próximos a Vencer</p>
                        <asp:Label ID="lblProximosVencer" runat="server" CssClass="text-4xl font-headline font-black text-on-surface" Text="05"></asp:Label>
                    </div>
                </div>

                <!-- List Layout -->
                <div class="space-y-4">
                    <div class="px-6 pb-2 flex grid grid-cols-12 gap-4 text-xs font-bold text-outline uppercase tracking-wider">
                        <div class="col-span-1">Prioridad</div>
                        <div class="col-span-3">Remitente</div>
                        <div class="col-span-5">Asunto / Referencia</div>
                        <div class="col-span-2">Ingreso</div>
                        <div class="col-span-1 text-right">Acción</div>
                    </div>

                    <!-- Item 1 (High Priority) -->
                    <div class="bg-surface-container-lowest outline outline-1 outline-outline-variant/20 rounded-lg p-5 grid grid-cols-12 gap-4 items-center hover:bg-surface-container-low hover:shadow-[0_8px_24px_rgba(0,30,64,0.06)] transition-all duration-200 group relative">
                        <div class="absolute left-0 top-0 bottom-0 w-1 bg-error rounded-l-lg"></div>
                        <div class="col-span-1 pl-4">
                            <span class="inline-flex items-center gap-1 bg-error-container text-on-error-container text-[10px] font-bold px-2 py-1 rounded-sm uppercase tracking-wide">
                                <span class="material-symbols-outlined text-[12px]">priority_high</span> Alta
                            </span>
                        </div>
                        <div class="col-span-3 flex items-center gap-3">
                            <div class="w-8 h-8 rounded-full bg-secondary-container text-on-secondary-container flex items-center justify-center font-bold text-xs">JL</div>
                            <div>
                                <p class="text-sm font-bold text-on-surface leading-tight">Juan López M.</p>
                                <p class="text-xs text-on-surface-variant">Logística Interna</p>
                            </div>
                        </div>
                        <div class="col-span-5 pr-4">
                            <p class="text-sm font-bold text-primary-container truncate">Aprobación de Contrato Proveedores T3</p>
                            <p class="text-xs text-on-surface-variant truncate font-mono mt-0.5">REF: CT-2023-089-LOG</p>
                        </div>
                        <div class="col-span-2">
                            <p class="text-sm text-on-surface font-medium">Hoy, 09:30 AM</p>
                            <p class="text-xs text-error font-medium">Vence en 2h</p>
                        </div>
                        <div class="col-span-1 flex justify-end">
                            <asp:LinkButton ID="btnRevisar1" runat="server" CssClass="bg-gradient-to-br from-primary to-primary-container text-white px-4 py-2 rounded-md text-sm font-bold hover:shadow-lg transition-all flex items-center gap-2" OnClick="btnRevisar_Click" CommandArgument="1">
                                Revisar
                            </asp:LinkButton>
                        </div>
                    </div>

                    <!-- Item 2 (Normal) -->
                    <div class="bg-surface-container-lowest outline outline-1 outline-outline-variant/20 rounded-lg p-5 grid grid-cols-12 gap-4 items-center hover:bg-surface-container-low hover:shadow-[0_8px_24px_rgba(0,30,64,0.06)] transition-all duration-200">
                        <div class="col-span-1 pl-4">
                            <span class="inline-flex items-center gap-1 bg-surface-container text-on-surface-variant text-[10px] font-bold px-2 py-1 rounded-sm uppercase tracking-wide">Media</span>
                        </div>
                        <div class="col-span-3 flex items-center gap-3">
                            <div class="w-8 h-8 rounded-full bg-primary-fixed text-on-primary-fixed flex items-center justify-center font-bold text-xs">AC</div>
                            <div>
                                <p class="text-sm font-bold text-on-surface leading-tight">Ana Castro V.</p>
                                <p class="text-xs text-on-surface-variant">Recursos Humanos</p>
                            </div>
                        </div>
                        <div class="col-span-5 pr-4">
                            <p class="text-sm font-bold text-primary-container truncate">Renovación de Personalización - Octubre</p>
                            <p class="text-xs text-on-surface-variant truncate font-mono mt-0.5">REF: RRHH-MEMO-442</p>
                        </div>
                        <div class="col-span-2">
                            <p class="text-sm text-on-surface font-medium">Ayer, 16:45 PM</p>
                            <p class="text-xs text-outline font-medium">Hace 18 hrs</p>
                        </div>
                        <div class="col-span-1 flex justify-end">
                            <asp:LinkButton ID="btnRevisar2" runat="server" CssClass="bg-surface-container-highest text-on-surface hover:bg-surface-variant px-4 py-2 rounded-md text-sm font-bold transition-colors" OnClick="btnRevisar_Click" CommandArgument="2">
                                Abrir
                            </asp:LinkButton>
                        </div>
                    </div>

                    <!-- Item 3 (Normal) -->
                    <div class="bg-surface-container-lowest outline outline-1 outline-outline-variant/20 rounded-lg p-5 grid grid-cols-12 gap-4 items-center hover:bg-surface-container-low hover:shadow-[0_8px_24px_rgba(0,30,64,0.06)] transition-all duration-200">
                        <div class="col-span-1 pl-4">
                            <span class="inline-flex items-center gap-1 bg-surface-container text-on-surface-variant text-[10px] font-bold px-2 py-1 rounded-sm uppercase tracking-wide">Media</span>
                        </div>
                        <div class="col-span-3 flex items-center gap-3">
                            <div class="w-8 h-8 rounded-full bg-secondary-fixed text-on-secondary-fixed flex items-center justify-center font-bold text-xs">MR</div>
                            <div>
                                <p class="text-sm font-bold text-on-surface leading-tight">Miguel Ríos</p>
                                <p class="text-xs text-on-surface-variant">Dirección General</p>
                            </div>
                        </div>
                        <div class="col-span-5 pr-4">
                            <p class="text-sm font-bold text-primary-container truncate">Resolución Directoral 045-2023</p>
                            <p class="text-xs text-on-surface-variant truncate font-mono mt-0.5">REF: DIR-RES-045</p>
                        </div>
                        <div class="col-span-2">
                            <p class="text-sm text-on-surface font-medium">24 Oct, 11:20 AM</p>
                            <p class="text-xs text-outline font-medium">Hace 2 días</p>
                        </div>
                        <div class="col-span-1 flex justify-end">
                            <asp:LinkButton ID="btnRevisar3" runat="server" CssClass="bg-surface-container-highest text-on-surface hover:bg-surface-variant px-4 py-2 rounded-md text-sm font-bold transition-colors" OnClick="btnRevisar_Click" CommandArgument="3">
                                Abrir
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>

                <!-- Pagination -->
                <div class="mt-8 flex justify-center">
                    <asp:LinkButton ID="btnCargarMas" runat="server" CssClass="text-primary-container font-bold text-sm hover:underline tracking-wide" OnClick="btnCargarMas_Click">
                        Cargar más documentos (9 restantes)
                    </asp:LinkButton>
                </div>
            </main>
        </div>
    </form>
</body>
</html>