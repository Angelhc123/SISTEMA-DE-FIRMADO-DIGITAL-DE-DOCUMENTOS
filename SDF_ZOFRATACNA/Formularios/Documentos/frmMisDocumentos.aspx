<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmMisDocumentos.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Documentos.frmMisDocumentos" %>
<!DOCTYPE html>

<html class="light" lang="es">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>SDF ZOFRATACNA - Mis Documentos</title>
    <!-- Google Fonts: Public Sans & Material Symbols -->
    <link href="https://fonts.googleapis.com" rel="preconnect"/>
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@400;500;600;700;800;900&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <!-- Theme Configuration -->
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
                    "spacing": {},
                    "fontFamily": {
                        "headline": ["Public Sans"],
                        "body": ["Public Sans"],
                        "label": ["Public Sans"]
                    }
                },
            },
        }
    </script>
    <style>
        /* Base typography application */
        body {
            font-family: 'Public Sans', sans-serif;
            background-color: #faf9fc; /* surface */
        }
    </style>
</head>
<body class="bg-surface text-on-surface antialiased overflow-hidden selection:bg-primary-container selection:text-white">
    <form id="form1" runat="server" class="flex h-screen w-full">
        <!-- App Layout Container -->
        <div class="flex h-screen w-full">
            <!-- ========================================== -->
            <!-- SIDENAVBAR COMPONENT                       -->
            <!-- ========================================== -->
            <aside class="bg-white dark:bg-slate-950 h-screen w-72 fixed left-0 top-0 border-r-0 shadow-[8px_0_24px_rgba(0,30,64,0.04)] z-50 flex flex-col py-8">
                <!-- Brand Header -->
                <div class="px-8 mb-12 flex items-center gap-4">
                    <div class="w-10 h-10 rounded-lg bg-gradient-to-br from-primary to-primary-container flex items-center justify-center shadow-lg shadow-primary-container/20">
                        <span class="material-symbols-outlined fill text-white text-xl">account_balance</span>
                    </div>
                    <div>
                        <h1 class="text-lg font-black tracking-tighter text-[#001E40] dark:text-white uppercase font-headline leading-tight">SDF ZOFRATACNA</h1>
                        <p class="text-xs text-slate-500 font-label tracking-wide uppercase mt-0.5">Sistema de Firmado Digital</p>
                    </div>
                </div>
                <!-- Navigation Links -->
                <nav class="flex-1 px-4 space-y-1 font-public-sans tracking-tight text-sm font-medium">
                    <!-- Inactive Tab: Dashboard -->
                    <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-l-xl group" href="~/Formularios/Documentos/frmDashboardRegistrador.aspx">
                        <span class="material-symbols-outlined group-hover:text-primary-container transition-colors">dashboard</span>
                        <span>Dashboard</span>
                    </a>
                    <!-- Active Tab: Mis Documentos -->
                    <a runat="server" class="flex items-center gap-3 px-6 py-4 text-[#001E40] dark:text-white bg-slate-100 dark:bg-[#001E40]/20 font-bold border-r-4 border-[#001E40] rounded-l-xl Active: translate-x-1 duration-150 relative group overflow-hidden" href="~/Formularios/Documentos/frmMisDocumentos.aspx">
                        <div class="absolute inset-0 bg-gradient-to-r from-transparent to-slate-200/50 opacity-0 group-hover:opacity-100 transition-opacity"></div>
                        <span class="material-symbols-outlined fill" style="font-variation-settings: 'FILL' 1;">description</span>
                        <span class="relative z-10">Mis Documentos</span>
                    </a>
                    <!-- Inactive Tabs -->
                    <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-l-xl group" href="~/Formularios/Documentos/frmRegistrarDocumento.aspx">
                        <span class="material-symbols-outlined group-hover:text-primary-container transition-colors">add_box</span>
                        <span>Registrar Nuevo</span>
                    </a>
                    <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-l-xl group" href="~/Formularios/Documentos/frmArchivoRegistrador.aspx">
                        <span class="material-symbols-outlined group-hover:text-primary-container transition-colors">archive</span>
                        <span>Archivo</span>
                    </a>
                    <!-- Separation Logic (Spacer) -->
                    <div class="my-6 h-px bg-slate-50 dark:bg-slate-900/50 mx-6"></div>
                    <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-l-xl group" href="~/Formularios/Documentos/frmDirectorio.aspx">
                        <span class="material-symbols-outlined group-hover:text-primary-container transition-colors">contact_phone</span>
                        <span>Directorio</span>
                    </a>
                    <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-l-xl group" href="#">
                        <span class="material-symbols-outlined group-hover:text-primary-container transition-colors">settings</span>
                        <span>Ajustes</span>
                    </a>
                    <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-l-xl group" href="#">
                        <span class="material-symbols-outlined group-hover:text-primary-container transition-colors">support_agent</span>
                        <span>Soporte</span>
                    </a>
                </nav>
                <!-- User Footer Area -->
                <div class="px-8 mt-auto flex items-center gap-3">
                    <img alt="Avatar de Usuario" class="w-10 h-10 rounded-full border border-outline-variant/30 object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAqFuOqYVrG90eCaGApElj-q1y7WdMdy_YEmH3YI2VsYAcB2TC0OpBwGkc7Jgu7_yGcU5h0u97G9TWExUur3ZvYfBGkOB6aGP4TiVkMcjuJe2dBLzvFB4lSsjbcp_yIg_HrmccQPuhiSESRkXAxRDhUWZiyChBXyVEOFyyChSNVM5dV15eE8Att5sHVCkoKstwBi1C7lPO1PB2bW0IRz6bgBYAmcAWALKNNfLFcgS0pl8Sq38ZxySe7FmsPM6ZRvp9BPknwcSKooSvf"/>
                    <div class="flex flex-col">
                        <span class="text-sm font-bold text-primary-container tracking-tight"><asp:Literal ID="litUsuario" runat="server">Registrador</asp:Literal></span>
                        <span class="text-xs text-on-surface-variant font-label uppercase tracking-widest">Registrador</span>
                    </div>
                </div>
            </aside>
            <!-- Main Content Wrapper (Accounts for SideNav width) -->
            <main class="ml-72 flex-1 flex flex-col h-screen relative bg-surface">
                <!-- ========================================== -->
                <!-- TOPNAVBAR COMPONENT                        -->
                <!-- ========================================== -->
                <header class="bg-white/80 dark:bg-slate-950/80 backdrop-blur-xl fixed top-0 right-0 left-72 h-16 z-40 shadow-sm dark:shadow-none flex items-center justify-between px-10 transition-all duration-300 ease-in-out border-b border-surface-container/50">
                    <!-- Navigation Links (Breadcrumb style) -->
                    <nav class="font-public-sans text-sm tracking-wide text-[#001E40] dark:text-[#d5e3ff] flex items-center gap-4">
                        <span class="text-slate-400">Inicio</span>
                        <span class="material-symbols-outlined text-sm text-slate-300">chevron_right</span>
                        <span class="text-[#001E40] font-bold border-b-2 border-[#001E40] pb-1 translate-y-[2px]">Mis Documentos</span>
                    </nav>
                    <!-- Trailing Actions -->
                    <div class="flex items-center gap-6">
                        <button type="button" class="text-slate-400 hover:text-[#001E40] dark:hover:text-white transition-colors relative group">
                            <span class="material-symbols-outlined">notifications</span>
                            <span class="absolute top-0 right-0 w-2 h-2 bg-error rounded-full border-2 border-white"></span>
                        </button>
                        <div class="w-px h-6 bg-slate-200"></div>
                        <asp:LinkButton ID="btnLogout" runat="server" CssClass="text-sm font-medium text-slate-500 hover:text-error transition-colors flex items-center gap-2 font-label uppercase tracking-wider" OnClick="btnLogout_Click">
                            <span>Cerrar Sesión</span>
                            <span class="material-symbols-outlined text-[18px]">logout</span>
                        </asp:LinkButton>
                    </div>
                </header>
                <!-- ========================================== -->
                <!-- PAGE CONTENT CANVAS                        -->
                <!-- ========================================== -->
                <div class="flex-1 overflow-y-auto pt-24 px-12 pb-12">
                    <!-- Page Header Area -->
                    <div class="mb-10 flex justify-between items-end">
                        <div>
                            <h2 class="font-headline text-3xl font-extrabold tracking-tight text-primary-container">Bandeja de Entrada</h2>
                            <p class="font-body text-secondary mt-2 text-base">Gestión y revisión de expedientes documentales.</p>
                        </div>
                        <!-- Search Input (Precision Grid Style) -->
                        <div class="relative w-72">
                            <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-secondary text-lg">search</span>
                            <input class="w-full bg-surface-container-high border-0 border-b-2 border-outline-variant focus:border-primary-container focus:ring-0 pl-10 pr-4 py-2 text-sm font-body text-on-surface rounded-t-sm transition-colors" placeholder="Buscar por ID o Asunto..." type="text"/>
                        </div>
                    </div>

                    <!-- Filters Strip (Bento Pattern) -->
                    <div class="flex gap-2 mb-8 border-b border-surface-container-high pb-4">
                        <button class="px-5 py-2 rounded-full bg-primary-container text-on-primary font-label text-sm font-semibold tracking-wide uppercase transition-all shadow-[0_4px_12px_rgba(0,30,64,0.15)]">
                            Todos
                        </button>
                        <button class="px-5 py-2 rounded-full bg-surface text-secondary hover:bg-surface-container hover:text-on-surface font-label text-sm font-medium tracking-wide uppercase transition-colors">
                            Pendientes
                        </button>
                        <button class="px-5 py-2 rounded-full bg-surface text-secondary hover:bg-surface-container hover:text-on-surface font-label text-sm font-medium tracking-wide uppercase transition-colors">
                            Observados
                        </button>
                        <button class="px-5 py-2 rounded-full bg-surface text-secondary hover:bg-surface-container hover:text-on-surface font-label text-sm font-medium tracking-wide uppercase transition-colors">
                            Firmados
                        </button>
                    </div>

                    <!-- Data Table (The Invisible Grid / Editorial Style) -->
                    <div class="bg-surface-container-lowest rounded-lg p-2 shadow-[0_8px_32px_rgba(0,30,64,0.04)] relative">
                        <!-- Ghost border defined by subtle background shift -->
                        <table class="w-full text-left font-body border-collapse">
                            <thead>
                                <tr>
                                    <th class="py-4 px-6 font-label text-xs font-bold uppercase tracking-widest text-secondary border-b border-surface-container-high w-32">ID Exp.</th>
                                    <th class="py-4 px-6 font-label text-xs font-bold uppercase tracking-widest text-secondary border-b border-surface-container-high">Asunto del Documento</th>
                                    <th class="py-4 px-6 font-label text-xs font-bold uppercase tracking-widest text-secondary border-b border-surface-container-high w-40">Fecha Reg.</th>
                                    <th class="py-4 px-6 font-label text-xs font-bold uppercase tracking-widest text-secondary border-b border-surface-container-high w-40">Estado Legal</th>
                                    <th class="py-4 px-6 font-label text-xs font-bold uppercase tracking-widest text-secondary border-b border-surface-container-high w-24 text-right">Acciones</th>
                                </tr>
                            </thead>
                            <tbody class="text-sm">
                                <!-- Row 1: Pendiente -->
                                <tr class="group hover:bg-surface-container-low transition-colors duration-200">
                                    <td class="py-5 px-6 font-medium text-primary-container">EXP-2023-0891</td>
                                    <td class="py-5 px-6 text-on-surface-variant pr-12 truncate max-w-md">Solicitud de autorización de ingreso de mercancía restringida zona franca</td>
                                    <td class="py-5 px-6 text-secondary">12 Oct 2023</td>
                                    <td class="py-5 px-6">
                                        <span class="inline-flex items-center justify-center px-3 py-1 rounded-full bg-secondary-container text-on-secondary-container font-label text-xs font-bold uppercase tracking-wider">
                                            Pendiente
                                        </span>
                                    </td>
                                    <td class="py-5 px-6 text-right">
                                        <button class="text-secondary hover:text-primary-container transition-colors p-1" title="Revisar">
                                            <span class="material-symbols-outlined text-xl">visibility</span>
                                        </button>
                                    </td>
                                </tr>
                                <!-- Row 2: Registrado -->
                                <tr class="group hover:bg-surface-container-low transition-colors duration-200">
                                    <td class="py-5 px-6 font-medium text-primary-container">EXP-2023-0890</td>
                                    <td class="py-5 px-6 text-on-surface-variant pr-12 truncate max-w-md">Declaración jurada de origen de componentes de ensamblaje Lote B</td>
                                    <td class="py-5 px-6 text-secondary">12 Oct 2023</td>
                                    <td class="py-5 px-6">
                                        <span class="inline-flex items-center justify-center px-3 py-1 rounded-full bg-surface-container-highest text-on-surface font-label text-xs font-bold uppercase tracking-wider">
                                            Registrado
                                        </span>
                                    </td>
                                    <td class="py-5 px-6 text-right">
                                        <button class="text-secondary hover:text-primary-container transition-colors p-1" title="Revisar">
                                            <span class="material-symbols-outlined text-xl">visibility</span>
                                        </button>
                                    </td>
                                </tr>
                                <!-- Row 3: Observado -->
                                <tr class="group hover:bg-surface-container-low transition-colors duration-200">
                                    <td class="py-5 px-6 font-medium text-primary-container">EXP-2023-0885</td>
                                    <td class="py-5 px-6 text-on-surface-variant pr-12 truncate max-w-md">Manifiesto de carga internacional terrestre fronterizo (Incompleto)</td>
                                    <td class="py-5 px-6 text-secondary">11 Oct 2023</td>
                                    <td class="py-5 px-6">
                                        <span class="inline-flex items-center justify-center px-3 py-1 rounded-full bg-error-container text-on-error-container font-label text-xs font-bold uppercase tracking-wider">
                                            Observado
                                        </span>
                                    </td>
                                    <td class="py-5 px-6 text-right">
                                        <button class="text-secondary hover:text-primary-container transition-colors p-1" title="Revisar">
                                            <span class="material-symbols-outlined text-xl">visibility</span>
                                        </button>
                                    </td>
                                </tr>
                                <!-- Row 4: Firmado (Status Monolith) -->
                                <tr class="group hover:bg-surface-container-low transition-colors duration-200">
                                    <td class="py-5 px-6 font-medium text-primary-container">EXP-2023-0882</td>
                                    <td class="py-5 px-6 text-on-surface-variant pr-12 truncate max-w-md">Resolución de aprobación de tarifa preferencial temporal</td>
                                    <td class="py-5 px-6 text-secondary">10 Oct 2023</td>
                                    <td class="py-5 px-6">
                                        <span class="inline-flex items-center justify-center px-3 py-1 rounded-full bg-primary-fixed text-on-primary-fixed font-label text-xs font-bold uppercase tracking-wider">
                                            Firmado
                                        </span>
                                    </td>
                                    <td class="py-5 px-6 text-right">
                                        <button class="text-secondary hover:text-primary-container transition-colors p-1" title="Descargar PDF">
                                            <span class="material-symbols-outlined text-xl">download</span>
                                        </button>
                                    </td>
                                </tr>
                                <!-- Row 5: Firmado -->
                                <tr class="group hover:bg-surface-container-low transition-colors duration-200">
                                    <td class="py-5 px-6 font-medium text-primary-container">EXP-2023-0879</td>
                                    <td class="py-5 px-6 text-on-surface-variant pr-12 truncate max-w-md">Certificado de usuario de Zona Franca Comercial (Renovación anual)</td>
                                    <td class="py-5 px-6 text-secondary">09 Oct 2023</td>
                                    <td class="py-5 px-6">
                                        <span class="inline-flex items-center justify-center px-3 py-1 rounded-full bg-primary-fixed text-on-primary-fixed font-label text-xs font-bold uppercase tracking-wider">
                                            Firmado
                                        </span>
                                    </td>
                                    <td class="py-5 px-6 text-right">
                                        <button class="text-secondary hover:text-primary-container transition-colors p-1" title="Descargar PDF">
                                            <span class="material-symbols-outlined text-xl">download</span>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- Pagination (Editorial styling) -->
                        <div class="px-6 py-4 flex items-center justify-between border-t border-surface-container mt-2">
                            <span class="text-xs font-label text-secondary uppercase tracking-widest">Mostrando 1-5 de 142</span>
                            <div class="flex gap-1">
                                <button type="button" class="w-8 h-8 rounded flex items-center justify-center text-secondary hover:bg-surface-container-highest transition-colors disabled:opacity-30" disabled="">
                                    <span class="material-symbols-outlined text-sm">chevron_left</span>
                                </button>
                                <button type="button" class="w-8 h-8 rounded flex items-center justify-center text-on-primary bg-primary-container font-label text-xs">1</button>
                                <button type="button" class="w-8 h-8 rounded flex items-center justify-center text-secondary hover:bg-surface-container-highest transition-colors font-label text-xs">2</button>
                                <button type="button" class="w-8 h-8 rounded flex items-center justify-center text-secondary hover:bg-surface-container-highest transition-colors font-label text-xs">3</button>
                                <span class="w-8 h-8 flex items-center justify-center text-secondary text-xs">...</span>
                                <button type="button" class="w-8 h-8 rounded flex items-center justify-center text-secondary hover:bg-surface-container-highest transition-colors">
                                    <span class="material-symbols-outlined text-sm">chevron_right</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </form>
</body>
</html>