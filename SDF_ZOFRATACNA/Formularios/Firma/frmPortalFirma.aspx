<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmPortalFirma.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Firma.frmPortalFirma" %>
<!DOCTYPE html>

<html lang="es">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Portal de Firma - ZOFRATACNA</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&amp;family=Public+Sans:wght@500;600;700&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
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
                        "primary-fixed-dim": "#a7c8ff"
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
        body { background-color: #f8f9fb; }
    </style>
</head>
<body class="bg-surface text-on-surface font-body h-screen flex overflow-hidden">
    <form id="form1" runat="server" class="flex w-full h-screen overflow-hidden">
        <!-- SideNavBar (simplificada) -->
        <aside class="fixed left-0 top-0 h-screen w-72 border-r border-transparent bg-slate-100 flex flex-col p-4 z-40">
            <div class="mb-8 px-4 pt-4">
                <div class="flex items-center gap-3">
                    <div class="w-10 h-10 bg-primary rounded-lg flex items-center justify-center text-white">
                        <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">account_balance</span>
                    </div>
                    <div>
                        <h1 class="text-xl font-bold text-[#001e40]">SDF ZOFRATACNA</h1>
                        <span class="text-xs font-normal text-slate-500">Arquitectura de Confianza</span>
                    </div>
                </div>
            </div>
            <nav class="flex-1 space-y-1">
                <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 hover:text-[#003366] hover:bg-slate-200/50 transition-colors" href="~/Formularios/Firma/frmDashboardFirmante.aspx">
                    <span class="material-symbols-outlined">dashboard</span>
                    <span>Dashboard</span>
                </a>
                <a runat="server" class="flex items-center gap-3 px-4 py-3 text-[#001e40] font-bold bg-white rounded-lg shadow-sm" href="~/Formularios/Firma/frmMisDocumentosFirmante.aspx">
                    <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">description</span>
                    <span>Mis Documentos</span>
                </a>
                <a class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-300 cursor-not-allowed opacity-50">
                    <span class="material-symbols-outlined">add_box</span>
                    <span>Registrar Nuevo</span>
                </a>
                <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 hover:text-[#003366] hover:bg-slate-200/50 transition-colors" href="~/Formularios/Firma/frmArchivoFirmante.aspx">
                    <span class="material-symbols-outlined">archive</span>
                    <span>Archivo</span>
                </a>
            </nav>
            <div class="mt-auto pt-4 border-t border-slate-200/50">
                <div class="flex items-center gap-3 px-2">
                    <asp:Image ID="imgPerfil" runat="server" CssClass="w-9 h-9 rounded-full" ImageUrl="https://lh3.googleusercontent.com/aida-public/AB6AXuBap8glsuLmp8Cg61i-FhLJUDG7TSMZRJKasvvni7DvLW4rDlcdVvhu-r_mr_CAHCQzVsMSi-xgObCdFB28E_uLnTaI8N-E85FhIRb8v22qnCMZz57-PuK5DDjUA-hl_WJPe-pIiYoSqYhfT11VS4AinKTbYxBfaYSdgPdJLuNvxiKOgHq9zfd_KAYO9RB1xT7SlLmXsjaLR7LEAIHWNcU4kg0FlktG1Grs_EFQDA-tMXGvGVLLeCNmNKcnX6ZkdGOYkcmsJnyRTdfM" />
                    <asp:Label ID="lblNombreUsuario" runat="server" CssClass="text-sm font-semibold text-primary" Text="Carlos M."></asp:Label>
                </div>
            </div>
        </aside>

        <!-- TopNavBar -->
        <header class="fixed top-0 right-0 w-[calc(100%-18rem)] h-16 z-50 bg-white/85 backdrop-blur-md border-b border-slate-200/50 shadow-sm flex items-center justify-between px-8">
            <div class="flex items-center flex-1 max-w-md">
                <div class="relative w-full">
                    <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-slate-400">search</span>
                    <asp:TextBox ID="txtBuscar" runat="server" CssClass="w-full bg-slate-100/50 border-none rounded-full py-2 pl-10 pr-4 text-sm focus:ring-2 focus:ring-primary/20 focus:bg-white transition-all" placeholder="Buscar..."></asp:TextBox>
                </div>
            </div>
            <div class="flex items-center gap-6">
                <asp:LinkButton ID="btnLogout" runat="server" CssClass="flex items-center gap-2 text-slate-600 hover:text-error transition-colors" OnClick="btnLogout_Click">
                    <span class="material-symbols-outlined">logout</span>
                    Cerrar Sesión
                </asp:LinkButton>
            </div>
        </header>

        <!-- Main Content -->
        <main class="flex-1 ml-72 pt-24 px-8 pb-16 overflow-y-auto">
            <div class="max-w-[1200px] mx-auto">
                <div class="mb-6">
                    <div class="flex items-center gap-4 flex-wrap">
                        <asp:Label ID="lblTituloDocumento" runat="server" CssClass="text-2xl font-headline font-semibold text-primary" Text="Resolución Directoral N° 045-2023-ZOFRATACNA"></asp:Label>
                        <asp:Label ID="lblEstadoBadge" runat="server" CssClass="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-tertiary-fixed text-on-tertiary-fixed-variant">
                            <span class="w-1.5 h-1.5 rounded-full bg-on-tertiary-fixed-variant mr-2"></span>
                            Pendiente
                        </asp:Label>
                    </div>
                </div>

                <div class="grid grid-cols-1 lg:grid-cols-12 gap-6">
                    <!-- PDF Viewer -->
                    <div class="lg:col-span-8">
                        <div class="bg-white rounded-xl shadow-sm border border-outline-variant/30 p-8 min-h-[600px]">
                            <div class="text-center text-slate-400 py-20">
                                <span class="material-symbols-outlined text-6xl">picture_as_pdf</span>
                                <p class="mt-4">Vista previa del documento PDF</p>
                                <p class="text-sm">(Integración con visor PDF pendiente)</p>
                            </div>
                        </div>
                    </div>

                    <!-- Actions -->
                    <div class="lg:col-span-4">
                        <div class="bg-surface-container-lowest rounded-xl p-6 shadow-sm border border-outline-variant/20 sticky top-24">
                            <h2 class="font-headline font-semibold text-lg text-primary mb-4">Acción Requerida</h2>
                            <div class="bg-surface-container-low rounded-lg p-4 mb-6">
                                <div class="flex items-center justify-between">
                                    <span class="text-sm font-medium">Motor de Firma</span>
                                    <span class="text-xs font-semibold px-2 py-0.5 bg-primary-fixed rounded">ReFirma</span>
                                </div>
                            </div>
                            <asp:LinkButton ID="btnFirmar" runat="server" CssClass="w-full bg-gradient-to-r from-primary to-primary-container text-white py-3 rounded-lg font-semibold flex justify-center items-center gap-2 hover:opacity-95 transition-opacity mb-4" OnClick="btnFirmar_Click">
                                <span class="material-symbols-outlined">draw</span>
                                Firmar Documento
                            </asp:LinkButton>
                            <div class="flex gap-3">
                                <asp:LinkButton ID="btnDescargarPDF" runat="server" CssClass="flex-1 py-2 rounded-lg border border-outline-variant/50 text-sm font-medium text-primary hover:bg-surface-container transition-colors text-center" OnClick="btnDescargarPDF_Click">
                                    Descargar PDF
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnObservar" runat="server" CssClass="flex-1 py-2 rounded-lg text-sm font-medium text-error hover:bg-error-container/50 transition-colors text-center" OnClick="btnObservar_Click">
                                    Observar
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