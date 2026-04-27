<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmRegistrarDocumento.aspx.cs"
    Inherits="SDF_ZOFRATACNA.Formularios.Documentos.frmRegistrarDocumento" %>
    <!DOCTYPE html>
    <html class="light" lang="es">

    <head runat="server">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>SDF ZOFRATACNA - Registrar Nuevo Documento</title>
        <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
        <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@400;500;700;800&amp;display=swap"
            rel="stylesheet" />
        <link
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
            rel="stylesheet" />
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
            body {
                font-family: 'Public Sans', sans-serif;
            }
        </style>
    </head>

    <body class="bg-surface text-on-surface min-h-screen flex selection:bg-primary-container selection:text-white">
        <form id="form1" runat="server" class="flex w-full min-h-screen">
            <asp:ScriptManager ID="ScriptManager1" runat="server" />

            <!-- SIDENAVBAR (igual que el original) -->
            <aside
                class="bg-white dark:bg-slate-950 h-screen w-72 fixed left-0 top-0 border-r-0 shadow-[8px_0_24px_rgba(0,30,64,0.04)] z-50 flex flex-col py-8">
                <div class="px-8 mb-12 flex items-center gap-4">
                    <div
                        class="w-10 h-10 rounded-lg bg-gradient-to-br from-primary to-primary-container flex items-center justify-center shadow-lg shadow-primary-container/20">
                        <span class="material-symbols-outlined fill text-white text-xl">account_balance</span>
                    </div>
                    <div>
                        <h1
                            class="text-lg font-black tracking-tighter text-[#001E40] dark:text-white uppercase font-headline leading-tight">
                            SDF ZOFRATACNA</h1>
                        <p class="text-xs text-slate-500 font-label tracking-wide uppercase mt-0.5">Sistema de Firmado
                            Digital</p>
                    </div>
                </div>
                <nav class="flex-1 px-4 space-y-1 font-public-sans tracking-tight text-sm font-medium">
                    <asp:HyperLink runat="server"
                        CssClass="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-l-xl group"
                        NavigateUrl="~/Formularios/Documentos/frmDashboardRegistrador.aspx">
                        <span
                            class="material-symbols-outlined group-hover:text-primary-container transition-colors">dashboard</span>
                        <span>Dashboard</span>
                    </asp:HyperLink>
                    <asp:HyperLink runat="server"
                        CssClass="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-l-xl group"
                        NavigateUrl="~/Formularios/Documentos/frmMisDocumentos.aspx">
                        <span
                            class="material-symbols-outlined group-hover:text-primary-container transition-colors">description</span>
                        <span>Mis Documentos</span>
                    </asp:HyperLink>
                    <asp:HyperLink runat="server"
                        CssClass="flex items-center gap-3 px-6 py-4 text-[#001E40] dark:text-white bg-slate-100 dark:bg-[#001E40]/20 font-bold border-r-4 border-[#001E40] rounded-l-xl group"
                        NavigateUrl="~/Formularios/Documentos/frmRegistrarDocumento.aspx">
                        <span class="material-symbols-outlined fill"
                            style="font-variation-settings: 'FILL' 1;">add_box</span>
                        <span>Registrar Nuevo</span>
                    </asp:HyperLink>
                    <asp:HyperLink runat="server"
                        CssClass="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-l-xl group"
                        NavigateUrl="~/Formularios/Documentos/frmArchivoRegistrador.aspx">
                        <span
                            class="material-symbols-outlined group-hover:text-primary-container transition-colors">archive</span>
                        <span>Archivo</span>
                    </asp:HyperLink>
                    <div class="my-6 h-px bg-slate-50 dark:bg-slate-900/50 mx-6"></div>
                    <asp:HyperLink runat="server"
                        CssClass="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-l-xl group"
                        NavigateUrl="~/Formularios/Documentos/frmDirectorio.aspx">
                        <span
                            class="material-symbols-outlined group-hover:text-primary-container transition-colors">contact_phone</span>
                        <span>Directorio</span>
                    </asp:HyperLink>
                    <asp:LinkButton runat="server"
                        CssClass="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-l-xl group"
                        OnClick="btnLogout_Click">
                        <span
                            class="material-symbols-outlined group-hover:text-primary-container transition-colors">logout</span>
                        <span>Cerrar Sesión</span>
                    </asp:LinkButton>
                </nav>
                <div class="px-8 mt-auto flex items-center gap-3">
                    <asp:Image ID="imgAvatar" runat="server"
                        CssClass="w-10 h-10 rounded-full border border-outline-variant/30 object-cover"
                        ImageUrl="https://lh3.googleusercontent.com/aida-public/AB6AXuAqFuOqYVrG90eCaGApElj-q1y7WdMdy_YEmH3YI2VsYAcB2TC0OpBwGkc7Jgu7_yGcU5h0u97G9TWExUur3ZvYfBGkOB6aGP4TiVkMcjuJe2dBLzvFB4lSsjbcp_yIg_HrmccQPuhiSESRkXAxRDhUWZiyChBXyVEOFyyChSNVM5dV15eE8Att5sHVCkoKstwBi1C7lPO1PB2bW0IRz6bgBYAmcAWALKNNfLFcgS0pl8Sq38ZxySe7FmsPM6ZRvp9BPknwcSKooSvf" />
                    <div class="flex flex-col">
                        <span class="text-sm font-bold text-primary-container tracking-tight">
                            <asp:Literal ID="litUsuario" runat="server">Registrador</asp:Literal>
                        </span>
                        <span
                            class="text-xs text-on-surface-variant font-label uppercase tracking-widest">Registrador</span>
                    </div>
                </div>
            </aside>

            <!-- Main Content -->
            <div class="flex-1 ml-72 flex flex-col min-h-screen">
                <header class="fixed top-0 right-0 left-72 h-16 z-40 bg-white/80 backdrop-blur-xl shadow-sm">
                    <div class="flex items-center justify-between px-10 h-full w-full">
                        <nav
                            class="font-public-sans text-sm tracking-wide text-[#001E40] dark:text-[#d5e3ff] flex items-center gap-4">
                            <span class="text-slate-400">Inicio</span>
                            <span class="material-symbols-outlined text-sm text-slate-300">chevron_right</span>
                            <span
                                class="text-[#001E40] font-bold border-b-2 border-[#001E40] pb-1 translate-y-[2px]">Registrar
                                Nuevo Documento</span>
                        </nav>
                    </div>
                </header>

                <main class="flex-1 pt-24 px-10 pb-12 bg-surface">
                    <div class="max-w-4xl mx-auto space-y-8">
                        <div class="mb-8">
                            <h2 class="text-3xl font-bold tracking-tight text-primary-container font-headline">Nuevo
                                Documento</h2>
                            <p class="text-on-surface-variant mt-2 font-body text-base">Complete los metadatos y
                                configure el flujo de firmas para el nuevo archivo.</p>
                        </div>
                        <asp:Panel runat="server" Visible="false" ID="pnlError"
                            CssClass="bg-error-container text-on-error-container p-4 rounded-md mb-4">
                            <asp:Literal ID="litError" runat="server" />
                        </asp:Panel>
                        <asp:Panel runat="server" Visible="false" ID="pnlSuccess"
                            CssClass="bg-green-100 text-green-800 p-4 rounded-md mb-4">
                            <asp:Literal ID="litSuccess" runat="server" />
                        </asp:Panel>

                        <div class="space-y-8">
                            <!-- Metadatos -->
                            <div
                                class="bg-surface-container-lowest p-8 rounded-lg shadow-[0_8px_24px_rgba(0,30,64,0.04)] ring-1 ring-outline-variant/20">
                                <h3 class="text-lg font-bold text-primary-container mb-6 flex items-center gap-2">
                                    <span class="material-symbols-outlined text-surface-tint">info</span>
                                    Información General
                                </h3>
                                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                    <div class="md:col-span-2">
                                        <label
                                            class="block text-xs font-bold text-on-surface-variant uppercase tracking-wider mb-2">Asunto
                                            del Documento *</label>
                                        <asp:TextBox ID="txtAsunto" runat="server"
                                            CssClass="w-full bg-surface-container-high border-0 border-b-2 border-outline focus:border-primary-container focus:ring-0 rounded-t-sm px-4 py-3 text-on-surface font-body"
                                            placeholder="Ej: Resolución Jefatural Nº 045-2023" />
                                        <asp:RequiredFieldValidator ID="rfvAsunto" runat="server"
                                            ControlToValidate="txtAsunto" ErrorMessage="El asunto es obligatorio"
                                            CssClass="text-xs text-error mt-1" Display="Dynamic" />
                                    </div>
                                    <div>
                                        <label
                                            class="block text-xs font-bold text-on-surface-variant uppercase tracking-wider mb-2">Tipo
                                            de Documento *</label>
                                        <asp:DropDownList ID="ddlTipoDoc" runat="server"
                                            CssClass="w-full bg-surface-container-high border-0 border-b-2 border-outline focus:border-primary-container focus:ring-0 rounded-t-sm px-4 py-3 text-on-surface font-body"
                                            DataValueField="IDMaestro" DataTextField="Descripcion" />
                                        <asp:RequiredFieldValidator ID="rfvTipoDoc" runat="server"
                                            ControlToValidate="ddlTipoDoc" InitialValue="0"
                                            ErrorMessage="Seleccione un tipo de documento"
                                            CssClass="text-xs text-error mt-1" Display="Dynamic" />
                                    </div>
                                    <div>
                                        <label
                                            class="block text-xs font-bold text-on-surface-variant uppercase tracking-wider mb-2">Área
                                            Responsable *</label>
                                        <asp:DropDownList ID="ddlAreaResponsable" runat="server"
                                            CssClass="w-full bg-surface-container-high border-0 border-b-2 border-outline focus:border-primary-container focus:ring-0 rounded-t-sm px-4 py-3 text-on-surface font-body"
                                            DataValueField="Codigo" DataTextField="Descripcion">
                                            <asp:ListItem Value="Gerencia General">Gerencia General</asp:ListItem>
                                            <asp:ListItem Value="Asesoría Legal">Asesoría Legal</asp:ListItem>
                                            <asp:ListItem Value="Administración">Administración</asp:ListItem>
                                            <asp:ListItem Value="Operaciones">Operaciones</asp:ListItem>
                                            <asp:ListItem Value="Sub-Gerencia Administrativa">Sub-Gerencia
                                                Administrativa</asp:ListItem>
                                            <asp:ListItem Value="Secretaria General">Secretaria General</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvArea" runat="server"
                                            ControlToValidate="ddlAreaResponsable" InitialValue=""
                                            ErrorMessage="Seleccione un área responsable"
                                            CssClass="text-xs text-error mt-1" Display="Dynamic" />
                                    </div>
                                    <div>
                                        <label
                                            class="block text-xs font-bold text-on-surface-variant uppercase tracking-wider mb-2">Fecha
                                            de Emisión *</label>
                                        <asp:TextBox ID="txtFechaEmision" runat="server" type="date"
                                            CssClass="w-full bg-surface-container-high border-0 border-b-2 border-outline focus:border-primary-container focus:ring-0 rounded-t-sm px-4 py-3 text-on-surface font-body" />
                                        <asp:RequiredFieldValidator ID="rfvFecha" runat="server"
                                            ControlToValidate="txtFechaEmision"
                                            ErrorMessage="Fecha de emisión requerida" CssClass="text-xs text-error mt-1"
                                            Display="Dynamic" />
                                    </div>
                                    <div>
                                        <label
                                            class="block text-xs font-bold text-on-surface-variant uppercase tracking-wider mb-2">Código
                                            de Referencia *</label>
                                        <asp:TextBox ID="txtCodigoReferencia" runat="server"
                                            CssClass="w-full bg-surface-container-high border-0 border-b-2 border-outline focus:border-primary-container focus:ring-0 rounded-t-sm px-4 py-3 text-on-surface font-body"
                                            placeholder="REF-2023-XYZ" />
                                        <asp:RequiredFieldValidator ID="rfvCodigo" runat="server"
                                            ControlToValidate="txtCodigoReferencia"
                                            ErrorMessage="Código de referencia obligatorio"
                                            CssClass="text-xs text-error mt-1" Display="Dynamic" />
                                    </div>
                                    <div>
                                        <label
                                            class="block text-xs font-bold text-on-surface-variant uppercase tracking-wider mb-2">Días
                                            máx. revisión</label>
                                        <asp:TextBox ID="txtDiasMaxRevision" runat="server" Text="5"
                                            CssClass="w-full bg-surface-container-high border-0 border-b-2 border-outline focus:border-primary-container focus:ring-0 rounded-t-sm px-4 py-3 text-on-surface font-body" />
                                        <asp:RangeValidator ID="rvDias" runat="server"
                                            ControlToValidate="txtDiasMaxRevision" MinimumValue="1" MaximumValue="30"
                                            Type="Integer" ErrorMessage="Debe ser entre 1 y 30 días"
                                            CssClass="text-xs text-error mt-1" Display="Dynamic" />
                                    </div>
                                </div>
                            </div>

                            <!-- Dropzone PDF -->
                            <script>
                                function actualizarVistaPDF(input) {
                                    const lblNombre = document.getElementById('lblFileName');
                                    const divNormal = document.getElementById('zoneNormal');
                                    const divCargado = document.getElementById('zoneCargado');

                                    if (input.files && input.files.length > 0) {
                                        lblNombre.innerText = input.files[0].name;
                                        divNormal.classList.add('hidden');
                                        divCargado.classList.remove('hidden');
                                    } else {
                                        lblNombre.innerText = '';
                                        divNormal.classList.remove('hidden');
                                        divCargado.classList.add('hidden');
                                    }
                                }
                            </script>
                            <label for="<%= fileUploadPDF.ClientID %>"
                                class="block bg-surface-container-low p-8 rounded-lg border-2 border-dashed border-outline-variant hover:border-primary-container transition-colors duration-300 text-center cursor-pointer relative overflow-hidden">
                                
                                <div id="zoneNormal" class="pointer-events-none">
                                    <div class="w-16 h-16 bg-surface-container-highest rounded-full flex items-center justify-center mx-auto mb-4">
                                        <span class="material-symbols-outlined text-2xl text-primary-container">upload_file</span>
                                    </div>
                                    <h4 class="text-base font-bold text-on-surface mb-2">Cargar Documento PDF *</h4>
                                    <p class="text-sm text-on-surface-variant mb-4">Click o arrastra tu archivo PDF aquí</p>
                                    <div class="inline-flex items-center justify-center px-4 py-2 bg-surface-container-highest text-on-surface rounded-md text-sm font-medium transition-colors pointer-events-auto border border-outline/30">
                                        Seleccionar Archivo
                                    </div>
                                </div>

                                <div id="zoneCargado" class="hidden pointer-events-none">
                                    <div class="w-16 h-16 bg-[#d7e0f3] rounded-full flex items-center justify-center mx-auto mb-4 text-[#001e40]">
                                        <span class="material-symbols-outlined text-2xl">picture_as_pdf</span>
                                    </div>
                                    <h4 class="text-base font-bold text-[#001e40] mb-2">¡Archivo Seleccionado Correctamente!</h4>
                                    <span id="lblFileName" class="block text-lg font-bold text-[#ba1a1a] mb-3"></span>
                                    <p class="text-xs text-on-surface-variant underline">Haz click nuevamente en esta tarjeta si deseas reemplazar el archivo</p>
                                </div>

                                <asp:FileUpload ID="fileUploadPDF" runat="server" CssClass="hidden" accept=".pdf" onchange="actualizarVistaPDF(this);" />
                            </label>
                            
                            <div class="text-center mt-2">
                                <asp:RequiredFieldValidator ID="rfvFile" runat="server"
                                    ControlToValidate="fileUploadPDF" ErrorMessage="Debe seleccionar un archivo PDF para continuar"
                                    CssClass="text-xs text-error font-medium" Display="Dynamic" />
                            </div>

                            <!-- Flujo de Firmas -->
                            <div
                                class="bg-surface-container-lowest p-8 rounded-lg shadow-[0_8px_24px_rgba(0,30,64,0.04)] ring-1 ring-outline-variant/20">
                                <h3 class="text-lg font-bold text-primary-container mb-6 flex items-center gap-2">
                                    <span class="material-symbols-outlined text-surface-tint">route</span>
                                    Configuración de Flujo
                                </h3>
                                <div>
                                    <label
                                        class="block text-xs font-bold text-on-surface-variant uppercase tracking-wider mb-3">Secuencia
                                        de Firmantes *</label>
                                    <div class="space-y-3 mb-4">
                                        <asp:Repeater ID="rptFirmantes" runat="server">
                                            <ItemTemplate>
                                                <div
                                                    class="flex items-center gap-4 p-4 bg-surface-container-low rounded-md border border-outline-variant/20">
                                                    <div
                                                        class="w-8 h-8 rounded-full bg-primary-container text-white flex items-center justify-center text-sm font-bold shrink-0">
                                                        <%# Container.ItemIndex + 1 %>
                                                    </div>
                                                    <div class="flex-1">
                                                        <p class="font-medium text-on-surface text-sm">
                                                            <%# Eval("NombreCompleto") %>
                                                        </p>
                                                        <p class="text-xs text-on-surface-variant">
                                                            <%# Eval("RolDescripcion") %>
                                                        </p>
                                                    </div>
                                                    <asp:LinkButton ID="lnkRemoveFirmante" runat="server"
                                                        CommandArgument='<%# Eval("LoginUsuario") %>'
                                                        OnClick="RemoveFirmante_Click"
                                                        CausesValidation="false"
                                                        CssClass="material-symbols-outlined text-outline hover:text-error cursor-pointer"
                                                        Text="delete" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <div class="flex items-center gap-2">
                                        <asp:DropDownList ID="ddlFirmante" runat="server"
                                            CssClass="flex-1 bg-surface-container-high border-0 border-b-2 border-outline focus:border-primary-container focus:ring-0 rounded-t-sm px-4 py-2 text-sm text-on-surface font-body"
                                            DataValueField="LoginUsuario" DataTextField="NombreCompleto"
                                            AppendDataBoundItems="true">
                                            <asp:ListItem Value="" Text="-- Añadir Firmante --" />
                                        </asp:DropDownList>
                                        <asp:Button ID="btnAddFirmante" runat="server" Text="Añadir"
                                            CausesValidation="false"
                                            OnClick="btnAddFirmante_Click"
                                            CssClass="px-4 py-2 bg-surface-container-highest text-primary-container font-medium text-sm rounded hover:bg-surface-variant transition-colors" />
                                    </div>
                                    <asp:CustomValidator ID="cvFirmantes" runat="server"
                                        ErrorMessage="Debe agregar al menos un firmante"
                                        CssClass="text-xs text-error mt-1"
                                        OnServerValidate="cvFirmantes_ServerValidate" />
                                </div>
                            </div>
                        </div>

                        <!-- Botones Acción -->
                        <div class="flex items-center justify-end gap-4 pt-6 border-t border-outline-variant/20">
                            <asp:HyperLink ID="hlCancelar" runat="server"
                                NavigateUrl="~/Formularios/Documentos/frmDashboardRegistrador.aspx"
                                CssClass="px-6 py-3 text-primary-container font-medium text-sm rounded-md hover:bg-surface-container-highest transition-colors"
                                Text="Cancelar" />
                            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar y Enviar"
                                OnClick="btnRegistrar_Click"
                                CssClass="px-8 py-3 bg-gradient-to-br from-primary to-primary-container text-white font-bold text-sm rounded-md shadow-md hover:shadow-lg transition-all flex items-center gap-2" />
                        </div>
                    </div>
            </div>
            </main>
            </div>
        </form>
    </body>

    </html>