<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="SDF_ZOFRATACNA.Recursos.frmLogin" %>
<!DOCTYPE html>

<html lang="es"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>SDF ZOFRATACNA - Iniciar Sesión</title>
<!-- Fonts: Public Sans (Headline) & Inter (Body) -->
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&amp;family=Public+Sans:wght@400;600;700&amp;display=swap" rel="stylesheet"/>
<!-- Material Symbols -->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<!-- Tailwind Configuration (Design Tokens) -->
<script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            "colors": {
                    "inverse-surface": "#2d3133",
                    "tertiary": "#381300",
                    "secondary-container": "#cbe7f5",
                    "surface-container": "#eceef0",
                    "primary": "#001e40",
                    "surface-container-high": "#e6e8ea",
                    "primary-fixed-dim": "#a7c8ff",
                    "surface-container-highest": "#e0e3e5",
                    "on-primary-container": "#799dd6",
                    "on-primary-fixed-variant": "#1f477b",
                    "surface-container-low": "#f2f4f6",
                    "on-tertiary-container": "#d8885c",
                    "surface-variant": "#e0e3e5",
                    "primary-container": "#003366",
                    "on-surface": "#191c1e",
                    "on-secondary-fixed": "#021f29",
                    "on-secondary": "#ffffff",
                    "surface-bright": "#f8f9fb",
                    "error-container": "#ffdad6",
                    "on-primary-fixed": "#001b3c",
                    "tertiary-container": "#592300",
                    "tertiary-fixed": "#ffdbca",
                    "outline-variant": "#c3c6d1",
                    "surface": "#f8f9fb",
                    "inverse-primary": "#a7c8ff",
                    "on-surface-variant": "#43474f",
                    "surface-tint": "#3a5f94",
                    "on-tertiary": "#ffffff",
                    "on-tertiary-fixed": "#341100",
                    "inverse-on-surface": "#eff1f3",
                    "primary-fixed": "#d5e3ff",
                    "secondary-fixed-dim": "#afcbd8",
                    "on-background": "#191c1e",
                    "secondary": "#48626e",
                    "error": "#ba1a1a",
                    "on-primary": "#ffffff",
                    "on-secondary-container": "#4e6874",
                    "background": "#f8f9fb",
                    "on-secondary-fixed-variant": "#304a55",
                    "on-tertiary-fixed-variant": "#723610",
                    "surface-dim": "#d8dadc",
                    "on-error-container": "#93000a",
                    "secondary-fixed": "#cbe7f5",
                    "surface-container-lowest": "#ffffff",
                    "on-error": "#ffffff",
                    "tertiary-fixed-dim": "#ffb690",
                    "outline": "#737780"
            },
            "borderRadius": {
                    "DEFAULT": "0.125rem",
                    "lg": "0.25rem",
                    "xl": "0.5rem",
                    "full": "0.75rem"
            },
            "spacing": {},
            "fontFamily": {
                    "headline": [
                            "Public Sans"
                    ],
                    "body": [
                            "Inter"
                    ],
                    "label": [
                            "Inter"
                    ]
            }
          },
        },
      }
    </script>
</head>
<body class="bg-background font-body text-on-surface antialiased min-h-screen flex items-center justify-center relative overflow-hidden">
<!-- Decorative Institutional Background -->
<div class="absolute inset-0 z-0 bg-cover bg-center opacity-30 mix-blend-multiply" data-alt="Abstract modern architecture facade, clean vertical lines of glass and steel reflecting soft daylight, institutional and secure atmosphere, muted cool color palette" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuAFr6lHXqqKZi7dthIrXDk9SNL5dXmU5lI3qyyXd7ziSarfWjVKrnUZViSY-44_iisDzmgtDZN0tmisItEOr_oyIqLuWdUdt9bDbootZZvxC_2c2feYE2u8OArTFapZQ-bQn1aUt3ypo7gmjAdkWxmkrQly3vn-mAvvhImDa3v2Qi6K6b0LS2g_uF23cEAqHPccRnWK1UOURgcBuIuku4aJmMsUBmYPMvRfP1DZALXlqVkQiS9zrBDwCNrdgAP8cQhAshoiKjvAGMi3');">
</div>
<!-- Subtle gradient overlay to ensure text readability and brand tone -->
<div class="absolute inset-0 z-0 bg-gradient-to-br from-surface-container-low/90 to-background/95 backdrop-blur-sm"></div>
<!-- Main Login Card -->
<!-- Applying Glassmorphism & specific shadow from Design System: 0 20px 40px rgba(25, 28, 30, 0.06) -->
<main class="relative z-10 w-full max-w-[28rem] mx-4">
<div class="bg-surface-container-lowest rounded-xl shadow-[0_20px_40px_rgba(25,28,30,0.06)] border border-outline-variant/15 overflow-hidden">
<!-- Header Section -->
<div class="px-8 pt-10 pb-6 flex flex-col items-center border-b border-surface-container/50">
<div class="w-16 h-16 bg-surface-container-low rounded-full flex items-center justify-center mb-4 shadow-sm border border-outline-variant/15">
<span class="material-symbols-outlined text-primary text-3xl" style="font-variation-settings: 'FILL' 1;">
                        shield_person
                    </span>
</div>
<h1 class="font-headline font-bold text-2xl text-primary tracking-tight text-center leading-tight">
                    SDF ZOFRATACNA
                </h1>
