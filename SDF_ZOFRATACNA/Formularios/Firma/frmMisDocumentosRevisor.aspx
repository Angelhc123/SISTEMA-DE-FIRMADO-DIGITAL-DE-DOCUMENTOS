<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmMisDocumentosRevisor.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Firma.frmMisDocumentosRevisor" %>
<!DOCTYPE html>
<html class="light" lang="es">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>SDF ZOFRATACNA - Mis Documentos para Revisar</title>
    <link href="https://fonts.googleapis.com" rel="preconnect"/>
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
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
                        "primary-container": "#001e40",
                        "on-secondary": "#ffffff",
                        "secondary-fixed-dim": "#bec7d9",
                        "surface-tint": "#485f84",
                        "on-error": "#ffffff",
                        "primary": "#000511",
                        "surface-container": "#efedf1",
                        "on-background": "#1a1c1e",
                        "on-primary-fixed": "#001b3b",
                        "surface-container-high": "#e9e7eb",
                        "error": "#ba1a1a",
                        "inverse-surface": "#2f3033",
                        "surface-bright": "#faf9fc",
                        "secondary-container": "#d7e0f3",
                        "surface-dim": "#dbd9dd",
                        "inverse-primary": "#afc8f2",
                        "error-container": "#ffdad6",
                        "secondary-fixed": "#dae3f6",
                        "surface-container-lowest": "#ffffff",
                        "on-surface": "#1a1c1e",
                        "surface-container-highest": "#e3e2e5",
                        "outline": "#74777f",
                        "on-error-container": "#93000a",
                        "on-primary-container": "#6f87ae",
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
    <style>
        /* Modal overlay */
        .modal-overlay { display: none; position: fixed; inset: 0; background: rgba(0,0,0,0.55); z-index: 9000; align-items: center; justify-content: center; }
        .modal-overlay.active { display: flex; }
        /* Ocultar iframe de PDF hasta que cargue */
        #pdfFrame { border: none; width: 100%; height: 100%; min-height: 520px; }
    </style>
