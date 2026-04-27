<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmMisDocumentosRevisor.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Firma.frmMisDocumentosRevisor" %>
<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>SDF ZOFRATACNA - Bandeja de Revisión</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@400;600;700;800;900&family=Inter:wght@400;500;600&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
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
        .modal-overlay { display: none; position: fixed; inset: 0; background: rgba(0,0,0,0.4); backdrop-filter: blur(4px); z-index: 1000; align-items: center; justify-content: center; }
        .modal-overlay.active { display: flex; }
        #pdfFrame { border: none; width: 100%; height: 100%; min-height: 500px; border-radius: 12px; }
        .custom-scrollbar::-webkit-scrollbar { width: 6px; }
        .custom-scrollbar::-webkit-scrollbar-track { background: transparent; }
        .custom-scrollbar::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: 10px; }
    </style>
</head>
<body class="bg-surface text-on-surface antialiased flex h-screen overflow-hidden">
    <form id="form1" runat="server" class="flex w-full h-screen overflow-hidden">
        
        <!-- SideNavBar (Copiada exactamente de Dashboard) -->
        <nav class="bg-white fixed left-0 top-0 h-screen w-72 border-r border-outline-variant/20 z-40 shadow-[4px_0_20px_rgba(0,30,64,0.03)]">
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
                    <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-low transition-all duration-200" href="~/Formularios/Firma/frmDashboardFirmante.aspx">
                        <span class="material-symbols-outlined">dashboard</span>
                        <span>Dashboard</span>
                    </a>
                    <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-low transition-all duration-200" href="~/Formularios/Firma/frmMisDocumentosFirmante.aspx">
                        <span class="material-symbols-outlined">draw</span>
                        <span>Por Firmar</span>
                        <span class="ml-auto bg-error-container text-error text-xs font-bold px-2 py-0.5 rounded-full">4</span>
                    </a>
                    <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-primary bg-primary-fixed/30 font-semibold" href="~/Formularios/Firma/frmMisDocumentosRevisor.aspx">
                        <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">rate_review</span>
                        <span>Por Revisar</span>
                        <asp:Label ID="lblCountSidebar" runat="server" CssClass="ml-auto bg-tertiary-fixed text-tertiary text-xs font-bold px-2 py-0.5 rounded-full" Text="0"></asp:Label>
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
                
                <div class="mt-auto p-4 border-t border-outline-variant/20">
                    <div class="flex items-center gap-3">
                        <asp:Image ID="imgPerfil" runat="server" CssClass="w-10 h-10 rounded-full object-cover border-2 border-white shadow-sm" ImageUrl="https://ui-avatars.com/api/?background=001e40&color=fff&name=Usuario" />
                        <div class="flex-1 overflow-hidden">
                            <asp:Label ID="lblNombreUsuario" runat="server" CssClass="text-sm font-semibold text-primary block truncate" Text="Usuario"></asp:Label>
                            <asp:Label ID="lblRolUsuario" runat="server" CssClass="text-[10px] text-on-surface-variant uppercase font-bold" Text="Revisor"></asp:Label>
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
            
            <!-- Header (Basado en captura) -->
            <header class="bg-surface/80 backdrop-blur-md sticky top-0 z-30 px-8 py-6">
                <div class="max-w-[1400px] mx-auto">
                    <div class="flex flex-col md:flex-row md:items-end justify-between gap-4">
                        <div>
                            <h2 class="text-4xl font-headline font-black text-primary">Bandeja de Revisión</h2>
                            <p class="text-on-surface-variant font-body text-base mt-1">Documentos pendientes de evaluación y firma digital.</p>
                        </div>
                        <div class="flex items-center gap-3">
                            <div class="relative max-w-xs">
                                <span class="material-symbols-outlined absolute left-3 top-1/2 transform -translate-y-1/2 text-outline text-lg">search</span>
                                <asp:TextBox ID="txtBuscar" runat="server" AutoPostBack="true" OnTextChanged="txtBuscar_TextChanged" CssClass="w-full bg-white border border-outline-variant/40 rounded-xl py-2.5 pl-10 pr-4 text-sm font-body focus:ring-2 focus:ring-primary/10 transition-all shadow-sm" placeholder="Buscar por remitente o asunto..."></asp:TextBox>
                            </div>
                            <button type="button" class="bg-surface-container-high px-4 py-2.5 rounded-xl text-primary font-bold text-sm flex items-center gap-2 hover:bg-outline-variant/20 transition-all border border-outline-variant/30">
                                <span class="material-symbols-outlined text-lg">tune</span> Filtros
                            </button>
                        </div>
                    </div>

                    <!-- Summary Cards -->
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mt-10">
                        <div class="bg-surface-container-lowest rounded-2xl p-6 border border-outline-variant/20 shadow-sm">
                            <h3 class="text-xs font-bold text-outline uppercase tracking-widest mb-3">Cantidad Pendiente</h3>
                            <div class="flex items-end justify-between">
                                <span class="text-4xl font-headline font-black text-error">
                                    <asp:Label ID="lblCountTotal" runat="server" Text="0"></asp:Label>
                                </span>
                                <div class="w-12 h-12 bg-error/5 rounded-xl flex items-center justify-center text-error">
                                    <span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">priority_high</span>
                                </div>
                            </div>
                        </div>
                        <div class="bg-surface-container-lowest rounded-2xl p-6 border border-outline-variant/20 shadow-sm">
                            <h3 class="text-xs font-bold text-outline uppercase tracking-widest mb-3">Pendientes Hoy</h3>
                            <div class="flex items-end justify-between">
                                <span class="text-4xl font-headline font-black text-primary">
                                    <asp:Label ID="lblHoy" runat="server" Text="0"></asp:Label>
                                </span>
                                <div class="w-12 h-12 bg-primary/5 rounded-xl flex items-center justify-center text-primary">
                                    <span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">calendar_today</span>
                                </div>
                            </div>
                        </div>
                        <div class="bg-white rounded-2xl p-6 border-l-4 border-primary shadow-sm">
                            <h3 class="text-xs font-bold text-outline uppercase tracking-widest mb-3">Historial de Revisiones</h3>
                            <div class="flex items-end justify-between">
                                <span class="text-4xl font-headline font-black text-on-surface">
                                    <asp:Label ID="lblHistorial" runat="server" Text="0"></asp:Label>
                                </span>
                                <div class="w-12 h-12 bg-surface-container-low rounded-xl flex items-center justify-center text-outline">
                                    <span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">history</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <!-- Content Area -->
            <main class="flex-1 overflow-y-auto px-8 pb-12 custom-scrollbar">
                <div class="max-w-[1400px] mx-auto">
                    
                    <asp:Panel ID="pnlMensaje" runat="server" Visible="false" CssClass="mb-6">
                        <div class="bg-error-container/30 border border-error/20 rounded-2xl p-4 flex items-center gap-3 text-error">
                            <span class="material-symbols-outlined">warning</span>
                            <asp:Label ID="lblMensaje" runat="server" CssClass="text-sm font-semibold"></asp:Label>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="pnlSinDocumentos" runat="server" Visible="false">
                        <div class="bg-white rounded-3xl p-20 flex flex-col items-center text-center shadow-sm border border-outline-variant/20">
                            <div class="w-24 h-24 bg-surface-container-low rounded-full flex items-center justify-center mb-6 text-outline/40">
                                <span class="material-symbols-outlined text-[48px]">inventory_2</span>
                            </div>
                            <h3 class="text-2xl font-headline font-bold text-primary mb-2">Todo en orden</h3>
                            <p class="text-on-surface-variant font-body max-w-sm">No tienes documentos pendientes de revisión en este momento.</p>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="pnlTabla" runat="server" Visible="false">
                        <div class="grid grid-cols-12 gap-4 px-6 mb-4 text-[11px] font-black text-outline uppercase tracking-[0.2em]">
                            <div class="col-span-3">Remitente / Área</div>
                            <div class="col-span-5">Asunto / Referencia</div>
                            <div class="col-span-2">Ingreso</div>
                            <div class="col-span-2 text-right">Acción</div>
                        </div>

                        <div class="space-y-3">
                            <asp:Repeater ID="rptDocumentos" runat="server">
                                <ItemTemplate>
                                    <div class="bg-white rounded-2xl p-5 border border-outline-variant/10 shadow-[0_2px_15px_-3px_rgba(0,30,64,0.04)] hover:shadow-lg hover:border-primary/20 transition-all duration-300 group flex items-center gap-6 relative overflow-hidden">
                                        <!-- Priority Indicator -->
                                        <div class="absolute left-0 top-0 bottom-0 w-1 bg-primary/20 group-hover:bg-primary transition-colors"></div>
                                        
                                        <!-- Remitente -->
                                        <div class="col-span-3 flex items-center gap-4 flex-1 min-w-0">
                                            <div class="w-12 h-12 rounded-full bg-primary/5 flex items-center justify-center text-primary font-bold text-sm shrink-0 border border-primary/10">
                                                <%# Eval("AreaResponsable").ToString().Substring(0, 1).ToUpper() %>
                                            </div>
                                            <div class="truncate">
                                                <h4 class="font-bold text-on-surface text-sm"><%# Eval("IDUsuarioCreador") %></h4>
                                                <p class="text-xs text-on-surface-variant mt-0.5 uppercase font-medium tracking-tight"><%# Eval("AreaResponsable") %></p>
                                            </div>
                                        </div>

                                        <!-- Asunto -->
                                        <div class="col-span-5 flex-[2] min-w-0">
                                            <h4 class="font-bold text-primary text-sm group-hover:text-primary-container transition-colors truncate"><%# Eval("Asunto") %></h4>
                                            <p class="text-xs text-on-surface-variant mt-1 font-mono tracking-tighter">REF: <%# Eval("CodigoDocumento") %></p>
                                        </div>

                                        <!-- Fecha -->
                                        <div class="col-span-2 shrink-0 text-right md:text-left">
                                            <h4 class="font-semibold text-on-surface text-xs"><%# Eval("FechaAsignacion", "{0:dd MMM, hh:mm tt}") %></h4>
                                            <p class="text-[10px] text-on-surface-variant mt-1 uppercase font-bold tracking-tighter"><%# Eval("EstadoFirma") %></p>
                                        </div>

                                        <!-- Acción -->
                                        <div class="col-span-2 shrink-0 flex justify-end">
                                            <button type="button" 
                                                onclick='abrirModal("<%# Eval("IDFirmante") %>", "<%# ResolveUrl(Eval("RutaArchivo").ToString()) %>", "<%# Eval("Asunto").ToString().Replace("\"", "&quot;").Replace("'", "\\'") %>", "<%# Eval("CodigoDocumento") %>")'
                                                class="bg-primary text-white px-6 py-2.5 rounded-xl text-xs font-black hover:bg-primary-container hover:shadow-xl hover:shadow-primary/20 transition-all duration-300 active:scale-95">
                                                Revisar
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

        <!-- Modal Visor (Estilo Premium) -->
        <div id="modalRevisor" class="modal-overlay">
            <div class="bg-white w-[95%] max-w-7xl h-[92vh] rounded-[2.5rem] shadow-2xl flex flex-col border border-outline-variant/30 overflow-hidden animate-in fade-in zoom-in duration-300">
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
                
                <!-- Viewer Area -->
                <div class="flex-1 bg-surface-container-low p-6 flex gap-6">
                    <!-- PDF Panel -->
                    <div class="flex-[3] bg-white rounded-3xl shadow-sm border border-outline-variant/20 overflow-hidden relative group">
                        <iframe id="pdfFrame" src=""></iframe>
                        <div class="absolute top-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity">
                            <a id="btnDescargar" href="#" target="_blank" class="bg-white/90 backdrop-blur shadow-md px-4 py-2 rounded-full text-xs font-bold text-primary hover:bg-primary hover:text-white transition-all flex items-center gap-2">
                                <span class="material-symbols-outlined text-sm">download</span> Descargar
                            </a>
                        </div>
                    </div>
                    
                    <!-- Form Panel -->
                    <div class="flex-1 flex flex-col bg-white rounded-3xl p-8 border border-outline-variant/20 shadow-sm">
                        <div class="flex-1">
                            <h3 class="text-lg font-bold text-primary mb-6">Dictamen de Revisión</h3>
                            
                            <div class="space-y-6">
                                <div>
                                    <label class="text-[11px] font-black text-outline uppercase tracking-widest mb-3 block">Comentarios / Observaciones</label>
                                    <textarea id="txtComentario" rows="8" 
                                        class="w-full bg-surface-container-low border border-outline-variant/30 rounded-2xl px-5 py-4 text-sm text-on-surface focus:ring-2 focus:ring-primary/20 focus:bg-white transition-all resize-none outline-none"
                                        placeholder="Ingrese el detalle de su revisión aquí..."></textarea>
                                </div>
                                
                                <div class="bg-primary/5 rounded-2xl p-4 flex items-start gap-3 border border-primary/10">
                                    <span class="material-symbols-outlined text-primary text-xl">info</span>
                                    <p class="text-xs text-primary/80 leading-relaxed font-medium">
                                        Al aprobar, el documento pasará a la siguiente etapa. Si observa, el autor deberá corregir los puntos señalados.
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!-- Footer Actions -->
                        <div class="pt-8 space-y-3">
                            <asp:LinkButton ID="btnGuardarAprobado" runat="server" OnClick="btnGuardarRevision_Click"
                                OnClientClick="return prepararRevision('APROBADO');"
                                CssClass="w-full bg-primary text-white py-4 rounded-2xl text-sm font-black hover:bg-primary-container hover:shadow-xl hover:shadow-primary/30 transition-all flex items-center justify-center gap-2 active:scale-[0.98]">
                                <span class="material-symbols-outlined text-lg">verified</span> Aprobar Documento
                            </asp:LinkButton>
                            
                            <asp:LinkButton ID="btnGuardarObservado" runat="server" OnClick="btnGuardarRevision_Click"
                                OnClientClick="return prepararRevision('OBSERVADO');"
                                CssClass="w-full bg-white text-error border-2 border-error/20 py-4 rounded-2xl text-sm font-black hover:bg-error hover:text-white hover:border-error transition-all flex items-center justify-center gap-2 active:scale-[0.98]">
                                <span class="material-symbols-outlined text-lg">rate_review</span> Registrar Observación
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <asp:HiddenField ID="hfIDFirmante" runat="server" />
        <asp:HiddenField ID="hfComentario" runat="server" />
        <asp:HiddenField ID="hfDecision" runat="server" />

    </form>

    <script>
        function abrirModal(idFirmante, urlPdf, asunto, codigo) {
            document.getElementById('<%= hfIDFirmante.ClientID %>').value = idFirmante;
            document.getElementById('modalAsunto').textContent = asunto;
            document.getElementById('modalCodigo').textContent = codigo;
            document.getElementById('txtComentario').value = '';
            
            var iframe = document.getElementById('pdfFrame');
            if (iframe) iframe.src = urlPdf;
            
            document.getElementById('modalRevisor').classList.add('active');
            document.body.style.overflow = 'hidden';
        }

        function cerrarModal() {
            document.getElementById('modalRevisor').classList.remove('active');
            document.body.style.overflow = 'auto';
            var iframe = document.getElementById('pdfFrame');
            if (iframe) iframe.src = '';
        }

        function prepararRevision(decision) {
            var comentario = document.getElementById('txtComentario').value.trim();
            if (decision === 'OBSERVADO' && comentario === '') {
                alert('Por favor, ingrese una observación detallada para el rechazo.');
                return false;
            }
            document.getElementById('<%= hfComentario.ClientID %>').value = comentario;
            document.getElementById('<%= hfDecision.ClientID %>').value = decision;
            return true;
        }
    </script>
</body>
</html>