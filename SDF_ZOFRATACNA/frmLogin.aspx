<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="SDF_ZOFRATACNA.Recursos.frmLogin"
    %>

    <!DOCTYPE html>
    <html lang="es">

    <head runat="server">
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <title>SDF ZOFRATACNA - Iniciar Sesión</title>

        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Public+Sans:wght@400;600;700&display=swap"
            rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght@100..700&display=swap"
            rel="stylesheet" />
        <script src="https://cdn.tailwindcss.com?plugins=forms"></script>

        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            "primary": "#001e40",
                            "primary-container": "#003366",
                            "surface": "#f8f9fb"
                        }
                    }
                }
            }
        </script>
    </head>

    <body
        class="bg-[#f8f9fb] font-sans text-[#191c1e] antialiased min-h-screen flex items-center justify-center relative overflow-hidden">

        <div class="absolute inset-0 z-0 bg-gradient-to-br from-slate-200/90 to-slate-50/95 backdrop-blur-sm"></div>

        <main class="relative z-10 w-full max-w-[28rem] mx-4">
            <form id="form1" runat="server"
                class="bg-white rounded-xl shadow-[0_20px_40px_rgba(25,28,30,0.06)] border border-slate-200 overflow-hidden">

                <div class="px-8 pt-10 pb-6 flex flex-col items-center border-b border-slate-100">
                    <div
                        class="w-16 h-16 bg-slate-50 rounded-full flex items-center justify-center mb-4 shadow-sm border border-slate-200">
                        <span class="material-symbols-outlined text-primary text-3xl"
                            style="font-variation-settings: 'FILL' 1;">shield_person</span>
                    </div>
                    <h1 class="font-bold text-2xl text-primary tracking-tight text-center leading-tight">SDF ZOFRATACNA
                    </h1>
                    <p class="text-sm text-slate-500 mt-1.5 text-center italic">Arquitectura de Confianza</p>
                </div>

                <div class="p-8 space-y-6">

                    <div class="space-y-1.5">
                        <label class="text-sm font-medium text-slate-700 block">Rol de Usuario</label>
                        <div class="relative">
                            <span
                                class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 text-[20px]">badge</span>
                            <asp:DropDownList ID="ddlRol" runat="server"
                                CssClass="block w-full pl-10 pr-10 py-3 text-sm bg-slate-50 border border-slate-200 rounded-lg appearance-none focus:ring-2 focus:ring-primary/10 transition-all">
                                <asp:ListItem Text="Seleccione su rol" Value="" Selected="True" />
                                <asp:ListItem Text="Administrador" Value="ADMIN" />
                                <asp:ListItem Text="Registrador" Value="REG" />
                                <asp:ListItem Text="Firmador" Value="FIR" />
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="space-y-1.5">
                        <label class="text-sm font-medium text-slate-700 block">Usuario</label>
                        <div class="relative">
                            <span
                                class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 text-[20px]">person</span>
                            <asp:TextBox ID="txtUsername" runat="server"
                                CssClass="block w-full pl-10 pr-4 py-3 text-sm bg-slate-50 border border-slate-200 rounded-lg focus:ring-2 focus:ring-primary/10"
                                placeholder="Ingrese su identificador"></asp:TextBox>
                        </div>
                    </div>

                    <div class="space-y-1.5">
                        <div class="flex items-center justify-between">
                            <label class="text-sm font-medium text-slate-700 block">Contraseña</label>
                            <asp:LinkButton ID="btnOlvido" runat="server"
                                CssClass="text-xs font-medium text-primary hover:underline">¿Olvidó su contraseña?
                            </asp:LinkButton>
                        </div>
                        <div class="relative">
                            <span
                                class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 text-[20px]">lock</span>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"
                                CssClass="block w-full pl-10 pr-4 py-3 text-sm bg-slate-50 border border-slate-200 rounded-lg focus:ring-2 focus:ring-primary/10"
                                placeholder="••••••••"></asp:TextBox>
                        </div>
                    </div>

                    <div class="pt-2">
                        <asp:LinkButton ID="btnLogin" runat="server" OnClick="btnLogin_Click"
                            CssClass="w-full flex items-center justify-center gap-2 bg-gradient-to-r from-[#001e40] to-[#003366] text-white font-semibold text-sm py-3.5 rounded-lg shadow-sm hover:opacity-95 active:scale-[0.98] transition-all">
                            Ingresar al Sistema
                            <span class="material-symbols-outlined text-[18px]">login</span>
                        </asp:LinkButton>
                    </div>

                    <asp:Label ID="lblMessage" runat="server" CssClass="text-xs text-red-600 text-center block mt-2"
                        Visible="false"></asp:Label>
                </div>

                <div class="bg-slate-50 py-4 px-8 border-t border-slate-100 text-center">
                    <p class="text-[11px] text-slate-400">Acceso restringido a personal autorizado.</p>
                </div>
            </form>

            <div class="mt-6 text-center">
                <p class="text-xs text-slate-400/70 italic">© 2026 ZOFRATACNA. Sistema de Firma Digital v2.1</p>
            </div>
        </main>
    </body>

    </html>