<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmInterfazRevisor.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Firma.frmInterfazRevisor" %>
<!DOCTYPE html>

<html lang="es">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Interfaz de Revisión - SDF ZOFRATACNA</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@400;600;700;800;900&family=Inter:wght@400;500;600&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: { "primary": "#001e40", "primary-container": "#003366", "surface": "#f8f9fb", "surface-container-low": "#f2f4f6", "surface-container-lowest": "#ffffff", "on-surface": "#191c1e", "on-surface-variant": "#43474f", "outline": "#737780", "outline-variant": "#c3c6d1", "error": "#ba1a1a", "error-container": "#ffdad6", "tertiary": "#381300", "tertiary-fixed": "#ffdbca", "primary-fixed": "#d5e3ff" },
                    borderRadius: { DEFAULT: "0.125rem", lg: "0.25rem", xl: "0.5rem", full: "0.75rem" },
                    fontFamily: { headline: ["Public Sans"], body: ["Inter"], label: ["Inter"] }
                }
            }
        }
    </script>
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f8f9fb; }
        h1, h2, h3, h4, h5, h6 { font-family: 'Public Sans', sans-serif; }
    </style>
</head>
<body class="bg-surface text-on-surface antialiased flex h-screen overflow-hidden">
    <form id="form1" runat="server" class="flex w-full h-screen overflow-hidden">
        
       <!-- SideNavBar Unificada -->
<nav class="bg-white dark:bg-slate-900 fixed left-0 top-0 h-screen w-72 border-r border-outline-variant/20 z-40 shadow-[4px_0_20px_rgba(0,30,64,0.03)]">
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
            
            <!-- Dashboard (Activo) -->
            <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-primary bg-primary-fixed/30 font-semibold" href="~/Formularios/Firma/frmDashboardFirmante.aspx">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">dashboard</span>
                <span>Dashboard</span>
            </a>
            
            <!-- Mis Documentos (Firmar) -->
            <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-low transition-all duration-200" href="~/Formularios/Firma/frmMisDocumentosFirmante.aspx">
                <span class="material-symbols-outlined">draw</span>
                <span>Por Firmar</span>
                <span class="ml-auto bg-error-container text-error text-xs font-bold px-2 py-0.5 rounded-full">4</span>
            </a>
            
            <!-- Mis Documentos (Revisar) -->
            <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-low transition-all duration-200" href="~/Formularios/Firma/frmMisDocumentosRevisor.aspx">
                <span class="material-symbols-outlined">rate_review</span>
                <span>Por Revisar</span>
                <span class="ml-auto bg-tertiary-fixed text-tertiary text-xs font-bold px-2 py-0.5 rounded-full">12</span>
            </a>
            
            <div class="h-px bg-outline-variant/30 my-4 mx-2"></div>
            <p class="px-3 text-[10px] font-bold text-outline uppercase tracking-wider mt-2 mb-2">Archivos</p>
            
            <!-- Archivo Firmante -->
            <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-low transition-all duration-200" href="~/Formularios/Firma/frmArchivoFirmante.aspx">
                <span class="material-symbols-outlined">checklist</span>
                <span>Documentos Firmados</span>
            </a>
            
            <!-- Archivo Revisor -->
            <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-low transition-all duration-200" href="~/Formularios/Firma/frmArchivoRevisor.aspx">
                <span class="material-symbols-outlined">history</span>
                <span>Historial de Revisiones</span>
            </a>
            
            <div class="h-px bg-outline-variant/30 my-4 mx-2"></div>
            <p class="px-3 text-[10px] font-bold text-outline uppercase tracking-wider mt-2 mb-2">Sistema</p>
            
            <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-low transition-all duration-200" href="~/Formularios/Comunes/frmMiPerfil.aspx">
                <span class="material-symbols-outlined">settings</span>
                <span>Ajustes</span>
            </a>
            <a runat="server" class="flex items-center gap-3 px-4 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container-low transition-all duration-200" href="~/Formularios/Comunes/frmSoporte.aspx">
                <span class="material-symbols-outlined">contact_support</span>
                <span>Soporte</span>
            </a>
        </div>
        
        <div class="mt-auto p-4 border-t border-outline-variant/20">
            <div class="flex items-center gap-3">
                <asp:Image ID="imgPerfil" runat="server" CssClass="w-10 h-10 rounded-full object-cover border-2 border-white shadow-sm" ImageUrl="https://ui-avatars.com/api/?background=001e40&color=fff&name=Usuario" />
                <div class="flex-1">
                    <asp:Label ID="lblNombreUsuario" runat="server" CssClass="text-sm font-semibold text-primary block" Text="Usuario"></asp:Label>
                    <asp:Label ID="lblRolUsuario" runat="server" CssClass="text-xs text-on-surface-variant" Text="Firmante / Revisor"></asp:Label>
                </div>
                <asp:LinkButton ID="btnLogout" runat="server" CssClass="text-outline hover:text-error transition-colors" OnClick="btnLogout_Click">
                    <span class="material-symbols-outlined">logout</span>
                </asp:LinkButton>
            </div>
        </div>
    </div>
