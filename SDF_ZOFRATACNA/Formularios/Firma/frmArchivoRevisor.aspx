<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmArchivoRevisor.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Revision.frmArchivoRevisor" %>
<!DOCTYPE html>

<html class="light" lang="es">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>SDF ZOFRATACNA - Archivo</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@400;500;700;900&amp;display=swap" rel="stylesheet"/>
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
        body { font-family: 'Public Sans', sans-serif; background-color: #faf9fc; }
        .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24; }
    </style>
</head>
<body class="bg-surface text-on-surface antialiased flex h-screen overflow-hidden">
    <form id="form1" runat="server" class="flex w-full h-screen overflow-hidden">
        <!-- SideNavBar -->
        <nav class="h-screen w-72 fixed left-0 top-0 border-r-0 bg-white shadow-[8px_0_24px_rgba(0,30,64,0.04)] z-50">
            <div class="flex flex-col h-full py-8">
                <div class="px-6 mb-10">
                    <div class="flex items-center gap-4">
                        <div class="w-10 h-10 bg-primary-container rounded-lg flex items-center justify-center text-white">
                            <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">account_balance</span>
                        </div>
                        <div>
                            <h1 class="text-lg font-black tracking-tighter text-[#001E40] uppercase">SDF ZOFRATACNA</h1>
                            <p class="font-public-sans tracking-tight text-sm font-medium text-slate-500">Sistema de Firmado Digital</p>
                        </div>
                    </div>
                </div>
                <div class="flex flex-col gap-2 flex-grow">
                    <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 hover:bg-slate-50 transition-colors hover:bg-slate-100 transition-all duration-200" href="~/Formularios/Revision/frmDashboardRevisor.aspx">
                        <span class="material-symbols-outlined text-xl">dashboard</span>
                        <span class="font-public-sans tracking-tight text-sm font-medium">Dashboard</span>
                    </a>
                    <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 hover:bg-slate-50 transition-colors hover:bg-slate-100 transition-all duration-200" href="~/Formularios/Revision/frmMisDocumentosRevisor.aspx">
                        <span class="material-symbols-outlined text-xl">description</span>
                        <span class="font-public-sans tracking-tight text-sm font-medium">Mis Documentos</span>
                    </a>
                    <a class="flex items-center gap-3 px-6 py-4 text-slate-300 cursor-not-allowed opacity-50">
                        <span class="material-symbols-outlined text-xl">add_box</span>
                        <span class="font-public-sans tracking-tight text-sm font-medium">Registrar Nuevo</span>
                    </a>
                    <a runat="server" class="flex items-center gap-3 px-6 py-4 text-[#001E40] bg-slate-100 font-bold border-r-4 border-[#001E40] hover:bg-slate-100 transition-all duration-200" href="~/Formularios/Revision/frmArchivoRevisor.aspx">
                        <span class="material-symbols-outlined text-xl" style="font-variation-settings: 'FILL' 1;">archive</span>
                        <span class="font-public-sans tracking-tight text-sm font-medium">Archivo</span>
                    </a>
                    <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 hover:bg-slate-50 transition-colors hover:bg-slate-100 transition-all duration-200" href="~/Formularios/Comunes/frmMiPerfil.aspx">
                        <span class="material-symbols-outlined text-xl">settings</span>
                        <span class="font-public-sans tracking-tight text-sm font-medium">Ajustes</span>
                    </a>
                    <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 hover:bg-slate-50 transition-colors hover:bg-slate-100 transition-all duration-200" href="~/Formularios/Comunes/frmSoporte.aspx">
                        <span class="material-symbols-outlined text-xl">support_agent</span>
                        <span class="font-public-sans tracking-tight text-sm font-medium">Soporte</span>
                    </a>
                </div>
                <div class="mt-auto px-6 pt-8 border-t border-slate-100">
                    <div class="flex items-center gap-3">
                        <asp:Image ID="imgPerfil" runat="server" CssClass="rounded-full w-8 h-8 object-cover" ImageUrl="https://lh3.googleusercontent.com/aida-public/AB6AXuANPhjev2yZp9wji6ZSi1rOteuSPDdwY8iTN3MfFmcADEMkS3bJCNoYBM2A38u1XxX7roH4aGBZEqT1sss88hDivT_p_vojxh4JXFDr6cbGeeTKujJDZ8J34ZLRtGRA7BUPaQY5cbbVnW3cWzMO_ddYS8HiUGg2XJC7QXGvVRY0rTk_FZfFAZhjQy17QETsUa2h2E18IeJq_W9Lei4QCOGqE8_ZVRITloGFKc5yL6VeH37LDFNsPwcS3HGSj8b6Lxj8AS9Pd1_rn1az" />
                        <div class="flex flex-col">
                            <asp:Label ID="lblNombreUsuario" runat="server" CssClass="font-public-sans tracking-tight text-sm font-bold text-[#001E40]" Text="Juan Pérez"></asp:Label>
                            <asp:Label ID="lblRolUsuario" runat="server" CssClass="font-public-sans tracking-tight text-xs font-medium text-slate-500" Text="Revisor"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Main Content Area -->
        <div class="flex-1 ml-72 flex flex-col h-screen relative bg-surface">
            <!-- TopNavBar -->
            <header class="fixed top-0 right-0 left-72 h-16 z-40 bg-white/80 backdrop-blur-xl shadow-sm">
                <div class="flex items-center justify-between px-10 h-full w-full">
                    <div class="hidden text-lg font-black tracking-tighter text-[#001E40] uppercase">SDF ZOFRATACNA</div>
                    <nav class="flex gap-6 items-center">
                        <div class="hidden">
                            <a class="font-public-sans text-sm tracking-wide text-[#001E40] font-bold border-b-2 border-[#001E40] pb-1 transition-all duration-300 ease-in-out" href="#">Dashboard</a>
                        </div>
                    </nav>
                    <div class="flex items-center gap-6">
                        <asp:LinkButton ID="btnLogout" runat="server" CssClass="font-public-sans text-sm tracking-wide text-slate-400 hover:text-[#001E40] transition-colors hover:text-[#001E40] flex items-center gap-2" OnClick="btnLogout_Click">
                            <span class="material-symbols-outlined text-[20px]">logout</span>
                            Cerrar Sesión
                        </asp:LinkButton>
                        <asp:Image ID="imgAvatar" runat="server" CssClass="w-8 h-8 rounded-full border border-slate-200" ImageUrl="https://lh3.googleusercontent.com/aida-public/AB6AXuCfazcoUlV_PfsR9_2hzkKRP2gn98pAr5f_KO2abpFsnk9cwfhSMNFCaZ08-vlMHZTmroMpq3C3TUEij1F4wNOZnMgKLIsu-Bjwu1Xa9qC8ejPO-lrdsw2-5phIS3yimVek-EMBNfIUm2OYTDgLTqplPoaRR7d6vVaCPl3vcqjhbxWquVVSP0LmWOlyHxCjwljWx-VgEyHQ-p9_4ZgCjIrPBjJtbwfOsqoR9MNq2M399rogmJJce_59HbQx4tubohdw18jB15kDdHmt" />
                    </div>
                </div>
            </header>

            <!-- Canvas -->
            <main class="flex-1 mt-16 p-10 overflow-y-auto">
                <div class="max-w-6xl mx-auto">
                    <!-- Header Section -->
                    <div class="mb-12 flex justify-between items-end">
                        <div>
                            <h2 class="text-[32px] font-headline font-bold text-primary-container tracking-[-0.02em] leading-tight mb-2">Histórico de Revisiones</h2>
                            <p class="text-body text-lg text-secondary">Registro histórico de dictámenes emitidos.</p>
                        </div>
                        <div class="flex gap-4">
                            <div class="relative">
                                <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-outline text-[20px]">search</span>
                                <asp:TextBox ID="txtBuscar" runat="server" CssClass="pl-10 pr-4 py-2 bg-surface-container-high border-b-2 border-outline-variant focus:border-outline focus:outline-none rounded-t-sm w-64 text-sm font-label text-on-surface transition-colors" placeholder="Buscar documento..."></asp:TextBox>
                            </div>
                            <asp:LinkButton ID="btnFiltrar" runat="server" CssClass="flex items-center justify-center w-10 h-10 bg-surface-container-lowest border border-outline-variant/20 rounded-DEFAULT text-primary-container hover:bg-surface-container-low transition-colors shadow-[0_4px_12px_rgba(0,30,64,0.03)]" OnClick="btnFiltrar_Click">
                                <span class="material-symbols-outlined text-[20px]">filter_list</span>
                            </asp:LinkButton>
                        </div>
                    </div>

                    <!-- Stats Bento -->
                    <div class="grid grid-cols-3 gap-6 mb-12">
                        <div class="bg-surface-container-lowest rounded-lg p-6 shadow-[0_8px_24px_rgba(0,30,64,0.03)] border border-outline-variant/20 relative overflow-hidden group">
                            <div class="absolute -right-6 -top-6 w-24 h-24 bg-surface-container-low rounded-full opacity-50 group-hover:scale-110 transition-transform duration-500"></div>
                            <span class="material-symbols-outlined text-outline mb-4 text-[28px]">library_books</span>
                            <asp:Label ID="lblTotalRevisados" runat="server" CssClass="text-[36px] font-headline font-bold text-primary-container tracking-[-0.02em] leading-none mb-1" Text="1,248"></asp:Label>
                            <div class="text-sm font-label uppercase tracking-[0.05em] text-secondary">Total Revisados</div>
                        </div>
                        <div class="bg-surface-container-lowest rounded-lg p-6 shadow-[0_8px_24px_rgba(0,30,64,0.03)] border border-outline-variant/20 relative overflow-hidden group">
                            <div class="absolute -right-6 -top-6 w-24 h-24 bg-surface-container-low rounded-full opacity-50 group-hover:scale-110 transition-transform duration-500"></div>
                            <span class="material-symbols-outlined text-outline mb-4 text-[28px]">check_circle</span>
                            <asp:Label ID="lblAprobados" runat="server" CssClass="text-[36px] font-headline font-bold text-primary-container tracking-[-0.02em] leading-none mb-1" Text="1,102"></asp:Label>
                            <div class="text-sm font-label uppercase tracking-[0.05em] text-secondary">Aprobados</div>
                        </div>
                        <div class="bg-surface-container-lowest rounded-lg p-6 shadow-[0_8px_24px_rgba(0,30,64,0.03)] border border-outline-variant/20 relative overflow-hidden group">
                            <div class="absolute -right-6 -top-6 w-24 h-24 bg-surface-container-low rounded-full opacity-50 group-hover:scale-110 transition-transform duration-500"></div>
                            <span class="material-symbols-outlined text-outline mb-4 text-[28px]">cancel</span>
                            <asp:Label ID="lblObservados" runat="server" CssClass="text-[36px] font-headline font-bold text-primary-container tracking-[-0.02em] leading-none mb-1" Text="146"></asp:Label>
                            <div class="text-sm font-label uppercase tracking-[0.05em] text-secondary">Observados / Rechazados</div>
                        </div>
                    </div>

                    <!-- Main Data Container -->
                    <div class="bg-surface-container-lowest rounded-lg shadow-[0_8px_24px_rgba(0,30,64,0.04)] border border-outline-variant/20">
                        <!-- Table Header -->
                        <div class="grid grid-cols-[1fr_2fr_1.5fr_1fr_1fr] gap-4 px-6 py-4 border-b border-surface-container-low bg-surface-container-low/50 rounded-t-lg">
                            <div class="text-xs font-label uppercase tracking-[0.05em] text-secondary">ID Documento</div>
                            <div class="text-xs font-label uppercase tracking-[0.05em] text-secondary">Asunto / Título</div>
                            <div class="text-xs font-label uppercase tracking-[0.05em] text-secondary">Solicitante</div>
                            <div class="text-xs font-label uppercase tracking-[0.05em] text-secondary">Fecha Revisión</div>
                            <div class="text-xs font-label uppercase tracking-[0.05em] text-secondary text-right">Dictamen Final</div>
                        </div>

                        <!-- List Items -->
                        <div class="flex flex-col">
                            <div class="grid grid-cols-[1fr_2fr_1.5fr_1fr_1fr] gap-4 px-6 py-5 items-center hover:bg-surface-container-low/30 transition-colors group">
                                <div class="text-sm font-body font-medium text-primary-container">EXP-2023-0892</div>
                                <div>
                                    <div class="text-sm font-body text-on-surface font-medium truncate mb-0.5">Solicitud de Inspección Aduanera Módulo C</div>
                                    <div class="text-xs font-body text-secondary truncate">Ref: INSP-23-441-A</div>
                                </div>
                                <div class="text-sm font-body text-secondary">Logística del Sur S.A.C.</div>
                                <div class="text-sm font-body text-secondary">12 Oct 2023<br/><span class="text-xs text-outline">14:30 hrs</span></div>
                                <div class="flex justify-end">
                                    <span class="inline-flex items-center px-2.5 py-1 rounded-full bg-primary-fixed text-on-primary-fixed text-xs font-label uppercase tracking-[0.05em] font-bold">Aprobado</span>
                                </div>
                            </div>

                            <div class="grid grid-cols-[1fr_2fr_1.5fr_1fr_1fr] gap-4 px-6 py-5 items-center hover:bg-surface-container-low/30 transition-colors group border-t border-surface-container-lowest">
                                <div class="text-sm font-body font-medium text-primary-container">RES-2023-1104</div>
                                <div>
                                    <div class="text-sm font-body text-on-surface font-medium truncate mb-0.5">Resolución Directoral de Tarifas 2024</div>
                                    <div class="text-xs font-body text-secondary truncate">Área de Finanzas</div>
                                </div>
                                <div class="text-sm font-body text-secondary">Dirección Ejecutiva</div>
                                <div class="text-sm font-body text-secondary">10 Oct 2023<br/><span class="text-xs text-outline">09:15 hrs</span></div>
                                <div class="flex justify-end">
                                    <span class="inline-flex items-center px-2.5 py-1 rounded-full bg-surface-container-highest text-on-surface-variant text-xs font-label uppercase tracking-[0.05em] font-bold">Observado</span>
                                </div>
                            </div>

                            <div class="grid grid-cols-[1fr_2fr_1.5fr_1fr_1fr] gap-4 px-6 py-5 items-center hover:bg-surface-container-low/30 transition-colors group border-t border-surface-container-lowest">
                                <div class="text-sm font-body font-medium text-primary-container">INF-2023-0442</div>
                                <div>
                                    <div class="text-sm font-body text-on-surface font-medium truncate mb-0.5">Informe de Mantenimiento Perimetral Sector Norte</div>
                                    <div class="text-xs font-body text-secondary truncate">Mantenimiento e Infraestructura</div>
                                </div>
                                <div class="text-sm font-body text-secondary">Ing. Carlos Mendoza</div>
                                <div class="text-sm font-body text-secondary">08 Oct 2023<br/><span class="text-xs text-outline">16:45 hrs</span></div>
                                <div class="flex justify-end">
                                    <span class="inline-flex items-center px-2.5 py-1 rounded-full bg-primary-fixed text-on-primary-fixed text-xs font-label uppercase tracking-[0.05em] font-bold">Aprobado</span>
                                </div>
                            </div>

                            <div class="grid grid-cols-[1fr_2fr_1.5fr_1fr_1fr] gap-4 px-6 py-5 items-center hover:bg-surface-container-low/30 transition-colors group border-t border-surface-container-lowest">
                                <div class="text-sm font-body font-medium text-primary-container">MEM-2023-0991</div>
                                <div>
                                    <div class="text-sm font-body text-on-surface font-medium truncate mb-0.5">Memorándum Múltiple - Actualización de Políticas</div>
                                    <div class="text-xs font-body text-secondary truncate">Recursos Humanos</div>
                                </div>
                                <div class="text-sm font-body text-secondary">Gerencia General</div>
                                <div class="text-sm font-body text-secondary">05 Oct 2023<br/><span class="text-xs text-outline">11:20 hrs</span></div>
                                <div class="flex justify-end">
                                    <span class="inline-flex items-center px-2.5 py-1 rounded-full bg-error-container text-on-error-container text-xs font-label uppercase tracking-[0.05em] font-bold">Rechazado</span>
                                </div>
                            </div>
                        </div>

                        <!-- Pagination -->
                        <div class="px-6 py-4 flex items-center justify-between border-t border-surface-container-low bg-surface-bright rounded-b-lg">
                            <asp:Label ID="lblPaginacionInfo" runat="server" CssClass="text-sm font-label text-secondary" Text="Mostrando 1 - 4 de 1,248"></asp:Label>
                            <div class="flex items-center gap-2">
                                <asp:LinkButton ID="btnAnterior" runat="server" CssClass="w-8 h-8 flex items-center justify-center rounded-sm text-outline hover:bg-surface-container-low transition-colors" OnClick="btnAnterior_Click">
                                    <span class="material-symbols-outlined text-[20px]">chevron_left</span>
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnPagina1" runat="server" CssClass="w-8 h-8 flex items-center justify-center rounded-sm bg-primary-container text-on-primary font-label text-sm font-bold" OnClick="btnPagina_Click" CommandArgument="1">1</asp:LinkButton>
                                <asp:LinkButton ID="btnPagina2" runat="server" CssClass="w-8 h-8 flex items-center justify-center rounded-sm text-on-surface hover:bg-surface-container-low transition-colors font-label text-sm" OnClick="btnPagina_Click" CommandArgument="2">2</asp:LinkButton>
                                <asp:LinkButton ID="btnPagina3" runat="server" CssClass="w-8 h-8 flex items-center justify-center rounded-sm text-on-surface hover:bg-surface-container-low transition-colors font-label text-sm" OnClick="btnPagina_Click" CommandArgument="3">3</asp:LinkButton>
                                <span class="text-outline mx-1">...</span>
                                <asp:LinkButton ID="btnSiguiente" runat="server" CssClass="w-8 h-8 flex items-center justify-center rounded-sm text-outline hover:bg-surface-container-low transition-colors" OnClick="btnSiguiente_Click">
                                    <span class="material-symbols-outlined text-[20px]">chevron_right</span>
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </form>
</body>
</html>