</head>
<body class="bg-surface text-on-surface font-body antialiased flex h-screen overflow-hidden">
<form id="form1" runat="server" class="flex w-full h-screen overflow-hidden">

    <!-- ══════════════ SIDEBAR ══════════════ -->
    <aside class="bg-white h-screen w-64 fixed left-0 top-0 border-r border-outline-variant/20 shadow-sm z-50 flex flex-col py-6 px-4">
        <div class="flex items-center gap-3 mb-10 px-2">
            <div class="w-9 h-9 bg-primary-container rounded-lg flex items-center justify-center text-white">
                <span class="material-symbols-outlined text-[20px]" style="font-variation-settings:'FILL' 1;">account_balance</span>
            </div>
            <div>
                <p class="text-sm font-black text-primary-container uppercase tracking-tight leading-none">SDF ZOFRATACNA</p>
                <p class="text-[10px] text-on-surface-variant font-medium">Firmado Digital</p>
            </div>
        </div>

        <nav class="flex-1 space-y-1">
            <p class="px-3 text-[10px] font-bold text-outline uppercase tracking-wider mb-2">Principal</p>
            <a href="~/Formularios/Firma/frmDashboardFirmante.aspx" runat="server"
               class="flex items-center gap-3 px-3 py-2.5 rounded-lg text-on-surface-variant hover:bg-surface-container font-medium text-sm transition-colors">
                <span class="material-symbols-outlined text-[20px]">dashboard</span> Dashboard
            </a>
            <a href="#"
               class="flex items-center gap-3 px-3 py-2.5 rounded-lg bg-primary-container/10 text-primary-container font-semibold text-sm">
                <span class="material-symbols-outlined text-[20px]" style="font-variation-settings:'FILL' 1;">task</span> Mis Documentos
            </a>
            <a href="~/Formularios/Firma/frmArchivoFirmante.aspx" runat="server"
               class="flex items-center gap-3 px-3 py-2.5 rounded-lg text-on-surface-variant hover:bg-surface-container font-medium text-sm transition-colors">
                <span class="material-symbols-outlined text-[20px]">folder_open</span> Archivo
            </a>
        </nav>

        <!-- Usuario -->
        <div class="border-t border-outline-variant/30 pt-4 mt-4">
            <div class="flex items-center gap-3 px-2">
                <asp:Image ID="imgPerfil" runat="server" CssClass="w-9 h-9 rounded-full object-cover ring-2 ring-primary-container/20" ImageUrl="https://ui-avatars.com/api/?background=001e40&color=fff&name=U" />
                <div class="flex-1 min-w-0">
                    <asp:Label ID="lblNombreUsuario" runat="server" CssClass="block text-sm font-semibold text-on-surface truncate" Text="Usuario"></asp:Label>
                    <asp:Label ID="lblRolUsuario" runat="server" CssClass="block text-xs text-on-surface-variant truncate" Text="Firmante"></asp:Label>
                </div>
            </div>
            <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click"
                CssClass="mt-3 w-full flex items-center gap-2 px-3 py-2 rounded-lg text-error hover:bg-error-container/20 text-sm font-medium transition-colors">
                <span class="material-symbols-outlined text-[18px]">logout</span> Cerrar sesión
            </asp:LinkButton>
        </div>
    </aside>

    <!-- ══════════════ CONTENIDO PRINCIPAL ══════════════ -->
    <div class="ml-64 flex-1 flex flex-col overflow-hidden">

        <!-- Topbar -->
        <header class="bg-white border-b border-outline-variant/20 px-8 py-4 flex items-center justify-between flex-shrink-0">
            <div>
                <h2 class="text-xl font-black text-primary-container">Documentos Pendientes de Revisión</h2>
                <p class="text-xs text-on-surface-variant mt-0.5">Solo se muestran documentos asignados a tu usuario en el flujo de firma</p>
            </div>
            <div class="flex items-center gap-2">
                <span class="material-symbols-outlined text-on-surface-variant text-[18px]">info</span>
                <span class="text-xs text-on-surface-variant">Rol: <asp:Label ID="lblRolBadge" runat="server" CssClass="font-semibold text-primary-container" Text="—"></asp:Label></span>
            </div>
        </header>

        <!-- Área scrollable -->
        <main class="flex-1 overflow-y-auto p-8 space-y-6">

            <!-- Mensaje de error/info -->
            <asp:Panel ID="pnlMensaje" runat="server" Visible="false">
                <div class="bg-error-container/30 border border-error/30 rounded-lg px-5 py-4 flex items-center gap-3">
                    <span class="material-symbols-outlined text-error text-[20px]">warning</span>
                    <asp:Label ID="lblMensaje" runat="server" CssClass="text-sm text-error font-medium"></asp:Label>
                </div>
            </asp:Panel>

            <!-- Sin documentos -->
            <asp:Panel ID="pnlSinDocumentos" runat="server" Visible="false">
                <div class="bg-surface-container-low rounded-xl p-16 flex flex-col items-center justify-center text-center">
                    <span class="material-symbols-outlined text-[64px] text-outline mb-4">inbox</span>
                    <h3 class="text-lg font-bold text-on-surface mb-1">Sin documentos pendientes</h3>
                    <p class="text-sm text-on-surface-variant max-w-sm">No tienes ningún documento asignado para revisar en este momento. Cuando un registrador te asigne documentos aparecerán aquí.</p>
                </div>
            </asp:Panel>

            <!-- Tabla de documentos -->
            <asp:Panel ID="pnlTabla" runat="server" Visible="false">
                <!-- Cabecera de columnas -->
                <div class="px-5 pb-2 grid grid-cols-12 gap-4 text-xs font-bold text-outline uppercase tracking-wider">
                    <div class="col-span-1">Orden</div>
                    <div class="col-span-3">Asunto</div>
                    <div class="col-span-2">Código</div>
                    <div class="col-span-2">Área</div>
                    <div class="col-span-2">Estado</div>
                    <div class="col-span-1">Fecha</div>
                    <div class="col-span-1 text-right">Acción</div>
                </div>

                <asp:Repeater ID="rptDocumentos" runat="server" OnItemCommand="rptDocumentos_ItemCommand">
                    <ItemTemplate>
                        <div class="bg-surface-container-lowest outline outline-1 outline-outline-variant/20 rounded-lg p-5 grid grid-cols-12 gap-4 items-center hover:bg-surface-container-low hover:shadow-md transition-all duration-200 mb-3">
                            <!-- Orden firma -->
                            <div class="col-span-1">
                                <span class="inline-flex items-center justify-center w-8 h-8 rounded-full bg-primary-container text-white text-sm font-black">
                                    <%# Eval("Orden") %>
                                </span>
                            </div>
                            <!-- Asunto -->
                            <div class="col-span-3">
                                <p class="text-sm font-bold text-on-surface truncate"><%# Eval("Asunto") %></p>
                                <p class="text-xs text-on-surface-variant"><%# Eval("TipoDocumento") %></p>
                            </div>
                            <!-- Código -->
                            <div class="col-span-2">
                                <p class="text-xs font-mono text-on-surface-variant truncate"><%# Eval("CodigoDocumento") %></p>
                            </div>
                            <!-- Área -->
                            <div class="col-span-2">
                                <p class="text-xs text-on-surface truncate"><%# Eval("AreaResponsable") %></p>
                            </div>
                            <!-- Estado firma -->
                            <div class="col-span-2">
                                <span class="inline-flex items-center gap-1 bg-secondary-container text-on-secondary-container text-[10px] font-bold px-2 py-1 rounded-sm uppercase tracking-wide">
                                    <%# Eval("EstadoFirma") %>
                                </span>
                            </div>
                            <!-- Fecha -->
                            <div class="col-span-1">
                                <p class="text-xs text-on-surface-variant"><%# Eval("FechaAsignacion", "{0:dd/MM/yy}") %></p>
                            </div>
                            <!-- Acción -->
                            <div class="col-span-1 flex justify-end">
                                <button type="button"
                                    onclick='abrirModal("<%# Eval("IDFirmante") %>", "<%# ResolveUrl(Eval("RutaArchivo").ToString()) %>", "<%# Eval("Asunto").ToString().Replace("\"", "&quot;").Replace("'", "\\'") %>", "<%# Eval("CodigoDocumento") %>")'
                                    class="bg-gradient-to-br from-primary to-primary-container text-white px-3 py-2 rounded-md text-xs font-bold hover:shadow-lg transition-all flex items-center gap-1">
                                    <span class="material-symbols-outlined text-[14px]">visibility</span> Ver
                                </button>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </asp:Panel>

        </main>
    </div>

    <!-- ══════════════ MODAL REVISOR ══════════════ -->
    <div id="modalRevisor" class="modal-overlay">
        <div class="bg-white rounded-xl shadow-2xl w-full max-w-5xl mx-4 flex flex-col" style="max-height:92vh;">

            <!-- Header modal -->
            <div class="flex items-center justify-between px-6 py-4 border-b border-outline-variant/20 flex-shrink-0">
                <div>
                    <p class="text-xs text-on-surface-variant font-medium uppercase tracking-wider" id="modalCodigo">—</p>
                    <h3 class="text-base font-black text-primary-container" id="modalAsunto">—</h3>
                </div>
                <button type="button" onclick="cerrarModal()" class="text-on-surface-variant hover:text-error transition-colors">
                    <span class="material-symbols-outlined">close</span>
                </button>
            </div>

            <!-- PDF viewer -->
            <div class="flex-1 overflow-hidden bg-surface-container-low" style="min-height:400px;">
                <iframe id="pdfFrame" src="" title="Documento PDF"></iframe>
            </div>

            <!-- Panel de decisión -->
            <div class="px-6 py-5 border-t border-outline-variant/20 flex-shrink-0 bg-white">
                <p class="text-sm font-bold text-on-surface mb-3">Tu decisión sobre este documento:</p>
                <div class="flex flex-col gap-3">
                    <!-- Comentario/Observación -->
                    <textarea id="txtComentario" rows="2"
                        class="w-full border border-outline-variant rounded-lg px-3 py-2 text-sm text-on-surface resize-none focus:outline-none focus:ring-2 focus:ring-primary-container/40"
                        placeholder="Comentario u observación (obligatorio si marca 'Con Observación')..."></textarea>

                    <!-- Botones -->
                    <div class="flex items-center gap-3 justify-end">
                        <button type="button" onclick="cerrarModal()"
                            class="px-4 py-2 rounded-lg border border-outline-variant text-on-surface-variant text-sm font-medium hover:bg-surface-container transition-colors">
                            Cancelar
                        </button>

                        <!-- Observado -->
                        <asp:LinkButton ID="btnGuardarObservado" runat="server" OnClick="btnGuardarRevision_Click"
                            CommandArgument="OBSERVADO"
                            CssClass="px-5 py-2 rounded-lg bg-error-container text-on-error-container text-sm font-bold hover:bg-error/20 transition-colors flex items-center gap-2"
                            OnClientClick="return prepararRevision('OBSERVADO');">
                            <span class="material-symbols-outlined text-[16px]">rate_review</span> Con Observación
                        </asp:LinkButton>

                        <!-- Aprobado -->
                        <asp:LinkButton ID="btnGuardarAprobado" runat="server" OnClick="btnGuardarRevision_Click"
                            CommandArgument="APROBADO"
                            CssClass="px-5 py-2 rounded-lg bg-primary-container text-white text-sm font-bold hover:bg-primary transition-colors flex items-center gap-2"
                            OnClientClick="return prepararRevision('APROBADO');">
                            <span class="material-symbols-outlined text-[16px]">check_circle</span> Aprobar
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Hidden fields para pasar datos al servidor -->
    <asp:HiddenField ID="hfIDFirmante" runat="server" />
    <asp:HiddenField ID="hfComentario" runat="server" />
    <asp:HiddenField ID="hfDecision" runat="server" />

