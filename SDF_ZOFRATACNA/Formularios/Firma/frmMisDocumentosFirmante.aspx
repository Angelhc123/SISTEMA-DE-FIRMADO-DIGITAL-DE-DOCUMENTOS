<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmMisDocumentosFirmante.aspx.cs"
    Inherits="SDF_ZOFRATACNA.Formularios.Firma.frmMisDocumentosFirmante" %>
<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>SDF ZOFRATACNA - Bandeja de Firma</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@400;600;700;800;900&family=Inter:wght@400;500;600&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet" />
    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary":                    "#001e40",
                        "primary-container":          "#003366",
                        "surface":                    "#f8f9fb",
                        "surface-container-low":      "#f2f4f6",
                        "surface-container":          "#eceef0",
                        "surface-container-high":     "#e6e8ea",
                        "surface-container-highest":  "#e0e3e5",
                        "surface-container-lowest":   "#ffffff",
                        "on-surface":                 "#191c1e",
                        "on-surface-variant":         "#43474f",
                        "outline":                    "#737780",
                        "outline-variant":            "#c3c6d1",
                        "error":                      "#ba1a1a",
                        "error-container":            "#ffdad6",
                        "tertiary":                   "#381300",
                        "tertiary-fixed":             "#ffdbca",
                        "on-tertiary-fixed-variant":  "#723610",
                        "primary-fixed":              "#d5e3ff",
                        "on-primary":                 "#ffffff",
                        "secondary-container":        "#cbe7f5",
                        "on-secondary-container":     "#4e6874"
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

        /* Modal */
        .modal-overlay { display: none; position: fixed; inset: 0; background: rgba(0,0,0,0.4); backdrop-filter: blur(4px); z-index: 1000; align-items: center; justify-content: center; }
        .modal-overlay.active { display: flex; }
        #pdfFrame { border: none; width: 100%; height: 100%; min-height: 500px; border-radius: 12px; }

        /* Scrollbar */
        .custom-scrollbar::-webkit-scrollbar { width: 6px; }
        .custom-scrollbar::-webkit-scrollbar-track { background: transparent; }
        .custom-scrollbar::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: 10px; }

        /* Disabled firmar btn */
        .btn-firmar-disabled { opacity: 0.45; cursor: not-allowed; pointer-events: none; }
    </style>
