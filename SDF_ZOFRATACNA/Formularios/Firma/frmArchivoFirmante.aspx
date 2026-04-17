<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmArchivoFirmante.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Firma.frmArchivoFirmante" %>
<!DOCTYPE html>

<html lang="es">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Archivo del Firmante - SDF ZOFRATACNA</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&amp;family=Public+Sans:wght@500;600;700&amp;display=swap" rel="stylesheet"/>
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
        body { background-color: #f2f4f6; }
    </style>
</head>
<body class="bg-background text-on-surface antialiased flex min-h-screen">
    <form id="form1" runat="server" class="flex w-full min-h-screen">
        <!-- SideNavBar -->
        <nav class="fixed left-0 top-0 h-screen w-72 border-r border-transparent bg-slate-100 dark:bg-slate-900 flex flex-col p-4 z-40">
            <div class="mb-8 px-4 pt-4">
                <div class="flex items-center gap-3">
                    <div class="w-10 h-10 bg-primary rounded-lg flex items-center justify-center text-on-primary">
                        <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">account_balance</span>
                    </div>
                    <div>
                        <h1 class="text-xl font-bold text-[#001e40] dark:text-white leading-none">SDF ZOFRATACNA</h1>
                        <span class="text-xs font-normal text-slate-500 mt-1 block">Arquitectura de Confianza</span>
                    </div>
                </div>
            </div>
            <div class="flex-1 space-y-1">
                <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200" href="~/Formularios/Firma/frmDashboardFirmante.aspx">
                    <span class="material-symbols-outlined text-lg">dashboard</span>
                    <span class="font-body text-sm">Dashboard</span>
                </a>
                <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200" href="~/Formularios/Firma/frmMisDocumentosFirmante.aspx">
                    <span class="material-symbols-outlined text-lg">description</span>
                    <span class="font-body text-sm">Mis Documentos</span>
                </a>
                <a class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-300 dark:text-slate-600 cursor-not-allowed opacity-50">
                    <span class="material-symbols-outlined text-lg">add_box</span>
                    <span class="font-body text-sm">Registrar Nuevo</span>
                </a>
                <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-lg text-[#001e40] dark:text-white font-bold bg-white dark:bg-slate-800 shadow-sm" href="~/Formularios/Firma/frmArchivoFirmante.aspx">
                    <span class="material-symbols-outlined text-lg" style="font-variation-settings: 'FILL' 1;">archive</span>
                    <span class="font-body text-sm">Archivo</span>
                </a>
                <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200" href="~/Formularios/Comunes/frmMiPerfil.aspx">
                    <span class="material-symbols-outlined text-lg">settings</span>
                    <span class="font-body text-sm">Ajustes</span>
                </a>
                <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200" href="~/Formularios/Comunes/frmSoporte.aspx">
                    <span class="material-symbols-outlined text-lg">contact_support</span>
                    <span class="font-body text-sm">Soporte</span>
                </a>
            </div>
            <div class="mt-auto pt-4 border-t border-slate-200/50">
                <div class="flex items-center gap-3 px-2">
                    <asp:Image ID="imgPerfil" runat="server" CssClass="w-9 h-9 rounded-full bg-slate-200 object-cover border border-white" ImageUrl="https://lh3.googleusercontent.com/aida-public/AB6AXuBap8glsuLmp8Cg61i-FhLJUDG7TSMZRJKasvvni7DvLW4rDlcdVvhu-r_mr_CAHCQzVsMSi-xgObCdFB28E_uLnTaI8N-E85FhIRb8v22qnCMZz57-PuK5DDjUA-hl_WJPe-pIiYoSqYhfT11VS4AinKTbYxBfaYSdgPdJLuNvxiKOgHq9zfd_KAYO9RB1xT7SlLmXsjaLR7LEAIHWNcU4kg0FlktG1Grs_EFQDA-tMXGvGVLLeCNmNKcnX6ZkdGOYkcmsJnyRTdfM" />
                    <div class="flex flex-col">
                        <asp:Label ID="lblNombreUsuario" runat="server" CssClass="text-sm font-semibold text-primary" Text="Carlos M."></asp:Label>
                        <asp:Label ID="lblRolUsuario" runat="server" CssClass="text-xs text-slate-500" Text="Gerente General"></asp:Label>
                    </div>
                </div>
            </div>
        </nav>

        <!-- TopNavBar -->
        <header class="fixed top-0 right-0 w-[calc(100%-18rem)] h-16 z-50 bg-white/85 dark:bg-slate-950/85 backdrop-blur-md border-b border-slate-200/50 dark:border-slate-800/50 shadow-sm dark:shadow-none flex items-center justify-between px-8 transition-all font-inter text-sm">
            <div class="flex items-center flex-1 max-w-md">
                <div class="relative w-full group">
                    <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-slate-400">search</span>
                    <asp:TextBox ID="txtBuscar" runat="server" CssClass="w-full bg-slate-100/50 border-none rounded-full py-2 pl-10 pr-4 text-sm focus:ring-2 focus:ring-primary/20 focus:bg-white transition-all outline-none text-slate-600" placeholder="Buscar en archivo..."></asp:TextBox>
                </div>
            </div>
            <div class="flex items-center gap-6">
                <button type="button" class="p-2 rounded-full text-slate-600 hover:bg-slate-100 hover:text-[#003366] transition-all">
                    <span class="material-symbols-outlined">notifications</span>
                </button>
                <button type="button" class="p-2 rounded-full text-slate-600 hover:bg-slate-100 hover:text-[#003366] transition-all">
                    <span class="material-symbols-outlined">help_outline</span>
                </button>
                <div class="h-6 w-px bg-slate-200 mx-2"></div>
                <asp:LinkButton ID="btnLogout" runat="server" CssClass="flex items-center gap-2 text-slate-600 hover:text-error transition-colors font-medium" OnClick="btnLogout_Click">
                    <span class="material-symbols-outlined text-[1.1rem]">logout</span>
                    Cerrar Sesión
                </asp:LinkButton>
            </div>
        </header>

        <!-- Main Content -->
        <main class="flex-1 ml-72 pt-24 px-10 pb-16">
            <div class="max-w-[1200px] mx-auto">
                <div class="mb-10">
                    <h2 class="text-4xl font-headline font-semibold text-primary tracking-tight mb-2">Archivo del Firmante</h2>
                    <p class="text-on-surface-variant font-body leading-relaxed max-w-2xl text-lg">
                        Repositorio personal asegurado. Acceda y descargue los documentos que han completado el ciclo de firma digital exitosamente.
                    </p>
                </div>

                <!-- Metric Cards -->
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-10">
                    <div class="bg-surface-container-lowest rounded-xl p-6 relative overflow-hidden flex flex-col justify-between min-h-[160px]">
                        <div class="flex items-start justify-between">
                            <span class="material-symbols-outlined text-primary-container text-3xl">task</span>
                        </div>
                        <div>
                            <p class="text-sm font-label text-on-surface-variant mb-1">Total Firmados</p>
                            <asp:Label ID="lblTotalFirmados" runat="server" CssClass="text-4xl font-headline font-semibold text-primary" Text="1,248"></asp:Label>
                        </div>
                    </div>
                    <div class="bg-surface-container-lowest rounded-xl p-6 relative overflow-hidden flex flex-col justify-between min-h-[160px]">
                        <div class="flex items-start justify-between">
                            <span class="material-symbols-outlined text-secondary text-3xl">calendar_month</span>
                        </div>
                        <div>
                            <p class="text-sm font-label text-on-surface-variant mb-1">Firmados este Mes</p>
                            <asp:Label ID="lblFirmadosMes" runat="server" CssClass="text-4xl font-headline font-semibold text-primary" Text="42"></asp:Label>
                        </div>
                    </div>
                    <div class="rounded-xl overflow-hidden relative min-h-[160px] group">
                        <div class="absolute inset-0 bg-primary/80 z-10 mix-blend-multiply"></div>
                        <img alt="Documentos" class="absolute inset-0 w-full h-full object-cover z-0" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCVEhd2Vpd1Y9esLagTsi-YyzaouNUEK1KD0QY-UnldDA0v-mr34p8xxuLnslUuUdmJP6SeFTKewePGGqrKvUhicg6uhlweR9KfQALDKdNENFKFxt7z3Aqw4xa1ohemyuWW1ZheH4lyadOMIp1STAVesY8jBCCdqjPl4sGQyb9VvizFn7gXoMrxEFAiOvYb5LiCG_YIZOWFgZpFbOCzAbGmCD0SssbqM25xG50kBFnD-vQ-i5IZmfeRbUGFNl4twbJVxFdRBzZNGN3O"/>
                        <div class="relative z-20 p-6 h-full flex flex-col justify-end">
                            <span class="material-symbols-outlined text-white/80 mb-2">verified_user</span>
                            <p class="text-white font-headline font-semibold text-lg">Integridad legal garantizada</p>
                        </div>
                    </div>
                </div>

                <!-- Data Table -->
                <div class="bg-surface-container-lowest rounded-xl pt-6 pb-2 px-6">
                    <div class="flex items-center justify-between mb-6">
                        <h3 class="font-headline font-semibold text-xl text-primary">Historial de Documentos</h3>
                        <asp:LinkButton ID="btnFiltrar" runat="server" CssClass="text-primary text-sm font-medium hover:text-primary-container transition-colors flex items-center gap-1" OnClick="btnFiltrar_Click">
                            Filtrar <span class="material-symbols-outlined text-[18px]">filter_list</span>
                        </asp:LinkButton>
                    </div>
                    <div class="overflow-x-auto">
                        <asp:GridView ID="gvDocumentos" runat="server" AutoGenerateColumns="False" CssClass="w-full text-left border-collapse" OnRowCommand="gvDocumentos_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="CodigoReferencia" HeaderText="Código Ref." HeaderStyle-CssClass="pb-4 font-label text-xs uppercase text-outline tracking-wider font-medium w-1/4" ItemStyle-CssClass="py-4 font-medium text-primary-container pl-2" />
                                <asp:BoundField DataField="TituloDocumento" HeaderText="Título del Documento" HeaderStyle-CssClass="pb-4 font-label text-xs uppercase text-outline tracking-wider font-medium w-2/5" ItemStyle-CssClass="py-4 pr-4" />
                                <asp:BoundField DataField="FechaFirma" HeaderText="Fecha de Firma" HeaderStyle-CssClass="pb-4 font-label text-xs uppercase text-outline tracking-wider font-medium w-1/6" ItemStyle-CssClass="py-4 text-on-surface-variant" />
                                <asp:TemplateField HeaderText="Estado" HeaderStyle-CssClass="pb-4 font-label text-xs uppercase text-outline tracking-wider font-medium w-1/6 text-center" ItemStyle-CssClass="py-4 text-center">
                                    <ItemTemplate>
                                        <span class="inline-flex items-center justify-center px-3 py-1 rounded-full text-xs font-semibold bg-gradient-to-r from-primary-fixed to-primary-fixed-dim text-on-primary-fixed-variant">Firmado</span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Acción" HeaderStyle-CssClass="pb-4 font-label text-xs uppercase text-outline tracking-wider font-medium text-right w-24" ItemStyle-CssClass="py-4 text-right pr-2">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnDescargar" runat="server" CommandName="Descargar" CommandArgument='<%# Eval("IdDocumento") %>' CssClass="bg-secondary-container text-on-secondary-container hover:bg-secondary-fixed-dim rounded-full w-9 h-9 inline-flex items-center justify-center transition-colors" ToolTip="Descargar PDF">
                                            <span class="material-symbols-outlined text-[20px]">download</span>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="flex items-center justify-between py-6 mt-4 border-t border-outline-variant/30">
                        <asp:Label ID="lblPaginacionInfo" runat="server" CssClass="text-sm text-on-surface-variant" Text="Mostrando 1 a 4 de 1,248 registros"></asp:Label>
                        <div class="flex gap-2">
                            <asp:LinkButton ID="btnAnterior" runat="server" CssClass="p-2 rounded-lg text-outline hover:bg-surface-container hover:text-primary transition-colors" OnClick="btnAnterior_Click">
                                <span class="material-symbols-outlined text-xl">chevron_left</span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnSiguiente" runat="server" CssClass="p-2 rounded-lg text-outline hover:bg-surface-container hover:text-primary transition-colors" OnClick="btnSiguiente_Click">
                                <span class="material-symbols-outlined text-xl">chevron_right</span>
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </form>
</body>
</html>