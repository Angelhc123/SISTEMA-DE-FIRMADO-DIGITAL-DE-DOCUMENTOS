<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmInterfazRevisor.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Revision.frmInterfazRevisor" %>

<!DOCTYPE html>
<html class="light" lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Interfaz de Revisión - SDF ZOFRATACNA</title>

    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet" />
    
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary-container": "#001e40",
                        "surface": "#faf9fc",
                        "on-surface": "#1a1c1e"
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-surface text-on-surface font-sans h-screen w-screen overflow-hidden flex antialiased">
    <form id="form1" runat="server" class="flex w-full h-full">
        
        <nav class="bg-white dark:bg-slate-950 text-[#001E40] w-72 border-r shadow-lg flex flex-col py-8 z-50">
            <div class="px-6 mb-10 flex items-center gap-4">
                <div class="w-10 h-10 bg-primary-container rounded-lg flex items-center justify-center text-white">
                    <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">account_balance</span>
                </div>
                <div>
                    <h1 class="text-lg font-black tracking-tighter uppercase">SDF ZOFRATACNA</h1>
                    <p class="text-xs text-slate-500">Sistema de Firmado Digital</p>
                </div>
            </div>
            
            <div class="flex-1 flex flex-col gap-1">
                <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 hover:bg-slate-100 transition-all" href="~/Formularios/Revision/frmDashboardRevisor.aspx">
                    <span class="material-symbols-outlined">dashboard</span> Dashboard
                </a>
                <a runat="server" class="flex items-center gap-3 px-6 py-4 text-[#001E40] bg-slate-100 font-bold border-r-4 border-[#001E40]" href="~/Formularios/Revision/frmMisDocumentosRevisor.aspx">
                    <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">description</span> Mis Documentos
                </a>
                <a class="flex items-center gap-3 px-6 py-4 text-slate-300 cursor-not-allowed opacity-50">
                    <span class="material-symbols-outlined">add_box</span> Registrar Nuevo
                </a>
                <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 hover:bg-slate-100 transition-all" href="~/Formularios/Revision/frmArchivoRevisor.aspx">
                    <span class="material-symbols-outlined">archive</span> Archivo
                </a>
                <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 hover:bg-slate-100 transition-all" href="~/Formularios/Comunes/frmMiPerfil.aspx">
                    <span class="material-symbols-outlined">settings</span> Ajustes
                </a>
                <a runat="server" class="flex items-center gap-3 px-6 py-4 text-slate-500 hover:bg-slate-100 transition-all" href="~/Formularios/Comunes/frmSoporte.aspx">
                    <span class="material-symbols-outlined">support_agent</span> Soporte
                </a>
            </div>

            <div class="mt-auto px-6 pt-8 border-t border-slate-100">
                <div class="flex items-center gap-3">
                    <asp:Image ID="imgPerfil" runat="server" CssClass="w-8 h-8 rounded-full object-cover" ImageUrl="https://lh3.googleusercontent.com/aida-public/AB6AXuAxf9SdqTbPjer2dg9PAupFQONTIQTkgyjwXhbDcnh7zHVP1hXl_iV_DCndzd_WU3RuW9x0ttQzSOCrk7fn1Qv50tKNNyUlRvNTCcWdtuSkp56R2tfwBhIEm6qDfiu_nfGGSwrBORym57Mnl3LsNkwt-xsXe9WifyIJcBOeSrou0z6dzAB9l_TskKlZ1TPBlLVxr-FG2tGng0DIyAFFdttJ_vQKfCzikEFL46SHO33iDbcMavvZSKm1YDbC6SBu1KPrMQ_nfLEs62k2" />
                    <div class="flex flex-col">
                        <asp:Label ID="lblNombreUsuario" runat="server" CssClass="text-sm font-bold text-[#001E40]" Text="Revisor"></asp:Label>
                        <asp:Label ID="lblRolUsuario" runat="server" CssClass="text-xs text-slate-500" Text="Gerencia Legal"></asp:Label>
                    </div>
                </div>
            </div>
        </nav>

        <div class="flex-1 flex flex-col h-screen relative">
            <header class="bg-white/80 backdrop-blur-xl h-16 z-40 flex items-center justify-between px-10 border-b">
                <div class="flex items-center gap-2 text-slate-400">
                    <span class="material-symbols-outlined">folder_open</span>
                    <asp:Label ID="lblExpedienteTitulo" runat="server" Text="Revisión de Expediente #EXP-2023-0892" CssClass="font-medium text-slate-700"></asp:Label>
                </div>
                <div class="flex items-center gap-6">
                    <asp:LinkButton ID="btnCerrarSesion" runat="server" CssClass="flex items-center gap-2 text-slate-500 hover:text-red-600 transition-colors" OnClick="btnCerrarSesion_Click">
                        <span class="material-symbols-outlined">logout</span> <span class="font-medium">Cerrar Sesión</span>
                    </asp:LinkButton>
                </div>
            </header>

            <main class="flex-1 flex overflow-hidden">
                <div class="flex-1 bg-gray-200 overflow-y-auto p-8 flex justify-center">
                    <div class="w-full max-w-4xl bg-white shadow-2xl p-16 min-h-[1100px] border">
                        <h2 class="text-2xl font-bold border-b-2 pb-4 mb-6 text-primary-container">RESOLUCIÓN DIRECTORAL</h2>
                        <div class="text-justify leading-relaxed space-y-4">
                            <p><strong>VISTO:</strong> El Informe N° 128-2023-OAJ-ZOFRATACNA...</p>
                            <p><strong>CONSIDERANDO:</strong> Que, mediante Ley N° 27688...</p>
                            <div class="bg-blue-50 p-4 border-l-4 border-blue-500 italic text-sm">
                                Nota: Revisar el artículo 2 antes de proceder.
                            </div>
                        </div>
                    </div>
                </div>

                <aside class="w-[420px] bg-white shadow-2xl flex flex-col border-l">
                    <div class="p-8">
                        <div class="inline-flex items-center gap-2 bg-blue-100 text-blue-800 px-3 py-1 rounded-full mb-4">
                            <span class="material-symbols-outlined text-sm">pending_actions</span>
                            <span class="text-xs font-bold uppercase">Acción Requerida</span>
                        </div>
                        <h2 class="text-2xl font-bold text-slate-800">Dictamen de Revisión</h2>
                    </div>

                    <div class="px-8 py-4 bg-slate-50 space-y-3">
                        <div>
                            <span class="text-[10px] text-slate-400 font-bold uppercase">Remitente</span>
                            <asp:Label ID="lblRemitente" runat="server" CssClass="block text-sm font-semibold text-slate-700" Text="Dr. Carlos Mendoza (Of. Legal)"></asp:Label>
                        </div>
                        <div>
                            <span class="text-[10px] text-slate-400 font-bold uppercase">Prioridad</span>
                            <div class="flex items-center gap-2 text-red-600 font-bold text-sm">
                                <span class="w-2 h-2 rounded-full bg-red-600"></span> Alta - Urgente
                            </div>
                        </div>
                    </div>

                    <div class="p-8 flex-1 flex flex-col gap-6">
                        <div class="flex-1 flex flex-col">
                            <label class="text-xs font-bold text-slate-500 uppercase mb-2">Comentarios u Observaciones</label>
                            <asp:TextBox ID="txtObservaciones" runat="server" TextMode="MultiLine" Rows="8" 
                                CssClass="w-full bg-slate-50 border-b-2 border-slate-300 focus:border-blue-900 focus:ring-0 rounded-t p-4 text-sm transition-all"
                                placeholder="Escriba aquí sus observaciones..."></asp:TextBox>
                        </div>

                        <div class="flex flex-col gap-3 mt-auto">
                            <asp:LinkButton ID="btnAprobar" runat="server" OnClick="btnAprobar_Click"
                                CssClass="w-full bg-blue-900 text-white rounded-md py-4 font-bold uppercase text-xs flex items-center justify-center gap-2 hover:bg-blue-800 shadow-md">
                                <span class="material-symbols-outlined">check_circle</span> Conforme (Visto Bueno)
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnObservar" runat="server" OnClick="btnObservar_Click"
                                CssClass="w-full bg-slate-200 text-slate-700 rounded-md py-4 font-bold uppercase text-xs flex items-center justify-center gap-2 hover:bg-slate-300">
                                <span class="material-symbols-outlined text-red-600">report</span> Observado (Devolver)
                            </asp:LinkButton>
                        </div>
                    </div>
                </aside>
            </main>
        </div>
    </form>
</body>
</html>