</form>

<script>
    // Abrir modal con el PDF y datos del documento (Llamada desde cliente para mayor velocidad)
    function abrirModal(idFirmante, urlPdf, asunto, codigo) {
        // Asignar valores a controles ocultos del servidor
        var hfID = document.getElementById('<%= hfIDFirmante.ClientID %>');
        if (hfID) hfID.value = idFirmante;

        // Actualizar UI del modal
        document.getElementById('modalAsunto').textContent = asunto;
        document.getElementById('modalCodigo').textContent = codigo;
        document.getElementById('txtComentario').value = '';

        // Cargar PDF en el iframe
        var iframe = document.getElementById('pdfFrame');
        if (iframe) {
            iframe.src = urlPdf;
        }

        // Mostrar modal
        document.getElementById('modalRevisor').classList.add('active');
    }

    function cerrarModal() {
        document.getElementById('modalRevisor').classList.remove('active');
        var iframe = document.getElementById('pdfFrame');
        if (iframe) iframe.src = '';
    }

    // Validar y traspasar comentario al hidden field antes del postback
    function prepararRevision(decision) {
        var comentario = document.getElementById('txtComentario').value.trim();
        if (decision === 'OBSERVADO' && comentario === '') {
            alert('Debe ingresar una observación antes de marcar el documento como observado.');
            return false;
        }
        document.getElementById('<%= hfComentario.ClientID %>').value = comentario;
        document.getElementById('<%= hfDecision.ClientID %>').value = decision;
        return true;
    }
</script>
</body>
</html>