</nav>

        <!-- TOPNAVBAR UNIFICADA -->
        <header class="bg-white/85 backdrop-blur-md fixed top-0 right-0 w-full md:w-[calc(100%-18rem)] h-16 z-50 shadow-sm border-b border-outline-variant/20">
            <div class="flex items-center justify-between px-8 h-full">
                <div class="flex-1 max-w-md relative hidden md:block">
                    <span class="material-symbols-outlined absolute left-3 top-1/2 transform -translate-y-1/2 text-outline">search</span>
                    <asp:TextBox ID="txtBuscarGlobal" runat="server" CssClass="w-full bg-surface-container-low border border-outline-variant/30 rounded-full py-2 pl-10 pr-4 text-sm" placeholder="Buscar..."></asp:TextBox>
                </div>
                <div class="flex items-center space-x-4">
                    <button type="button" class="text-outline hover:text-primary transition-all relative">
                        <span class="material-symbols-outlined">notifications</span>
                        <span class="absolute -top-1 -right-1 w-3 h-3 bg-error rounded-full"></span>
                    </button>
                    <div class="h-6 w-px bg-outline-variant/30"></div>
                    <div class="flex items-center gap-2">
                        <div class="text-right hidden sm:block">
                            <p class="text-xs text-on-surface-variant">Bienvenido/a</p>
                            <asp:Label ID="lblNombreTop" runat="server" CssClass="text-sm font-semibold text-primary" Text="Revisor"></asp:Label>
                        </div>
                        <asp:Image ID="imgPerfilTop" runat="server" CssClass="w-8 h-8 rounded-full border border-outline-variant/30" ImageUrl="https://ui-avatars.com/api/?background=001e40&color=fff&name=User" />
                    </div>
                </div>
            </div>
        </header>

        <!-- MAIN CONTENT - Interfaz de Revisión -->
        <div class="flex-1 flex flex-col md:ml-72 relative w-full h-screen overflow-hidden">
            <main class="flex-1 flex overflow-hidden pt-16">
                <!-- Panel Izquierdo: Visualizador del Documento -->
                <div class="flex-1 bg-gray-100 overflow-y-auto p-6 flex justify-center">
                    <div class="w-full max-w-4xl bg-white shadow-xl rounded-xl p-10 min-h-[600px] border">
                        <div class="flex items-center justify-between mb-6 border-b pb-4">
                            <h2 class="text-2xl font-bold text-primary">RESOLUCIÓN DIRECTORAL</h2>
                            <asp:Label ID="lblExpedienteTitulo" runat="server" Text="EXP-2023-0892" CssClass="text-sm bg-gray-100 px-3 py-1 rounded-full text-gray-600"></asp:Label>
                        </div>
                        <div class="text-justify leading-relaxed space-y-4">
                            <p><strong>VISTO:</strong> El Informe N° 128-2023-OAJ-ZOFRATACNA, mediante el cual se solicita la aprobación del Plan Operativo Anual para el ejercicio fiscal 2024, presentado por la Gerencia de Planificación y Desarrollo.</p>
                            <p><strong>CONSIDERANDO:</strong> Que, mediante Ley N° 27688, se establece el marco normativo para la gestión administrativa de ZOFRATACNA, otorgando facultades a la Dirección Ejecutiva para aprobar los instrumentos de gestión.</p>
                            <p>Que, el artículo 15° del Reglamento de Organización y Funciones (ROF) establece que toda resolución directoral debe contar con la revisión y visto bueno de la Oficina de Asesoría Jurídica previo a su emisión.</p>
                            <div class="bg-blue-50 p-4 border-l-4 border-blue-500 italic text-sm">
                                <strong>Nota del Remitente:</strong> Revisar el artículo 2 del proyecto de resolución, específicamente la cláusula referente a los plazos de implementación del POI 2024.
                            </div>
                            <p><strong>POR TANTO:</strong> En uso de las facultades conferidas por la Ley N° 27688 y el Estatuto de ZOFRATACNA;</p>
                            <p class="mt-4"><strong>SE RESUELVE:</strong></p>
                            <p>Artículo 1°.- APROBAR el Plan Operativo Institucional (POI) para el ejercicio fiscal 2024, que consta de 128 páginas y forma parte integrante de la presente resolución.</p>
                            <p>Artículo 2°.- ENCARGAR a la Gerencia de Planificación la implementación del POI 2024, debiendo reportar trimestralmente los avances a esta Dirección.</p>
                        </div>
                    </div>
                </div>

                <!-- Panel Derecho: Acciones de Revisión -->
                <aside class="w-[420px] bg-white shadow-xl flex flex-col border-l border-outline-variant/20 overflow-y-auto">
                    <div class="p-6 border-b border-outline-variant/20 bg-surface-container-low/30">
                        <div class="inline-flex items-center gap-2 bg-tertiary-fixed text-tertiary px-3 py-1 rounded-full mb-4">
                            <span class="material-symbols-outlined text-sm">pending_actions</span>
                            <span class="text-xs font-bold uppercase">Acción Requerida</span>
                        </div>
                        <h2 class="text-2xl font-bold text-primary">Dictamen de Revisión</h2>
                        <p class="text-sm text-on-surface-variant mt-1">Complete el formulario para emitir su pronunciamiento</p>
                    </div>

                    <div class="px-6 py-4 bg-surface-container-low/20 space-y-4">
                        <div>
                            <span class="text-[10px] text-outline font-bold uppercase tracking-wider">Remitente</span>
                            <p class="text-sm font-semibold text-on-surface">Dr. Carlos Mendoza</p>
                            <p class="text-xs text-on-surface-variant">Oficina de Asesoría Jurídica</p>
                        </div>
                        <div>
                            <span class="text-[10px] text-outline font-bold uppercase tracking-wider">Prioridad</span>
                            <div class="flex items-center gap-2 text-error font-bold text-sm mt-1">
                                <span class="w-2 h-2 rounded-full bg-error"></span> Alta - Urgente (Vence hoy)
                            </div>
                        </div>
                        <div>
                            <span class="text-[10px] text-outline font-bold uppercase tracking-wider">Fecha Recepción</span>
                            <p class="text-sm text-on-surface">25 de octubre de 2023 - 09:30 AM</p>
                        </div>
                    </div>

                    <div class="p-6 flex-1 flex flex-col gap-6">
                        <div class="flex-1 flex flex-col">
                            <label class="text-xs font-bold text-outline uppercase tracking-wider mb-2">Comentarios u Observaciones</label>
                            <asp:TextBox ID="txtObservaciones" runat="server" TextMode="MultiLine" Rows="8" 
                                CssClass="w-full bg-surface-container-low border border-outline-variant/30 rounded-lg p-4 text-sm focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all"
                                placeholder="Escriba aquí sus observaciones, correcciones o comentarios..."></asp:TextBox>
                        </div>

                        <div class="flex flex-col gap-3 mt-auto">
                            <asp:LinkButton ID="btnAprobar" runat="server" OnClick="btnAprobar_Click"
                                CssClass="w-full bg-primary text-white rounded-xl py-3.5 font-bold text-sm flex items-center justify-center gap-2 hover:bg-primary-container transition-all shadow-md">
                                <span class="material-symbols-outlined">check_circle</span> Conforme - Aprobar Documento
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnObservar" runat="server" OnClick="btnObservar_Click"
                                CssClass="w-full bg-white border-2 border-error text-error rounded-xl py-3.5 font-bold text-sm flex items-center justify-center gap-2 hover:bg-error-container/30 transition-all">
                                <span class="material-symbols-outlined">report</span> Observar - Devolver con Correcciones
                            </asp:LinkButton>
                            
                            <asp:LinkButton ID="btnCancelar" runat="server" CssClass="w-full text-on-surface-variant text-sm py-2 hover:text-primary transition-colors text-center" OnClick="btnCancelar_Click">
                                Cancelar y volver a la bandeja
                            </asp:LinkButton>
                        </div>
                    </div>
                </aside>
            </main>
        </div>
    </form>
</body>
</html>