</head>
<body class="bg-surface text-on-surface antialiased flex h-screen overflow-hidden">
    <form id="form1" runat="server" class="flex w-full h-screen overflow-hidden">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <!-- ═══════════════════════════════════════════════════════ SIDEBAR ══ -->
        <nav class="bg-white fixed left-0 top-0 h-screen w-72 border-r border-outline-variant/20 z-40 shadow-[4px_0_20px_rgba(0,30,64,0.03)]">
            <div class="flex flex-col h-full">
                <!-- Logo -->
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

                <!-- Nav links -->
                <div class="flex-1 px-3 space-y-1">
                    <p class="px-3 text-[10px] font-bold text-outline uppercase tracking-wider mt-2 mb-2">Principal</p>

                    <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-low transition-all duration-200" href="~/Formularios/Firma/frmDashboardFirmante.aspx">
                        <span class="material-symbols-outlined">dashboard</span>
                        <span>Dashboard</span>
                    </a>

                    <!-- Activo -->
                    <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-primary bg-primary-fixed/30 font-semibold" href="~/Formularios/Firma/frmMisDocumentosFirmante.aspx">
                        <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">draw</span>
                        <span>Por Firmar</span>
                        <asp:Label ID="lblBadgeFirmar" runat="server" CssClass="ml-auto bg-error-container text-error text-xs font-bold px-2 py-0.5 rounded-full" Text="0"></asp:Label>
                    </a>

                    <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-low transition-all duration-200" href="~/Formularios/Firma/frmMisDocumentosRevisor.aspx">
                        <span class="material-symbols-outlined">rate_review</span>
                        <span>Por Revisar</span>
                    </a>

                    <div class="h-px bg-outline-variant/30 my-4 mx-2"></div>
                    <p class="px-3 text-[10px] font-bold text-outline uppercase tracking-wider mt-2 mb-2">Archivos</p>

                    <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-low transition-all duration-200" href="~/Formularios/Firma/frmArchivoFirmante.aspx">
                        <span class="material-symbols-outlined">checklist</span>
                        <span>Documentos Firmados</span>
                    </a>
                    <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-low transition-all duration-200" href="~/Formularios/Firma/frmArchivoRevisor.aspx">
                        <span class="material-symbols-outlined">history</span>
                        <span>Historial de Revisiones</span>
                    </a>
                </div>

                <!-- User footer -->
                <div class="mt-auto p-4 border-t border-outline-variant/20">
                    <div class="flex items-center gap-3">
                        <asp:Image ID="imgPerfilSidebar" runat="server" CssClass="w-10 h-10 rounded-full object-cover border-2 border-white shadow-sm" ImageUrl="https://ui-avatars.com/api/?background=001e40&color=fff&name=Firmante" />
                        <div class="flex-1 overflow-hidden">
                            <asp:Label ID="lblNombreSidebar" runat="server" CssClass="text-sm font-semibold text-primary block truncate" Text="Firmante"></asp:Label>
                            <span class="text-[10px] text-on-surface-variant uppercase font-bold">Firmante</span>
                        </div>
                        <asp:LinkButton ID="btnLogout" runat="server" CssClass="text-outline hover:text-error transition-colors" OnClick="btnLogout_Click">
                            <span class="material-symbols-outlined">logout</span>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </nav>

        <!-- ═══════════════════════════════════════════════════ MAIN CONTENT ══ -->
        <div class="flex-1 flex flex-col md:ml-72 relative w-full h-screen overflow-hidden">

            <!-- Header sticky -->
            <header class="bg-surface/80 backdrop-blur-md sticky top-0 z-30 px-8 py-6">
                <div class="max-w-[1400px] mx-auto">
                    <div class="flex flex-col md:flex-row md:items-end justify-between gap-4">
                        <div>
                            <h2 class="text-4xl font-headline font-black text-primary">Bandeja de Firma</h2>
                            <p class="text-on-surface-variant font-body text-base mt-1">Documentos pendientes de su rúbrica digital.</p>
                        </div>
                        <div class="flex items-center gap-3">
                            <div class="relative max-w-xs">
                                <span class="material-symbols-outlined absolute left-3 top-1/2 transform -translate-y-1/2 text-outline text-lg">search</span>
                                <asp:TextBox ID="txtBuscar" runat="server" AutoPostBack="true" OnTextChanged="txtBuscar_TextChanged"
                                    CssClass="w-full bg-white border border-outline-variant/40 rounded-xl py-2.5 pl-10 pr-4 text-sm font-body focus:ring-2 focus:ring-primary/10 transition-all shadow-sm"
                                    placeholder="Buscar por remitente o asunto..."></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <!-- Stats Cards -->
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mt-10">
                        <!-- Pendientes -->
                        <div class="bg-surface-container-lowest rounded-2xl p-6 border border-outline-variant/20 shadow-sm">
                            <h3 class="text-xs font-bold text-outline uppercase tracking-widest mb-3">Pendientes de Firma</h3>
                            <div class="flex items-end justify-between">
                                <span class="text-4xl font-headline font-black text-error">
                                    <asp:Label ID="lblPorFirmar" runat="server" Text="0"></asp:Label>
                                </span>
                                <div class="w-12 h-12 bg-error/5 rounded-xl flex items-center justify-center text-error">
                                    <span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">priority_high</span>
                                </div>
                            </div>
                        </div>
                        <!-- Mi turno -->
                        <div class="bg-surface-container-lowest rounded-2xl p-6 border border-outline-variant/20 shadow-sm">
                            <h3 class="text-xs font-bold text-outline uppercase tracking-widest mb-3">Listo para Firmar (Mi Turno)</h3>
                            <div class="flex items-end justify-between">
                                <span class="text-4xl font-headline font-black text-primary">
                                    <asp:Label ID="lblMiTurno" runat="server" Text="0"></asp:Label>
                                </span>
                                <div class="w-12 h-12 bg-primary/5 rounded-xl flex items-center justify-center text-primary">
                                    <span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">how_to_reg</span>
                                </div>
                            </div>
                        </div>
                        <!-- Firmados hoy -->
                        <div class="bg-white rounded-2xl p-6 border-l-4 border-primary shadow-sm">
                            <h3 class="text-xs font-bold text-outline uppercase tracking-widest mb-3">Firmados Hoy</h3>
                            <div class="flex items-end justify-between">
                                <span class="text-4xl font-headline font-black text-on-surface">
                                    <asp:Label ID="lblFirmadosHoy" runat="server" Text="0"></asp:Label>
                                </span>
                                <div class="w-12 h-12 bg-surface-container-low rounded-xl flex items-center justify-center text-outline">
                                    <span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">verified</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <!-- Content -->
            <main class="flex-1 overflow-y-auto px-8 pb-12 custom-scrollbar">
                <div class="max-w-[1400px] mx-auto">

                    <!-- Mensaje -->
                    <asp:Panel ID="pnlMensaje" runat="server" Visible="false" CssClass="mb-6">
                        <div class="bg-error-container/30 border border-error/20 rounded-2xl p-4 flex items-center gap-3 text-error">
                            <span class="material-symbols-outlined">warning</span>
                            <asp:Label ID="lblMensaje" runat="server" CssClass="text-sm font-semibold"></asp:Label>
                        </div>
                    </asp:Panel>

                    <!-- Sin documentos -->
                    <asp:Panel ID="pnlSinDocumentos" runat="server" Visible="false">
                        <div class="bg-white rounded-3xl p-20 flex flex-col items-center text-center shadow-sm border border-outline-variant/20">
                            <div class="w-24 h-24 bg-surface-container-low rounded-full flex items-center justify-center mb-6 text-outline/40">
                                <span class="material-symbols-outlined text-[48px]">inventory_2</span>
                            </div>
                            <h3 class="text-2xl font-headline font-bold text-primary mb-2">Todo en orden</h3>
                            <p class="text-on-surface-variant font-body max-w-sm">No tienes documentos pendientes de firma en este momento.</p>
                        </div>
                    </asp:Panel>

                    <!-- Tabla de documentos -->
                    <asp:Panel ID="pnlTabla" runat="server" Visible="false">
                        <!-- Cabecera columnas -->
                        <div class="grid grid-cols-12 gap-4 px-6 mb-4 text-[11px] font-black text-outline uppercase tracking-[0.2em]">
                            <div class="col-span-3">Remitente / Área</div>
                            <div class="col-span-4">Asunto / Referencia</div>
                            <div class="col-span-2">Ingreso</div>
                            <div class="col-span-1 text-center">Turno</div>
                            <div class="col-span-2 text-right">Acciones</div>
                        </div>

                        <div class="space-y-3">
                            <asp:Repeater ID="rptDocumentos" runat="server">
                                <ItemTemplate>
                                    <div class="bg-white rounded-2xl p-5 border border-outline-variant/10 shadow-[0_2px_15px_-3px_rgba(0,30,64,0.04)] hover:shadow-lg hover:border-primary/20 transition-all duration-300 group flex items-center gap-6 relative overflow-hidden">
                                        <!-- Indicador lateral de turno -->
                                        <div class='absolute left-0 top-0 bottom-0 w-1 transition-colors <%# Convert.ToBoolean(Eval("EsMiTurno")) ? "bg-primary" : "bg-outline-variant/30 group-hover:bg-outline-variant" %>'></div>

                                        <!-- Remitente / Área -->
                                        <div class="col-span-3 flex items-center gap-4 flex-1 min-w-0">
                                            <div class="w-12 h-12 rounded-full bg-primary/5 flex items-center justify-center text-primary font-bold text-sm shrink-0 border border-primary/10">
                                                <%# Eval("AreaResponsable").ToString().Length > 0 ? Eval("AreaResponsable").ToString().Substring(0,1).ToUpper() : "?" %>
                                            </div>
                                            <div class="truncate">
                                                <h4 class="font-bold text-on-surface text-sm"><%# Eval("IDUsuarioCreador") %></h4>
                                                <p class="text-xs text-on-surface-variant mt-0.5 uppercase font-medium tracking-tight"><%# Eval("AreaResponsable") %></p>
                                            </div>
                                        </div>

                                        <!-- Asunto -->
                                        <div class="col-span-4 flex-[2] min-w-0">
                                            <h4 class="font-bold text-primary text-sm group-hover:text-primary-container transition-colors truncate"><%# Eval("Asunto") %></h4>
                                            <p class="text-xs text-on-surface-variant mt-1 font-mono tracking-tighter">REF: <%# Eval("CodigoDocumento") %></p>
                                        </div>

                                        <!-- Fecha -->
                                        <div class="col-span-2 shrink-0 text-right md:text-left">
                                            <h4 class="font-semibold text-on-surface text-xs"><%# Eval("FechaCreacionDoc", "{0:dd MMM, hh:mm tt}") %></h4>
                                            <p class="text-[10px] text-on-surface-variant mt-1 uppercase font-bold tracking-tighter">Orden: <%# Eval("Orden") %></p>
                                        </div>

                                        <!-- Badge turno -->
                                        <div class="col-span-1 shrink-0 flex justify-center">
                                            <%# Convert.ToBoolean(Eval("EsMiTurno"))
                                                ? "<span class=\"bg-primary text-white text-[10px] font-black px-2.5 py-1 rounded-full\">Mi Turno</span>"
                                                : "<span class=\"bg-surface-container text-outline text-[10px] font-bold px-2.5 py-1 rounded-full\">En Espera</span>" %>
                                        </div>

                                        <!-- Acciones -->
                                        <div class="col-span-2 shrink-0 flex justify-end gap-2">
                                            <!-- Ver PDF: siempre habilitado -->
                                            <button type="button"
                                                onclick='abrirModal("<%# Eval("IDFirmante") %>", "<%# ResolveUrl(Eval("RutaArchivo").ToString()) %>", "<%# Eval("Asunto").ToString().Replace("\"","&quot;").Replace("'","\\'") %>", "<%# Eval("CodigoDocumento") %>", <%# Convert.ToBoolean(Eval("EsMiTurno")) ? "true" : "false" %>)'
                                                class="bg-surface-container text-primary px-4 py-2.5 rounded-xl text-xs font-black hover:bg-surface-container-high transition-all duration-200 flex items-center gap-1.5 border border-outline-variant/20">
                                                <span class="material-symbols-outlined text-[16px]">visibility</span> Ver
                                            </button>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </asp:Panel>

                </div>
            </main>
        </div>

        <!-- ═══════════════════════════════════════════════════════ MODAL PDF ══ -->
        <div id="modalFirmante" class="modal-overlay">
            <div class="bg-white w-[95%] max-w-7xl h-[92vh] rounded-[2.5rem] shadow-2xl flex flex-col border border-outline-variant/30 overflow-hidden">

                <!-- Modal Header -->
                <div class="px-10 py-6 border-b border-outline-variant/20 flex items-center justify-between bg-surface-container-lowest">
                    <div class="flex items-center gap-4">
                        <div class="w-12 h-12 bg-primary/5 rounded-2xl flex items-center justify-center text-primary">
                            <span class="material-symbols-outlined text-2xl">description</span>
                        </div>
                        <div>
                            <p id="modalCodigo" class="text-[11px] font-black text-outline uppercase tracking-[0.2em] mb-0.5">—</p>
                            <h3 id="modalAsunto" class="text-xl font-bold text-primary truncate max-w-2xl">—</h3>
                        </div>
                    </div>
                    <button type="button" onclick="cerrarModal()" class="w-12 h-12 rounded-full hover:bg-error/10 hover:text-error flex items-center justify-center transition-all text-outline">
                        <span class="material-symbols-outlined text-2xl">close</span>
                    </button>
                </div>

                <!-- Visor Area -->
                <div class="flex-1 bg-surface-container-low p-6 flex gap-6 overflow-hidden">

                    <!-- PDF Panel -->
                    <div class="flex-[3] bg-white rounded-3xl shadow-sm border border-outline-variant/20 overflow-hidden relative group">
                        <iframe id="pdfFrame" src=""></iframe>
                        <div class="absolute top-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity">
                            <a id="btnDescargar" href="#" target="_blank" class="bg-white/90 backdrop-blur shadow-md px-4 py-2 rounded-full text-xs font-bold text-primary hover:bg-primary hover:text-white transition-all flex items-center gap-2">
                                <span class="material-symbols-outlined text-sm">download</span> Descargar
                            </a>
                        </div>
                    </div>

                    <!-- Action Panel -->
                    <div class="flex-none w-80 flex flex-col bg-white rounded-3xl p-8 border border-outline-variant/20 shadow-sm">
                        <div class="flex-1">
                            <h3 class="text-lg font-bold text-primary mb-2">Firma Digital</h3>
                            <p class="text-xs text-on-surface-variant mb-8 leading-relaxed">
                                Revise el documento en el visor antes de proceder con su firma digital. El botón de firma solo estará disponible cuando sea su turno en el orden establecido.
                            </p>

                            <!-- Indicador de turno -->
                            <div id="panelMiTurno" class="hidden bg-primary/5 rounded-2xl p-4 flex items-start gap-3 border border-primary/10 mb-4">
                                <span class="material-symbols-outlined text-primary text-xl" style="font-variation-settings: 'FILL' 1;">how_to_reg</span>
                                <p class="text-xs text-primary/80 leading-relaxed font-semibold">
                                    Es su turno. Puede firmar este documento.
                                </p>
                            </div>
                            <div id="panelEspera" class="hidden bg-surface-container rounded-2xl p-4 flex items-start gap-3 border border-outline-variant/20 mb-4">
                                <span class="material-symbols-outlined text-outline text-xl">hourglass_top</span>
                                <p class="text-xs text-on-surface-variant leading-relaxed font-medium">
                                    Aún no es su turno. Debe esperar que los firmantes anteriores completen su firma.
                                </p>
                            </div>
                        </div>

                        <!-- Botón único: Firmar -->
                        <div class="pt-4">
                            <asp:LinkButton ID="btnFirmarDesdeModal" runat="server" OnClick="btnFirmarDesdeModal_Click"
                                CssClass="w-full bg-primary text-white py-4 rounded-2xl text-sm font-black hover:bg-primary-container hover:shadow-xl hover:shadow-primary/30 transition-all flex items-center justify-center gap-2 active:scale-[0.98]">
                                <span class="material-symbols-outlined text-lg">draw</span> Firmar Documento
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Hidden fields para postback -->
        <asp:HiddenField ID="hfIDFirmante" runat="server" />

    </form>

    <script>
        /**
         * Abre el modal visor PDF.
         * @param {string|number} idFirmante
         * @param {string} urlPdf
         * @param {string} asunto
         * @param {string} codigo
         * @param {boolean} esMiTurno
         */
        function abrirModal(idFirmante, urlPdf, asunto, codigo, esMiTurno) {
            // Datos en campos ocultos
            document.getElementById('<%= hfIDFirmante.ClientID %>').value = idFirmante;

            // Cabecera del modal
            document.getElementById('modalAsunto').textContent = asunto;
            document.getElementById('modalCodigo').textContent = codigo;

            // PDF
            var iframe = document.getElementById('pdfFrame');
            if (iframe) iframe.src = urlPdf;
            var btnDesc = document.getElementById('btnDescargar');
            if (btnDesc) btnDesc.href = urlPdf;

            // Panel de turno
            document.getElementById('panelMiTurno').classList.toggle('hidden', !esMiTurno);
            document.getElementById('panelEspera').classList.toggle('hidden', esMiTurno);

            // Botón Firmar: habilitar/deshabilitar según turno
            var btnFirmar = document.getElementById('<%= btnFirmarDesdeModal.ClientID %>');
            if (btnFirmar) {
                if (esMiTurno) {
                    btnFirmar.classList.remove('btn-firmar-disabled');
                    btnFirmar.removeAttribute('disabled');
                } else {
                    btnFirmar.classList.add('btn-firmar-disabled');
                    btnFirmar.setAttribute('disabled', 'disabled');
                }
            }

            // Mostrar modal
            document.getElementById('modalFirmante').classList.add('active');
            document.body.style.overflow = 'hidden';
        }

        function cerrarModal() {
            document.getElementById('modalFirmante').classList.remove('active');
            document.body.style.overflow = 'auto';
            var iframe = document.getElementById('pdfFrame');
            if (iframe) iframe.src = '';
        }

        // Cerrar con Escape
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') cerrarModal();
        });
    </script>
</body>
</html>
