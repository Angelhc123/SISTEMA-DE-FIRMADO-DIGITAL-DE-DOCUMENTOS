<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmDirectorio.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Documentos.frmDirectorio" %>
<!DOCTYPE html>

<html class="light" lang="es">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>SDF ZOFRATACNA - Directorio</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@400;500;600;700;800;900&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
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
                        "headline": [
                            "Public Sans"
                        ],
                        "body": [
                            "Public Sans"
                        ],
                        "label": [
                            "Public Sans"
                        ]
                    }
                },
            },
        }
    </script>
</head>
<body class="bg-surface text-on-surface min-h-screen flex selection:bg-primary-container selection:text-white">
    <form id="form1" runat="server" class="flex w-full min-h-screen">
        <!-- TopNavBar Removed -->
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
                <!-- Dashboard (Inactive) -->
                <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-l-xl group" href="~/Formularios/Documentos/frmDashboardRegistrador.aspx">
                    <span class="material-symbols-outlined group-hover:text-primary-container transition-colors">dashboard</span>
                    <span>Dashboard</span>
                </a>
                <!-- Mis Documentos (Inactive) -->
                <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-l-xl group" href="~/Formularios/Documentos/frmMisDocumentos.aspx">
                    <span class="material-symbols-outlined group-hover:text-primary-container transition-colors">description</span>
                    <span>Mis Documentos</span>
                </a>
                <!-- Registrar Nuevo (Inactive) -->
                <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-l-xl group" href="~/Formularios/Documentos/frmRegistrarDocumento.aspx">
                    <span class="material-symbols-outlined group-hover:text-primary-container transition-colors">add_box</span>
                    <span>Registrar Nuevo</span>
                </a>
                <!-- Archivo (Inactive) -->
                <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-l-xl group" href="~/Formularios/Documentos/frmArchivoRegistrador.aspx">
                    <span class="material-symbols-outlined group-hover:text-primary-container transition-colors">archive</span>
                    <span>Archivo</span>
                </a>
                <!-- Separation Logic (Spacer) -->
                <div class="my-6 h-px bg-slate-50 dark:bg-slate-900/50 mx-6"></div>
                <!-- Directorio (Active) -->
                <a runat="server" class="flex items-center gap-3 px-6 py-4 text-[#001E40] dark:text-white bg-slate-100 dark:bg-[#001E40]/20 font-bold border-r-4 border-[#001E40] rounded-l-xl Active: translate-x-1 duration-150 relative group overflow-hidden" href="~/Formularios/Documentos/frmDirectorio.aspx">
                    <div class="absolute inset-0 bg-gradient-to-r from-transparent to-slate-200/50 opacity-0 group-hover:opacity-100 transition-opacity"></div>
                    <span class="material-symbols-outlined fill" style="font-variation-settings: 'FILL' 1;">contact_phone</span>
                    <span class="relative z-10">Directorio</span>
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

        <!-- Main Content Wrapper -->
        <div class="flex-1 ml-72 flex flex-col min-h-screen">
            <!-- TopNavBar -->
            <header class="fixed top-0 right-0 left-72 h-16 z-40 bg-white/80 backdrop-blur-xl shadow-sm">
                <div class="flex items-center justify-between px-10 h-full w-full">
                    <nav class="font-public-sans text-sm tracking-wide text-[#001E40] dark:text-[#d5e3ff] flex items-center gap-4">
                        <span class="text-slate-400">Inicio</span>
                        <span class="material-symbols-outlined text-sm text-slate-300">chevron_right</span>
                        <span class="text-[#001E40] font-bold border-b-2 border-[#001E40] pb-1 translate-y-[2px]">Directorio</span>
                    </nav>
                    <div class="flex items-center gap-6">
                        <asp:LinkButton ID="btnLogout" runat="server" CssClass="text-sm font-medium text-slate-500 hover:text-error transition-colors flex items-center gap-2 font-label uppercase tracking-wider" OnClick="btnLogout_Click">
                            <span>Cerrar Sesión</span>
                            <span class="material-symbols-outlined text-[18px]">logout</span>
                        </asp:LinkButton>
                    </div>
                </div>
            </header>
            <!-- Main Content Area -->
            <main class="ml-72 pt-16 min-h-screen px-10 py-12 flex flex-col gap-10">
                <!-- Header Section -->
                <header class="flex flex-col gap-2">
                    <h2 class="font-headline text-[32px] font-bold text-primary-container tracking-[-0.02em]">Directorio de Empleados</h2>
                    <p class="font-body text-base text-secondary max-w-2xl">Búsqueda y consulta de personal activo (VW_EmpleadosActivos).</p>
                </header>
                <!-- Filters & Actions (Minimalist Grid) -->
                <section class="bg-surface-container-low rounded-lg p-6 flex flex-col md:flex-row gap-6 items-end">
                    <div class="flex-1 w-full flex flex-col gap-2">
                        <label class="font-label text-xs uppercase tracking-[0.05em] text-on-surface-variant">Buscar por Nombre o Cargo</label>
                        <div class="relative w-full">
                            <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-outline">search</span>
                            <input class="w-full bg-surface-container-highest border-b-2 border-outline-variant focus:border-primary-container pl-10 pr-4 py-3 rounded-t-sm text-sm text-on-surface outline-none transition-colors" placeholder="Ej. Juan Pérez, Analista..." type="text"/>
                        </div>
                    </div>
                    <div class="w-full md:w-64 flex flex-col gap-2">
                        <label class="font-label text-xs uppercase tracking-[0.05em] text-on-surface-variant">Unidad Orgánica</label>
                        <div class="relative w-full">
                            <select class="w-full bg-surface-container-highest border-b-2 border-outline-variant focus:border-primary-container pl-4 pr-10 py-3 rounded-t-sm text-sm text-on-surface outline-none appearance-none transition-colors cursor-pointer">
                                <option value="">Todas las unidades</option>
                                <option value="ti">Tecnologías de la Información</option>
                                <option value="rh">Recursos Humanos</option>
                                <option value="fin">Finanzas</option>
                            </select>
                            <span class="material-symbols-outlined absolute right-3 top-1/2 -translate-y-1/2 text-outline pointer-events-none">arrow_drop_down</span>
                        </div>
                    </div>
                    <button type="button" class="bg-gradient-to-br from-primary to-primary-container text-on-primary font-label text-sm font-semibold rounded-md px-6 py-3 h-[46px] hover:opacity-90 transition-opacity">
                        Filtrar
                    </button>
                </section>
                <!-- Employee Directory Grid (Bento Style) -->
                <section class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                    <!-- Employee Card 1 -->
                    <div class="bg-surface-container-lowest rounded-lg p-6 flex flex-col items-center text-center relative overflow-hidden group shadow-[0_8px_24px_rgba(0,30,64,0.06)] ring-1 ring-outline-variant/20 hover:bg-surface-container-low transition-colors duration-300">
                        <div class="absolute top-4 right-4">
                            <div class="bg-primary-fixed text-on-primary-fixed font-label text-[10px] uppercase tracking-wider px-2 py-1 rounded-full font-bold">Activo</div>
                        </div>
                        <div class="w-24 h-24 rounded-full bg-surface-container-highest mb-4 overflow-hidden ring-4 ring-surface">
                            <img alt="Foto de empleado" class="w-full h-full object-cover" data-alt="Professional portrait of a middle-aged woman with glasses and dark hair, wearing a white blouse, smiling in a well-lit office" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAML6wLY2lkmFIlMWuYxsmWpr-YQKNoGUioootGA-1pBbQZBQJHoRoaTQbVErcbFm83Y_Hgg6aT-7pgAvNou0Dq1B4DLaDnKLmEQTINw06zeAM5R8M_VLVXl_L1EuryzceHfVfNBI929TsFHK3DUVH3JSjjMHeDac8DoaptOW9o8CYZnJVOEKpi1A06eNmMP04W0ONhzl9SgTnCmC_Q7JzsXU-SbeHLXPg2-Z4NxFZ4rJXS0P9YQA0G5VJQtojXGhrxwR6I60RjoitR"/>
                        </div>
                        <h3 class="font-headline text-lg font-bold text-primary-container mb-1">María Rodríguez</h3>
                        <p class="font-body text-sm text-secondary mb-4">Jefe de Tecnologías de la Información</p>
                        <div class="w-full flex flex-col gap-3 mt-auto">
                            <div class="flex items-center gap-3 text-xs text-on-surface-variant bg-surface px-3 py-2 rounded-md">
                                <span class="material-symbols-outlined text-[16px]">domain</span>
                                <span class="truncate">Gerencia de TI</span>
                            </div>
                            <div class="flex items-center gap-3 text-xs text-on-surface-variant bg-surface px-3 py-2 rounded-md">
                                <span class="material-symbols-outlined text-[16px]">mail</span>
                                <a class="truncate hover:text-primary-container transition-colors" href="mailto:mrodriguez@zofratacna.com.pe">mrodriguez@zofratacna...</a>
                            </div>
                        </div>
                    </div>
                    <!-- Employee Card 2 -->
                    <div class="bg-surface-container-lowest rounded-lg p-6 flex flex-col items-center text-center relative overflow-hidden group shadow-[0_8px_24px_rgba(0,30,64,0.06)] ring-1 ring-outline-variant/20 hover:bg-surface-container-low transition-colors duration-300">
                        <div class="absolute top-4 right-4">
                            <div class="bg-primary-fixed text-on-primary-fixed font-label text-[10px] uppercase tracking-wider px-2 py-1 rounded-full font-bold">Activo</div>
                        </div>
                        <div class="w-24 h-24 rounded-full bg-surface-container-highest mb-4 overflow-hidden ring-4 ring-surface">
                            <img alt="Foto de empleado" class="w-full h-full object-cover" data-alt="Professional portrait of a young man with short dark hair and a light beard, wearing a navy blue blazer over a light shirt" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBHr9rLjiT56w7DJS0F82Zt_CnzhBu3JNy7GTsQQvnEeg5wLL1NQvGF_QcV7djqHXMgWT0FTq7IjyxtqgM2iI3uWHsuxg8zovS8agSUZPOt3j2z2SSjduFOd6gmDVHUwYm7dSqWcaqq4s69ciS4xGj_IXKeSwjmYQYi9rHySOaOw4V4YrGKoAoyDGV1LiQTCCXM7BQVArpjEMOh9L5mC6fG85hEbQR0tGqxVQHOU8coZzNk2nKcv1qiYb7fTFtk7AkdhAYj_9NS2Sie"/>
                        </div>
                        <h3 class="font-headline text-lg font-bold text-primary-container mb-1">Carlos Mendoza</h3>
                        <p class="font-body text-sm text-secondary mb-4">Analista de Sistemas Senior</p>
                        <div class="w-full flex flex-col gap-3 mt-auto">
                            <div class="flex items-center gap-3 text-xs text-on-surface-variant bg-surface px-3 py-2 rounded-md">
                                <span class="material-symbols-outlined text-[16px]">domain</span>
                                <span class="truncate">Gerencia de TI</span>
                            </div>
                            <div class="flex items-center gap-3 text-xs text-on-surface-variant bg-surface px-3 py-2 rounded-md">
                                <span class="material-symbols-outlined text-[16px]">mail</span>
                                <a class="truncate hover:text-primary-container transition-colors" href="mailto:cmendoza@zofratacna.com.pe">cmendoza@zofratacna...</a>
                            </div>
                        </div>
                    </div>
                    <!-- Employee Card 3 -->
                    <div class="bg-surface-container-lowest rounded-lg p-6 flex flex-col items-center text-center relative overflow-hidden group shadow-[0_8px_24px_rgba(0,30,64,0.06)] ring-1 ring-outline-variant/20 hover:bg-surface-container-low transition-colors duration-300">
                        <div class="absolute top-4 right-4">
                            <div class="bg-primary-fixed text-on-primary-fixed font-label text-[10px] uppercase tracking-wider px-2 py-1 rounded-full font-bold">Activo</div>
                        </div>
                        <div class="w-24 h-24 rounded-full bg-surface-container-highest mb-4 overflow-hidden ring-4 ring-surface">
                            <img alt="Foto de empleado" class="w-full h-full object-cover" data-alt="Professional portrait of a young woman with curly brown hair, wearing an olive green turtleneck sweater, smiling warmly" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBe8bxcJDPBFr1JO7nZIlhjL1glN4RaAs7Xrbuz3RUw72iEcV7htTRFqOR6h6wrwec1JF0mse6ULEEMNMyHystKcu1DPwYwuSBmb4wtRDu9PJYIE4gxcGalwvQzkn4wRBwurZctmfj_Lrtp46t1UzGpVnQmv3WKNqg0JYqserp25P-HsAMnYFJZgJeGttBBH1XX-9Q-rygW_447EktGYbYtIgAiAOaqp2UYYeZSBRkte_zy5_CTOF2tbY8aqK3d8CMXHzGYRB-Lxtbs"/>
                        </div>
                        <h3 class="font-headline text-lg font-bold text-primary-container mb-1">Ana Silva</h3>
                        <p class="font-body text-sm text-secondary mb-4">Especialista en Recursos Humanos</p>
                        <div class="w-full flex flex-col gap-3 mt-auto">
                            <div class="flex items-center gap-3 text-xs text-on-surface-variant bg-surface px-3 py-2 rounded-md">
                                <span class="material-symbols-outlined text-[16px]">domain</span>
                                <span class="truncate">Recursos Humanos</span>
                            </div>
                            <div class="flex items-center gap-3 text-xs text-on-surface-variant bg-surface px-3 py-2 rounded-md">
                                <span class="material-symbols-outlined text-[16px]">mail</span>
                                <a class="truncate hover:text-primary-container transition-colors" href="mailto:asilva@zofratacna.com.pe">asilva@zofratacna.com.pe</a>
                            </div>
                        </div>
                    </div>
                    <!-- Employee Card 4 -->
                    <div class="bg-surface-container-lowest rounded-lg p-6 flex flex-col items-center text-center relative overflow-hidden group shadow-[0_8px_24px_rgba(0,30,64,0.06)] ring-1 ring-outline-variant/20 hover:bg-surface-container-low transition-colors duration-300">
                        <div class="absolute top-4 right-4">
                            <div class="bg-primary-fixed text-on-primary-fixed font-label text-[10px] uppercase tracking-wider px-2 py-1 rounded-full font-bold">Activo</div>
                        </div>
                        <div class="w-24 h-24 rounded-full bg-surface-container-highest mb-4 flex items-center justify-center ring-4 ring-surface text-primary-container font-headline text-3xl font-bold bg-surface-container">
                            JP
                        </div>
                        <h3 class="font-headline text-lg font-bold text-primary-container mb-1">Jorge Paredes</h3>
                        <p class="font-body text-sm text-secondary mb-4">Asistente Administrativo</p>
                        <div class="w-full flex flex-col gap-3 mt-auto">
                            <div class="flex items-center gap-3 text-xs text-on-surface-variant bg-surface px-3 py-2 rounded-md">
                                <span class="material-symbols-outlined text-[16px]">domain</span>
                                <span class="truncate">Gerencia General</span>
                            </div>
                            <div class="flex items-center gap-3 text-xs text-on-surface-variant bg-surface px-3 py-2 rounded-md">
                                <span class="material-symbols-outlined text-[16px]">mail</span>
                                <a class="truncate hover:text-primary-container transition-colors" href="mailto:jparedes@zofratacna.com.pe">jparedes@zofratacna...</a>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </form>
</body>
</html>