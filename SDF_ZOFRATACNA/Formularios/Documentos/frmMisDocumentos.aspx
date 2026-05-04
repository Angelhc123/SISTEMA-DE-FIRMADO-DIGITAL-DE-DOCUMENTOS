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
        body {
            font-family: 'Public Sans', sans-serif;
            background-color: #faf9fc;
        }
        .modal-overlay { background-color: rgba(0, 5, 17, 0.5); backdrop-filter: blur(4px); }
    </style>
</head>
<body class="bg-surface text-on-surface antialiased overflow-hidden selection:bg-primary-container selection:text-white">
    <form id="form1" runat="server" class="flex h-screen w-full">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <!-- App Layout Container -->
        <div class="flex h-screen w-full">
            <!-- SIDENAVBAR COMPONENT -->
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
                    <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-l-xl group" href="~/Formularios/Documentos/frmDashboardRegistrador.aspx">
                        <span class="material-symbols-outlined group-hover:text-primary-container transition-colors">dashboard</span>
                        <span>Dashboard</span>
                    </a>
                    <a runat="server" class="flex items-center gap-3 px-6 py-4 text-[#001E40] dark:text-white bg-slate-100 dark:bg-[#001E40]/20 font-bold border-r-4 border-[#001E40] rounded-l-xl Active: translate-x-1 duration-150 relative group overflow-hidden" href="~/Formularios/Documentos/frmMisDocumentos.aspx">
                        <div class="absolute inset-0 bg-gradient-to-r from-transparent to-slate-200/50 opacity-0 group-hover:opacity-100 transition-opacity"></div>
                        <span class="material-symbols-outlined fill" style="font-variation-settings: 'FILL' 1;">description</span>
                        <span class="relative z-10">Mis Documentos</span>
                    </a>
                    <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-l-xl group" href="~/Formularios/Documentos/frmRegistrarDocumento.aspx">
                        <span class="material-symbols-outlined group-hover:text-primary-container transition-colors">add_box</span>
                        <span>Registrar Nuevo</span>
                    </a>
                    <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-l-xl group" href="~/Formularios/Documentos/frmArchivoRegistrador.aspx">
                        <span class="material-symbols-outlined group-hover:text-primary-container transition-colors">archive</span>
                        <span>Archivo</span>
                    </a>
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
            <!-- Main Content Wrapper -->
            <main class="ml-72 flex-1 flex flex-col h-screen relative bg-surface">
                <!-- TOPNAVBAR COMPONENT -->
                <header class="bg-white/80 dark:bg-slate-950/80 backdrop-blur-xl fixed top-0 right-0 left-72 h-16 z-40 shadow-sm dark:shadow-none flex items-center justify-between px-10 transition-all duration-300 ease-in-out border-b border-surface-container/50">
                    <nav class="font-public-sans text-sm tracking-wide text-[#001E40] dark:text-[#d5e3ff] flex items-center gap-4">
                        <span class="text-slate-400">Inicio</span>
                        <span class="material-symbols-outlined text-sm text-slate-300">chevron_right</span>
                        <span class="text-[#001E40] font-bold border-b-2 border-[#001E40] pb-1 translate-y-[2px]">Mis Documentos</span>
                    </nav>
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
                <!-- PAGE CONTENT CANVAS -->
                <div class="flex-1 overflow-y-auto pt-24 px-12 pb-12">
                    <div class="mb-10 flex justify-between items-end">
                        <div>
                            <h2 class="font-headline text-3xl font-extrabold tracking-tight text-primary-container">Bandeja de Entrada</h2>
                            <p class="font-body text-secondary mt-2 text-base">Gestión y revisión de expedientes documentales.</p>
                        </div>
                        <div class="relative w-72">
                            <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-secondary text-lg">search</span>
                            <asp:TextBox ID="txtBuscar" runat="server" CssClass="w-full bg-surface-container-high border-0 border-b-2 border-outline-variant focus:border-primary-container focus:ring-0 pl-10 pr-4 py-2 text-sm font-body text-on-surface rounded-t-sm transition-colors" placeholder="Buscar por ID o Asunto..." AutoPostBack="true" OnTextChanged="txtBuscar_TextChanged"></asp:TextBox>
                        </div>
                    </div>

                    <asp:UpdatePanel ID="upBandeja" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <!-- Filters Strip -->
                            <div class="flex gap-2 mb-8 border-b border-surface-container-high pb-4">
                                <asp:LinkButton ID="btnFiltroTodos" runat="server" OnClick="FiltrarBandeja" CommandArgument="TODOS" CssClass="px-5 py-2 rounded-full bg-primary-container text-on-primary font-label text-sm font-semibold tracking-wide uppercase transition-all shadow-[0_4px_12px_rgba(0,30,64,0.15)]">Todos</asp:LinkButton>
                                <asp:LinkButton ID="btnFiltroPendientes" runat="server" OnClick="FiltrarBandeja" CommandArgument="PENDIENTES" CssClass="px-5 py-2 rounded-full bg-surface text-secondary hover:bg-surface-container hover:text-on-surface font-label text-sm font-medium tracking-wide uppercase transition-colors">Pendientes</asp:LinkButton>
                                <asp:LinkButton ID="btnFiltroObservados" runat="server" OnClick="FiltrarBandeja" CommandArgument="OBSERVADOS" CssClass="px-5 py-2 rounded-full bg-surface text-secondary hover:bg-surface-container hover:text-on-surface font-label text-sm font-medium tracking-wide uppercase transition-colors">Observados</asp:LinkButton>
                                <asp:LinkButton ID="btnFiltroFirmados" runat="server" OnClick="FiltrarBandeja" CommandArgument="FIRMADOS" CssClass="px-5 py-2 rounded-full bg-surface text-secondary hover:bg-surface-container hover:text-on-surface font-label text-sm font-medium tracking-wide uppercase transition-colors">Firmados</asp:LinkButton>
                            </div>

                            <!-- Data Table -->
                            <div class="bg-surface-container-lowest rounded-lg p-2 shadow-[0_8px_32px_rgba(0,30,64,0.04)] relative">
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
                                        <asp:Repeater ID="rptDocumentos" runat="server" OnItemCommand="rptDocumentos_ItemCommand">
                                            <ItemTemplate>
                                                <tr class="group hover:bg-surface-container-low transition-colors duration-200">
                                                    <td class="py-5 px-6 font-medium text-primary-container"><%# Eval("CodigoDocumento") %></td>
                                                    <td class="py-5 px-6 text-on-surface-variant pr-12 truncate max-w-md"><%# Eval("Asunto") %></td>
                                                    <td class="py-5 px-6 text-secondary"><%# Convert.ToDateTime(Eval("FechaCreacion")).ToString("dd MMM yyyy") %></td>
                                                    <td class="py-5 px-6">
                                                        <span class='<%# ObtenerClaseEstado(Eval("CodigoEstado").ToString()) %>'>
                                                            <%# ObtenerNombreEstado(Eval("CodigoEstado").ToString()) %>
                                                        </span>
                                                    </td>
                                                    <td class="py-5 px-6 text-right">
                                                        <asp:LinkButton ID="btnAccion" runat="server" CommandName='<%# (Eval("CodigoEstado").ToString() == "OBS") ? "VerObservaciones" : "VerDocumento" %>' CommandArgument='<%# Eval("IDDocumento") %>' CssClass="text-secondary hover:text-primary-container transition-colors p-1" ToolTip='<%# (Eval("CodigoEstado").ToString() == "OBS") ? "Ver Observaciones" : "Ver" %>'>
                                                            <span class="material-symbols-outlined text-xl"><%# (Eval("CodigoEstado").ToString() == "FIRM_COM" || Eval("CodigoEstado").ToString() == "FPAR") ? "download" : "visibility" %></span>
                                                        </asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:PlaceHolder ID="phSinDatos" runat="server" Visible="false">
                                            <tr>
                                                <td colspan="5" class="py-8 text-center text-secondary font-medium">No se encontraron documentos para el filtro seleccionado.</td>
                                            </tr>
                                        </asp:PlaceHolder>
                                    </tbody>
                                </table>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </main>
        </div>

        <!-- MODAL OBSERVACIONES -->
        <asp:UpdatePanel ID="upModal" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div id="modalObservaciones" runat="server" visible="false" class="fixed inset-0 z-[100] flex items-center justify-center modal-overlay p-4">
                    <div class="bg-surface rounded-xl shadow-2xl w-full max-w-5xl h-[85vh] flex flex-col overflow-hidden animate-in fade-in zoom-in-95 duration-200">
                        <!-- Modal Header -->
                        <div class="px-6 py-4 border-b border-surface-container-high flex justify-between items-center bg-white">
                            <div>
                                <h3 class="text-xl font-bold text-primary-container font-headline">Observaciones del Documento</h3>
                                <p class="text-sm text-secondary font-body mt-1">Revisa los comentarios y sube una versión corregida.</p>
                            </div>
                            <asp:LinkButton ID="btnCerrarModal" runat="server" OnClick="btnCerrarModal_Click" CssClass="text-secondary hover:text-error transition-colors">
                                <span class="material-symbols-outlined">close</span>
                            </asp:LinkButton>
                        </div>
                        
                        <!-- Modal Body (Two columns) -->
                        <div class="flex-1 flex overflow-hidden">
                            <!-- Left: PDF Viewer -->
                            <div class="w-1/2 bg-surface-container-low border-r border-surface-container-high p-4 flex flex-col">
                                <h4 class="font-bold text-sm text-on-surface mb-2 uppercase tracking-wider font-label">Documento Actual</h4>
                                <iframe id="iframePDF" runat="server" class="w-full flex-1 rounded border border-outline-variant/30" src=""></iframe>
                            </div>
                            
                            <!-- Right: Observations & Upload -->
                            <div class="w-1/2 p-6 flex flex-col bg-white overflow-y-auto">
                                <h4 class="font-bold text-sm text-on-surface mb-4 uppercase tracking-wider font-label flex items-center gap-2">
                                    <span class="material-symbols-outlined text-error">warning</span>
                                    Listado de Observaciones
                                </h4>
                                
                                <div class="space-y-4 mb-8 flex-1 overflow-y-auto pr-2">
                                    <asp:Repeater ID="rptListaObservaciones" runat="server">
                                        <ItemTemplate>
                                            <div class="bg-error-container/30 border border-error-container rounded-lg p-4">
                                                <div class="flex justify-between items-start mb-2">
                                                    <span class="font-bold text-sm text-on-error-container"><%# Eval("NombreRevisor") %></span>
                                                    <span class="text-xs text-secondary"><%# Convert.ToDateTime(Eval("FechaCreacion")).ToString("dd/MM/yyyy HH:mm") %></span>
                                                </div>
                                                <p class="text-sm text-on-surface-variant leading-relaxed">
                                                    <%# Eval("Descripcion") %>
                                                </p>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                
                                <!-- Upload Section -->
                                <div class="bg-surface-container-low rounded-lg p-5 border border-surface-container">
                                    <h4 class="font-bold text-sm text-primary-container mb-3 font-label">Subir Corrección</h4>
                                    <p class="text-xs text-secondary mb-4">Selecciona el nuevo archivo PDF. Esto actualizará la versión y reiniciará el flujo de revisión.</p>
                                    <asp:HiddenField ID="hdnIdDocumentoObser" runat="server" />
                                    <asp:FileUpload ID="fuCorreccion" runat="server" CssClass="block w-full text-sm text-secondary file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-primary-container file:text-on-primary hover:file:bg-primary transition-colors cursor-pointer mb-4" accept="application/pdf" />
                                    <asp:Label ID="lblErrorUpload" runat="server" CssClass="text-error text-xs block mb-2 font-medium" Visible="false"></asp:Label>
                                    
                                    <div class="flex justify-end gap-3">
                                        <asp:Button ID="btnCancelarCorreccion" runat="server" Text="Cancelar" OnClick="btnCerrarModal_Click" CssClass="px-4 py-2 rounded-lg text-sm font-bold text-secondary bg-surface-container-high hover:bg-surface-container-highest transition-colors cursor-pointer" />
                                        
                                        <!-- PostBackTrigger needed for FileUpload inside UpdatePanel -->
                                        <asp:Button ID="btnSubirCorreccion" runat="server" Text="Guardar y Enviar a Revisión" OnClick="btnSubirCorreccion_Click" CssClass="px-4 py-2 rounded-lg text-sm font-bold text-white bg-primary-container hover:bg-primary shadow-md transition-colors cursor-pointer" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSubirCorreccion" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>