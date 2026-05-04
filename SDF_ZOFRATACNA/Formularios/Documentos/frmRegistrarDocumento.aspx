<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmRegistrarDocumento.aspx.cs"
    Inherits="SDF_ZOFRATACNA.Formularios.Documentos.frmRegistrarDocumento" %>
<!DOCTYPE html>
<html class="light" lang="es">

<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SDF ZOFRATACNA - Registrar Nuevo Documento</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@400;500;700;800&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
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
                    borderRadius: { DEFAULT: "0.125rem", lg: "0.25rem", xl: "0.5rem", full: "0.75rem" },
                    fontFamily: { headline: ["Public Sans"], body: ["Public Sans"], label: ["Public Sans"] }
                }
            }
        }
    </script>
    <style>
        body { font-family: 'Public Sans', sans-serif; }
    </style>
</head>

<body class="bg-surface text-on-surface min-h-screen flex selection:bg-primary-container selection:text-white">
    <form id="form1" runat="server" class="flex w-full min-h-screen">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <!-- SIDENAVBAR -->
        <aside class="bg-white h-screen w-72 fixed left-0 top-0 shadow-[8px_0_24px_rgba(0,30,64,0.04)] z-50 flex flex-col py-8">
            <div class="px-8 mb-12 flex items-center gap-4">
                <div class="w-10 h-10 rounded-lg bg-gradient-to-br from-primary to-primary-container flex items-center justify-center shadow-lg">
                    <span class="material-symbols-outlined text-white text-xl">account_balance</span>
                </div>
                <div>
                    <h1 class="text-lg font-black tracking-tighter text-[#001E40] uppercase leading-tight">SDF ZOFRATACNA</h1>
                    <p class="text-xs text-slate-500 uppercase mt-0.5">Sistema de Firmado Digital</p>
                </div>
            </div>
            <nav class="flex-1 px-4 space-y-1 text-sm font-medium">
                <asp:HyperLink runat="server" CssClass="flex items-center gap-3 px-6 py-4 text-slate-500 hover:bg-slate-100 transition-all rounded-l-xl" NavigateUrl="~/Formularios/Documentos/frmDashboardRegistrador.aspx">
                    <span class="material-symbols-outlined">dashboard</span>
                    <span>Dashboard</span>
                </asp:HyperLink>
                <asp:HyperLink runat="server" CssClass="flex items-center gap-3 px-6 py-4 text-slate-500 hover:bg-slate-100 transition-all rounded-l-xl" NavigateUrl="~/Formularios/Documentos/frmMisDocumentos.aspx">
                    <span class="material-symbols-outlined">description</span>
                    <span>Mis Documentos</span>
                </asp:HyperLink>
                <asp:HyperLink runat="server" CssClass="flex items-center gap-3 px-6 py-4 text-[#001E40] bg-slate-100 font-bold border-r-4 border-[#001E40] rounded-l-xl" NavigateUrl="~/Formularios/Documentos/frmRegistrarDocumento.aspx">
                    <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">add_box</span>
                    <span>Registrar Nuevo</span>
                </asp:HyperLink>
                <asp:HyperLink runat="server" CssClass="flex items-center gap-3 px-6 py-4 text-slate-500 hover:bg-slate-100 transition-all rounded-l-xl" NavigateUrl="~/Formularios/Documentos/frmArchivoRegistrador.aspx">
                    <span class="material-symbols-outlined">archive</span>
                    <span>Archivo</span>
                </asp:HyperLink>
                <div class="my-6 h-px bg-slate-100 mx-6"></div>
                <asp:HyperLink runat="server" CssClass="flex items-center gap-3 px-6 py-4 text-slate-500 hover:bg-slate-100 transition-all rounded-l-xl" NavigateUrl="~/Formularios/Documentos/frmDirectorio.aspx">
                    <span class="material-symbols-outlined">contact_phone</span>
                    <span>Directorio</span>
                </asp:HyperLink>
                <asp:LinkButton runat="server" CssClass="flex items-center gap-3 px-6 py-4 text-slate-500 hover:bg-slate-100 transition-all rounded-l-xl" OnClick="btnLogout_Click">
                    <span class="material-symbols-outlined">logout</span>
                    <span>Cerrar Sesión</span>
                </asp:LinkButton>
            </nav>
            <div class="px-8 mt-auto flex items-center gap-3">
                <asp:Image ID="imgAvatar" runat="server" CssClass="w-10 h-10 rounded-full border object-cover" ImageUrl="https://ui-avatars.com/api/?background=001e40&color=fff&name=Usuario" />
                <div class="flex flex-col">
                    <span class="text-sm font-bold text-primary-container"><asp:Literal ID="litUsuario" runat="server">Registrador</asp:Literal></span>
                    <span class="text-xs text-on-surface-variant uppercase">Registrador</span>
                </div>
            </div>
        </aside>

        <!-- Main Content -->
        <div class="flex-1 ml-72 flex flex-col min-h-screen">
            <header class="fixed top-0 right-0 left-72 h-16 z-40 bg-white/80 backdrop-blur-xl shadow-sm">
                <div class="flex items-center justify-between px-10 h-full">
                    <nav class="text-sm tracking-wide text-[#001E40] flex items-center gap-4">
                        <span class="text-slate-400">Inicio</span>
                        <span class="material-symbols-outlined text-sm text-slate-300">chevron_right</span>
                        <span class="text-[#001E40] font-bold border-b-2 border-[#001E40] pb-1">Registrar Nuevo Documento</span>
                    </nav>
                </div>
            </header>

            <main class="flex-1 pt-24 px-10 pb-12 bg-surface">
                <div class="max-w-4xl mx-auto space-y-8">
                    <div class="mb-8">
                        <h2 class="text-3xl font-bold tracking-tight text-primary-container">Nuevo Documento</h2>
                        <p class="text-on-surface-variant mt-2 text-base">Complete los metadatos y configure el flujo de firmas.</p>
                    </div>

                    <asp:Panel runat="server" Visible="false" ID="pnlError" CssClass="bg-red-100 text-red-800 p-4 rounded-md mb-4">
                        <asp:Literal ID="litError" runat="server" />
                    </asp:Panel>
                    <asp:Panel runat="server" Visible="false" ID="pnlSuccess" CssClass="bg-green-100 text-green-800 p-4 rounded-md mb-4">
                        <asp:Literal ID="litSuccess" runat="server" />
                    </asp:Panel>

                    <div class="space-y-8">
                        <!-- Metadatos -->
                        <div class="bg-white p-8 rounded-lg shadow ring-1 ring-gray-200">
                            <h3 class="text-lg font-bold text-primary-container mb-6 flex items-center gap-2">
                                <span class="material-symbols-outlined">info</span> Información General
                            </h3>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <div class="md:col-span-2">
                                    <label class="block text-xs font-bold uppercase mb-2">Asunto del Documento *</label>
                                    <asp:TextBox ID="txtAsunto" runat="server" CssClass="w-full border-b-2 border-gray-300 focus:border-primary-container focus:ring-0 px-4 py-3" placeholder="Ej: Resolución Jefatural Nº 045-2023" />
                                    <asp:RequiredFieldValidator ID="rfvAsunto" runat="server" ControlToValidate="txtAsunto" ErrorMessage="El asunto es obligatorio" CssClass="text-xs text-red-500 mt-1" Display="Dynamic" />
                                </div>
                                <div>
                                    <label class="block text-xs font-bold uppercase mb-2">Tipo de Documento *</label>
                                    <asp:DropDownList ID="ddlTipoDoc" runat="server" CssClass="w-full border-b-2 border-gray-300 focus:border-primary-container focus:ring-0 px-4 py-3" />
                                    <asp:RequiredFieldValidator ID="rfvTipoDoc" runat="server" ControlToValidate="ddlTipoDoc" InitialValue="" ErrorMessage="Seleccione un tipo" CssClass="text-xs text-red-500 mt-1" Display="Dynamic" />
                                </div>
                                <div>
                                    <label class="block text-xs font-bold uppercase mb-2">Área Responsable *</label>
                                    <asp:DropDownList ID="ddlAreaResponsable" runat="server" CssClass="w-full border-b-2 border-gray-300 focus:border-primary-container focus:ring-0 px-4 py-3" />
                                    <asp:RequiredFieldValidator ID="rfvArea" runat="server" ControlToValidate="ddlAreaResponsable" InitialValue="" ErrorMessage="Seleccione un área" CssClass="text-xs text-red-500 mt-1" Display="Dynamic" />
                                </div>
                                <div>
                                    <label class="block text-xs font-bold uppercase mb-2">Fecha de Emisión *</label>
                                    <asp:TextBox ID="txtFechaEmision" runat="server" type="date" CssClass="w-full border-b-2 border-gray-300 focus:border-primary-container focus:ring-0 px-4 py-3" />
                                    <asp:RequiredFieldValidator ID="rfvFecha" runat="server" ControlToValidate="txtFechaEmision" ErrorMessage="Fecha requerida" CssClass="text-xs text-red-500 mt-1" Display="Dynamic" />
                                </div>
                                <div>
                                    <label class="block text-xs font-bold uppercase mb-2">Código de Referencia *</label>
                                    <asp:TextBox ID="txtCodigoReferencia" runat="server" CssClass="w-full border-b-2 border-gray-300 focus:border-primary-container focus:ring-0 px-4 py-3" placeholder="REF-2023-XYZ" />
                                    <asp:RequiredFieldValidator ID="rfvCodigo" runat="server" ControlToValidate="txtCodigoReferencia" ErrorMessage="Código obligatorio" CssClass="text-xs text-red-500 mt-1" Display="Dynamic" />
                                </div>
                            </div>
                        </div>

                        <!-- Dropzone PDF -->
                        <script>
                            function actualizarVistaPDF(input) {
                                var lblNombre = document.getElementById('lblFileName');
                                var divNormal = document.getElementById('zoneNormal');
                                var divCargado = document.getElementById('zoneCargado');

                                if (input.files && input.files.length > 0) {
                                    if (lblNombre) lblNombre.innerText = input.files[0].name;
                                    if (divNormal) divNormal.classList.add('hidden');
                                    if (divCargado) divCargado.classList.remove('hidden');
                                } else {
                                    if (lblNombre) lblNombre.innerText = '';
                                    if (divNormal) divNormal.classList.remove('hidden');
                                    if (divCargado) divCargado.classList.add('hidden');
                                }
                            }
                            </script>
                        <label for="<%= fileUploadPDF.ClientID %>" class="block bg-gray-50 p-8 rounded-lg border-2 border-dashed border-gray-300 hover:border-primary-container transition-colors text-center cursor-pointer">
                            <div id="zoneNormal">
                                <div class="w-16 h-16 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-4">
                                    <span class="material-symbols-outlined text-2xl text-primary-container">upload_file</span>
                                </div>
                                <h4 class="text-base font-bold mb-2">Cargar Documento PDF *</h4>
                                <p class="text-sm text-gray-500 mb-4">Click o arrastra tu archivo PDF aquí</p>
                                <div class="inline-flex items-center justify-center px-4 py-2 bg-gray-100 rounded-md text-sm font-medium border">Seleccionar Archivo</div>
                            </div>
                            <div id="zoneCargado" class="hidden">
                                <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4 text-blue-900">
                                    <span class="material-symbols-outlined text-2xl">picture_as_pdf</span>
                                </div>
                                <h4 class="text-base font-bold text-primary-container mb-2">¡Archivo Seleccionado!</h4>
                                <span id="lblFileName" class="block text-lg font-bold text-red-600 mb-3"></span>
                                <p class="text-xs text-gray-500">Haz click nuevamente para reemplazar</p>
                            </div>
                            <asp:FileUpload ID="fileUploadPDF" runat="server" CssClass="hidden" accept=".pdf" onchange="actualizarVistaPDF(this);" />
                        </label>
                        <div class="text-center mt-2">
                            <asp:RequiredFieldValidator ID="rfvFile" runat="server" ControlToValidate="fileUploadPDF" ErrorMessage="Debe seleccionar un PDF" CssClass="text-xs text-red-500" Display="Dynamic" />
                        </div>

                        <!-- Flujo de Firmas -->
                        <div class="bg-white p-8 rounded-lg shadow ring-1 ring-gray-200">
                            <h3 class="text-lg font-bold text-primary-container mb-6 flex items-center gap-2">
                                <span class="material-symbols-outlined">route</span> Configuración de Flujo
                            </h3>
                            <div>
                                <label class="block text-xs font-bold uppercase mb-3">Secuencia de Firmantes *</label>
                                <div class="space-y-3 mb-4">
                                    <asp:Repeater ID="rptFirmantes" runat="server">
                                        <ItemTemplate>
                                            <div class="flex items-center gap-4 p-4 bg-gray-50 rounded-md border">
                                                <div class="w-8 h-8 rounded-full bg-primary-container text-white flex items-center justify-center text-sm font-bold shrink-0">
                                                    <%# Container.ItemIndex + 1 %>
                                                </div>
                                                <div class="flex-1">
                                                    <p class="font-medium text-sm"><%# Eval("NombreCompleto") %></p>
                                                    <p class="text-xs text-gray-500"><%# Eval("LoginUsuario") %></p>
                                                </div>
                                                <asp:LinkButton ID="lnkRemoveFirmante" runat="server" CommandArgument='<%# Eval("LoginUsuario") %>' OnClick="RemoveFirmante_Click" CausesValidation="false" CssClass="material-symbols-outlined text-gray-400 hover:text-red-500" Text="delete" />
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <div class="flex items-center gap-2">
                                    <asp:DropDownList ID="ddlFirmante" runat="server" CssClass="flex-1 border-b-2 border-gray-300 focus:border-primary-container focus:ring-0 px-4 py-2" />
                                    <asp:Button ID="btnAddFirmante" runat="server" Text="Añadir" CausesValidation="false" OnClick="btnAddFirmante_Click" CssClass="px-4 py-2 bg-gray-100 text-primary-container font-medium rounded hover:bg-gray-200" />
                                </div>
                                <asp:CustomValidator ID="cvFirmantes" runat="server" ErrorMessage="Debe agregar al menos un firmante" CssClass="text-xs text-red-500 mt-1" OnServerValidate="cvFirmantes_ServerValidate" />
                            </div>
                        </div>
                    </div>

                    <!-- Botones -->
                    <div class="flex items-center justify-end gap-4 pt-6 border-t">
                        <asp:HyperLink ID="hlCancelar" runat="server" NavigateUrl="~/Formularios/Documentos/frmDashboardRegistrador.aspx" CssClass="px-6 py-3 text-primary-container font-medium rounded-md hover:bg-gray-100" Text="Cancelar" />
                        <asp:Button ID="btnRegistrar" runat="server" Text="Registrar y Enviar" OnClick="btnRegistrar_Click" CssClass="px-8 py-3 bg-gradient-to-br from-primary to-primary-container text-white font-bold rounded-md shadow-md hover:shadow-lg transition-all" />
                    </div>
                </div>
            </main>
        </div>
    </form>
</body>
</html>