<p class="font-body text-sm text-on-surface-variant mt-1.5 text-center">
                    Arquitectura de Confianza
                </p>
</div>
<!-- Form Section -->
<div class="p-8">
<form id="loginForm" class="space-y-6" onsubmit="event.preventDefault(); return doLogin();">
<!-- Role Selector -->
<div class="space-y-1.5">
<label class="font-label text-sm font-medium text-on-surface block" for="role">
                            Rol de Usuario
                        </label>
<div class="relative">
<div class="absolute inset-y-0 left-0 pl-3.5 flex items-center pointer-events-none">
<span class="material-symbols-outlined text-outline text-[20px]">
                                    badge
                                </span>
</div>
<!-- Styling: Ghost borders, primary focus ring, surface background -->
<select class="block w-full pl-10 pr-10 py-3 text-sm text-on-surface bg-surface border border-outline-variant/15 rounded-lg appearance-none focus:outline-none focus:ring-2 focus:ring-primary/10 focus:border-outline-variant/30 transition-shadow duration-200" id="role" name="role">
<option disabled="" selected="" value="">Seleccione su rol</option>
<option value="admin">Administrador</option>
<option value="registrar">Registrador</option>
<option value="reviewer">Revisor</option>
<option value="signer">Firmador</option>
</select>
<div class="absolute inset-y-0 right-0 pr-3.5 flex items-center pointer-events-none">
<span class="material-symbols-outlined text-outline text-[20px]">
                                    expand_more
                                </span>
</div>
</div>
</div>
<!-- Username Field -->
<div class="space-y-1.5">
<label class="font-label text-sm font-medium text-on-surface block" for="username">
                            Usuario
                        </label>
<div class="relative">
<div class="absolute inset-y-0 left-0 pl-3.5 flex items-center pointer-events-none">
<span class="material-symbols-outlined text-outline text-[20px]">
                                    person
                                </span>
</div>
<input class="block w-full pl-10 pr-4 py-3 text-sm text-on-surface bg-surface border border-outline-variant/15 rounded-lg placeholder-outline focus:outline-none focus:ring-2 focus:ring-primary/10 focus:border-outline-variant/30 transition-shadow duration-200" id="username" name="username" placeholder="Ingrese su identificador" required="" type="text"/>
</div>
</div>
<!-- Password Field -->
<div class="space-y-1.5">
<div class="flex items-center justify-between">
<label class="font-label text-sm font-medium text-on-surface block" for="password">
                                Contraseña
                            </label>
</div>
<div class="relative">
<div class="absolute inset-y-0 left-0 pl-3.5 flex items-center pointer-events-none">
<span class="material-symbols-outlined text-outline text-[20px]">
                                    lock
                                </span>
</div>
<input class="block w-full pl-10 pr-10 py-3 text-sm text-on-surface bg-surface border border-outline-variant/15 rounded-lg placeholder-outline focus:outline-none focus:ring-2 focus:ring-primary/10 focus:border-outline-variant/30 transition-shadow duration-200" id="password" name="password" placeholder="••••••••" required="" type="password"/>
<!-- Optional visibility toggle purely structural for design completeness -->
<button class="absolute inset-y-0 right-0 pr-3.5 flex items-center text-outline hover:text-on-surface-variant transition-colors" type="button">
<span class="material-symbols-outlined text-[20px]">
                                    visibility_off
                                </span>
</button>
</div>
<!-- Forgot Password Link inside context -->
<div class="flex justify-end pt-1">
<a class="text-xs font-medium text-primary hover:text-primary-container hover:underline transition-colors" href="#">
                                ¿Olvidó su contraseña?
                            </a>
</div>
</div>
<!-- Submit Button -->
<div class="pt-2">
<!-- Styling: Primary gradient as requested, SemiBold Public Sans -->
<button class="w-full flex items-center justify-center gap-2 bg-gradient-to-r from-primary to-primary-container text-on-primary font-headline font-semibold text-sm py-3.5 px-4 rounded-lg shadow-sm hover:shadow-md hover:opacity-95 transition-all duration-200 ease-out active:scale-[0.98]" type="submit">
                            Ingresar al Sistema
                            <span class="material-symbols-outlined text-[18px]">
                                login
                            </span>
</button>
</div>
</form>
</div>
<!-- Footer Info -->
<div class="bg-surface py-4 px-8 border-t border-outline-variant/10 text-center">
<p class="text-xs text-on-surface-variant">
                    Acceso restringido a personal autorizado.
                </p>
</div>
</div>
<!-- Environmental Support Info -->
<div class="mt-6 text-center">
<p class="text-xs text-on-surface-variant/70 font-body">
                © 2024 ZOFRATACNA. Sistema de Firma Digital v2.1
            </p>
</div>
</main>
<script>
    function doLogin() {
        var role = document.querySelector('input[name="role"]:checked').value;
        if (role === 'Administrador') {
            window.location.href = '/Formularios/Administracion/frmDashboardAdmin.aspx';
        } else if (role === 'Registrador') {
            window.location.href = '/Formularios/Documentos/frmDashboardRegistrador.aspx';
        } else if (role === 'Revisor') {
            window.location.href = '/Formularios/Revision/frmDashboardRevisor.aspx';
        } else if (role === 'Firmante') {
            window.location.href = '/Formularios/Firma/frmDashboardFirmante.aspx';
        }
        return false;
    }
</script>
</body></html>