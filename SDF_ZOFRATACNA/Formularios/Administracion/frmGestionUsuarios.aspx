<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmGestionUsuarios.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Administracion.frmGestionUsuarios" %>
<!DOCTYPE html>

<html class="light" lang="es"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Gestión de Usuarios - SDF ZOFRATACNA</title>
<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&amp;family=Public+Sans:wght@600;700&amp;display=swap" rel="stylesheet"/>
<!-- Material Symbols -->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<!-- Tailwind Configuration -->
<script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            "colors": {
                    "surface-container-highest": "#e0e3e5",
                    "primary-fixed-dim": "#a7c8ff",
                    "on-primary-fixed-variant": "#1f477b",
                    "on-primary-container": "#799dd6",
                    "primary": "#001e40",
                    "surface-container-high": "#e6e8ea",
                    "tertiary": "#381300",
                    "surface-container": "#eceef0",
                    "secondary-container": "#cbe7f5",
                    "inverse-surface": "#2d3133",
                    "on-secondary": "#ffffff",
                    "surface-bright": "#f8f9fb",
                    "error-container": "#ffdad6",
                    "tertiary-container": "#592300",
                    "on-primary-fixed": "#001b3c",
                    "on-surface": "#191c1e",
                    "on-secondary-fixed": "#021f29",
                    "surface-variant": "#e0e3e5",
                    "primary-container": "#003366",
                    "surface-container-low": "#f2f4f6",
                    "on-tertiary-container": "#d8885c",
                    "secondary-fixed-dim": "#afcbd8",
                    "on-background": "#191c1e",
                    "secondary": "#48626e",
                    "error": "#ba1a1a",
                    "surface-tint": "#3a5f94",
                    "on-tertiary-fixed": "#341100",
                    "on-tertiary": "#ffffff",
                    "primary-fixed": "#d5e3ff",
                    "inverse-on-surface": "#eff1f3",
                    "tertiary-fixed": "#ffdbca",
                    "outline-variant": "#c3c6d1",
                    "surface": "#f8f9fb",
                    "on-surface-variant": "#43474f",
                    "inverse-primary": "#a7c8ff",
                    "surface-dim": "#d8dadc",
                    "secondary-fixed": "#cbe7f5",
                    "on-error-container": "#93000a",
                    "tertiary-fixed-dim": "#ffb690",
                    "surface-container-lowest": "#ffffff",
                    "on-error": "#ffffff",
                    "outline": "#737780",
                    "on-secondary-fixed-variant": "#304a55",
                    "on-tertiary-fixed-variant": "#723610",
                    "background": "#f8f9fb",
                    "on-primary": "#ffffff",
                    "on-secondary-container": "#4e6874"
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
<body class="bg-background text-on-background font-body min-h-screen antialiased flex">
<!-- SideNavBar (Shared Component) -->
<nav class="bg-surface-container-low font-headline font-semibold tracking-tight fixed left-0 top-0 h-screen w-72 border-r border-transparent flex flex-col p-4 z-40 hidden md:flex">
<!-- Brand -->
<div class="mb-8 px-4 flex items-center gap-3">
<div class="w-10 h-10 rounded-lg bg-primary text-on-primary flex items-center justify-center font-bold text-xl shrink-0">
                Z
            </div>
<div>
<h1 class="text-xl font-bold text-primary truncate" title="SDF ZOFRATACNA">SDF ZOFRATACNA</h1>
<p class="text-xs text-on-surface-variant font-normal">Arquitectura de Confianza</p>
</div>
</div>
<!-- Navigation Links -->
<div class="flex flex-col gap-1 flex-1">
<a class="flex items-center gap-3 px-4 py-3 text-slate-500 hover:text-primary hover:bg-slate-200/50 transition-colors duration-200 rounded-lg group" href="#">
<span class="material-symbols-outlined font-light">dashboard</span>
<span>Dashboard</span>
</a>
<a class="flex items-center gap-3 px-4 py-3 text-slate-500 hover:text-primary hover:bg-slate-200/50 transition-colors duration-200 rounded-lg group" href="#">
<span class="material-symbols-outlined font-light">description</span>
<span>Mis Documentos</span>
</a>
<a class="flex items-center gap-3 px-4 py-3 text-slate-500 hover:text-primary hover:bg-slate-200/50 transition-colors duration-200 rounded-lg group" href="#">
<span class="material-symbols-outlined font-light">add_box</span>
<span>Registrar Nuevo</span>
</a>
<a class="flex items-center gap-3 px-4 py-3 text-slate-500 hover:text-primary hover:bg-slate-200/50 transition-colors duration-200 rounded-lg group" href="#">
<span class="material-symbols-outlined font-light">archive</span>
<span>Archivo</span>
</a>
<!-- Active Tab -->
<a class="flex items-center gap-3 px-4 py-3 text-primary font-bold bg-surface-container-lowest rounded-lg shadow-sm" href="#">
<span class="material-symbols-outlined font-light" style="font-variation-settings: 'FILL' 1;">settings</span>
<span>Ajustes</span>
</a>
<a class="flex items-center gap-3 px-4 py-3 text-slate-500 hover:text-primary hover:bg-slate-200/50 transition-colors duration-200 rounded-lg group" href="#">
<span class="material-symbols-outlined font-light">contact_support</span>
<span>Soporte</span>
</a>
</div>
<!-- Bottom Settings/Profile Hook could go here, omitting for layout simplicity -->
</nav>
<!-- Main Content Canvas -->
<main class="flex-1 md:ml-72 flex flex-col min-h-screen">
<!-- TopNavBar (Shared Component) -->
<header class="bg-surface-bright/85 backdrop-blur-md text-primary font-body text-sm fixed top-0 right-0 w-full md:w-[calc(100%-18rem)] h-16 z-50 shadow-sm flex items-center justify-between px-8 border-b border-surface-container-high/50">
<!-- Left Side (Search or Breadcrumb context) -->
<div class="flex items-center gap-4">
<div class="relative hidden sm:block">
<span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant text-sm">search</span>
<input class="pl-9 pr-4 py-1.5 bg-surface-container-low border border-outline-variant/15 rounded-full text-sm focus:outline-none focus:ring-1 focus:ring-primary/10 transition-all w-64 placeholder:text-on-surface-variant" placeholder="Buscar usuarios..." type="text"/>
</div>
</div>
<!-- Right Side Actions -->
<div class="flex items-center gap-6">
<div class="flex items-center gap-4 text-on-surface-variant">
<button class="opacity-90 hover:opacity-100 hover:text-primary transition-all">
<span class="material-symbols-outlined">notifications</span>
</button>
<button class="opacity-90 hover:opacity-100 hover:text-primary transition-all">
<span class="material-symbols-outlined">help_outline</span>
</button>
</div>
<div class="h-6 w-px bg-outline-variant/30"></div>
<div class="flex items-center gap-3">
<img alt="Usuario Session" class="w-8 h-8 rounded-full border border-surface-container-high" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCQhuGJGUmDdeRPqd1JBBeq21KbHe1zT6cS2Jy1Yc5oHH0KGMybZIKCsW-hYf9Gp9KPsnxECRRWyS3Gveq4x5rvTsd1IegGAV1AaFIDl-TBD4f3mw56tgAv5cXCkEaLO-26rbQi84R0KAKYTdVxLnoE4aCPxScZDrRJ5XfqFBx6bntMmr0NlfSHVJOW3kVGMhUGjJrbLp4_-Ldv64d8w1ZZZLD7ZDizeDHBPTrNxBp9HMkdKetLA_3rRdrdAuDdaeEF4sx9pt4ye8MQ"/>
<button class="text-on-surface-variant hover:text-primary transition-all font-medium text-sm flex items-center gap-1">
                        Cerrar Sesión
                    </button>
</div>
</div>
</header>
<!-- Page Content -->
<div class="flex-1 mt-16 p-6 md:p-10 max-w-[1200px] w-full mx-auto overflow-y-auto">
<!-- Page Header -->
<div class="mb-8 flex flex-col sm:flex-row sm:items-end justify-between gap-4">
<div>
<p class="text-sm font-medium text-on-surface-variant mb-1 font-body">Ajustes / Seguridad</p>
<h2 class="text-3xl font-headline font-semibold text-primary">Gestión de Usuarios</h2>
<p class="text-on-surface-variant font-body mt-2 text-sm max-w-2xl">Administre el acceso al sistema, asigne roles y monitoree la actividad de los empleados autorizados.</p>
</div>
<button class="bg-primary text-on-primary px-5 py-2.5 rounded-lg font-body font-medium flex items-center gap-2 hover:opacity-90 transition-opacity bg-gradient-to-br from-primary to-primary-container shadow-sm shrink-0">
<span class="material-symbols-outlined text-sm">person_add</span>
                    Nuevo Usuario
                </button>
</div>
<!-- Bento Grid Layout -->
<div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
<!-- Main Users List Panel (Takes up 2/3) -->
<div class="lg:col-span-2 bg-surface-container-lowest rounded-xl shadow-[0_20px_40px_rgba(25,28,30,0.02)] flex flex-col overflow-hidden relative z-10 border border-outline-variant/10">
<div class="p-6 border-b border-surface-container-high/50 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
<h3 class="font-headline font-semibold text-lg text-primary">Directorio de Empleados</h3>
<!-- Filters -->
<div class="flex gap-2">
<select class="bg-surface-container text-on-surface text-sm rounded-lg border-none focus:ring-1 focus:ring-primary/10 py-1.5 pl-3 pr-8 cursor-pointer font-body">
<option>Todos los Roles</option>
<option>Administrador</option>
<option>Firma Autorizada</option>
<option>Auditor</option>
</select>
<select class="bg-surface-container text-on-surface text-sm rounded-lg border-none focus:ring-1 focus:ring-primary/10 py-1.5 pl-3 pr-8 cursor-pointer font-body">
<option>Estado: Activo</option>
<option>Estado: Inactivo</option>
<option>Pendiente</option>
</select>
</div>
</div>
<!-- User Table -->
<div class="overflow-x-auto">
<table class="w-full text-left border-collapse font-body text-sm">
<thead>
<tr class="text-outline uppercase text-[11px] tracking-wider font-semibold border-b border-surface-container-high/50">
<th class="px-6 py-4 font-medium">Empleado</th>
<th class="px-6 py-4 font-medium">Rol Asignado</th>
<th class="px-6 py-4 font-medium">Último Acceso</th>
<th class="px-6 py-4 font-medium">Estado</th>
<th class="px-6 py-4 font-medium text-right">Acciones</th>
</tr>
</thead>
<tbody class="divide-y divide-surface-container-high/50">
<!-- Row 1 -->
<tr class="hover:bg-surface-container-high/30 transition-colors group">
<td class="px-6 py-4">
<div class="flex items-center gap-3">
<div class="w-8 h-8 rounded-full bg-secondary-container text-on-secondary-container flex items-center justify-center font-semibold text-xs shrink-0">
                                                CM
                                            </div>
<div>
<p class="font-medium text-on-surface">Carlos Mendoza</p>
<p class="text-xs text-on-surface-variant">cmendoza@zofratacna.gob.pe</p>
</div>
</div>
</td>
<td class="px-6 py-4">
<span class="inline-flex items-center gap-1.5">
<span class="material-symbols-outlined text-[14px] text-on-surface-variant">admin_panel_settings</span>
                                            Administrador
                                        </span>
</td>
<td class="px-6 py-4 text-on-surface-variant text-xs">Hoy, 08:30 AM</td>
<td class="px-6 py-4">
<span class="inline-flex items-center px-2 py-0.5 rounded-full text-[11px] font-medium bg-secondary-fixed text-on-secondary-fixed-variant">
                                            Activo
                                        </span>
</td>
<td class="px-6 py-4 text-right">
<button class="text-on-surface-variant hover:text-primary transition-colors p-1" title="Editar Usuario">
<span class="material-symbols-outlined text-lg">edit</span>
</button>
<button class="text-on-surface-variant hover:text-primary transition-colors p-1" title="Restablecer Contraseña">
<span class="material-symbols-outlined text-lg">lock_reset</span>
</button>
</td>
</tr>
<!-- Row 2 -->
<tr class="hover:bg-surface-container-high/30 transition-colors group">
<td class="px-6 py-4">
<div class="flex items-center gap-3">
<div class="w-8 h-8 rounded-full bg-surface-container-high text-on-surface-variant flex items-center justify-center font-semibold text-xs shrink-0">
                                                LR
                                            </div>
<div>
<p class="font-medium text-on-surface">Lucia Ramirez</p>
<p class="text-xs text-on-surface-variant">lramirez@zofratacna.gob.pe</p>
</div>
</div>
</td>
<td class="px-6 py-4">
<span class="inline-flex items-center gap-1.5">
<span class="material-symbols-outlined text-[14px] text-on-surface-variant">draw</span>
                                            Firma Autorizada
                                        </span>
</td>
<td class="px-6 py-4 text-on-surface-variant text-xs">Ayer, 16:45 PM</td>
<td class="px-6 py-4">
<span class="inline-flex items-center px-2 py-0.5 rounded-full text-[11px] font-medium bg-secondary-fixed text-on-secondary-fixed-variant">
                                            Activo
                                        </span>
</td>
<td class="px-6 py-4 text-right">
<button class="text-on-surface-variant hover:text-primary transition-colors p-1" title="Editar Usuario">
<span class="material-symbols-outlined text-lg">edit</span>
</button>
<button class="text-on-surface-variant hover:text-primary transition-colors p-1" title="Restablecer Contraseña">
<span class="material-symbols-outlined text-lg">lock_reset</span>
</button>
</td>
</tr>
<!-- Row 3 -->
<tr class="hover:bg-surface-container-high/30 transition-colors group">
<td class="px-6 py-4">
<div class="flex items-center gap-3">
<div class="w-8 h-8 rounded-full bg-surface-container-high text-on-surface-variant flex items-center justify-center font-semibold text-xs shrink-0">
                                                JP
                                            </div>
<div>
<p class="font-medium text-on-surface">Jorge Perez</p>
<p class="text-xs text-on-surface-variant">jperez@zofratacna.gob.pe</p>
</div>
</div>
</td>
<td class="px-6 py-4">
<span class="inline-flex items-center gap-1.5">
<span class="material-symbols-outlined text-[14px] text-on-surface-variant">visibility</span>
                                            Auditor
                                        </span>
</td>
<td class="px-6 py-4 text-on-surface-variant text-xs">12/10/2023</td>
<td class="px-6 py-4">
<span class="inline-flex items-center px-2 py-0.5 rounded-full text-[11px] font-medium bg-surface-container-high text-on-surface-variant">
                                            Inactivo
                                        </span>
</td>
<td class="px-6 py-4 text-right">
<button class="text-on-surface-variant hover:text-primary transition-colors p-1" title="Editar Usuario">
<span class="material-symbols-outlined text-lg">edit</span>
</button>
<button class="text-on-surface-variant hover:text-primary transition-colors p-1" title="Restablecer Contraseña">
<span class="material-symbols-outlined text-lg">lock_reset</span>
</button>
</td>
</tr>
<!-- Row 4 -->
<tr class="hover:bg-surface-container-high/30 transition-colors group">
<td class="px-6 py-4">
<div class="flex items-center gap-3">
<div class="w-8 h-8 rounded-full bg-surface-container-high text-on-surface-variant flex items-center justify-center font-semibold text-xs shrink-0">
                                                MV
                                            </div>
<div>
<p class="font-medium text-on-surface">Maria Vargas</p>
<p class="text-xs text-on-surface-variant">mvargas@zofratacna.gob.pe</p>
</div>
</div>
</td>
<td class="px-6 py-4">
<span class="inline-flex items-center gap-1.5">
<span class="material-symbols-outlined text-[14px] text-on-surface-variant">description</span>
                                            Mesa de Partes
                                        </span>
</td>
<td class="px-6 py-4 text-on-surface-variant text-xs">Hace 2 horas</td>
<td class="px-6 py-4">
<span class="inline-flex items-center px-2 py-0.5 rounded-full text-[11px] font-medium bg-tertiary-fixed text-on-tertiary-fixed-variant">
                                            Pendiente
                                        </span>
</td>
<td class="px-6 py-4 text-right">
<button class="text-on-surface-variant hover:text-primary transition-colors p-1" title="Editar Usuario">
<span class="material-symbols-outlined text-lg">edit</span>
</button>
<button class="text-on-surface-variant hover:text-primary transition-colors p-1" title="Restablecer Contraseña">
<span class="material-symbols-outlined text-lg">lock_reset</span>
</button>
</td>
</tr>
</tbody>
</table>
</div>
<div class="p-4 border-t border-surface-container-high/50 flex items-center justify-between text-xs text-on-surface-variant">
<span>Mostrando 1 a 4 de 24 usuarios</span>
<div class="flex items-center gap-1">
<button class="p-1 hover:bg-surface-container rounded transition-colors disabled:opacity-50" disabled="">
<span class="material-symbols-outlined text-sm">chevron_left</span>
</button>
<button class="p-1 hover:bg-surface-container rounded transition-colors">
<span class="material-symbols-outlined text-sm">chevron_right</span>
</button>
</div>
</div>
</div>
<!-- Side Panel (Takes up 1/3) -->
<div class="lg:col-span-1 flex flex-col gap-6">
<!-- Quick Actions / Reseteo Card -->
<div class="bg-surface-container-lowest rounded-xl p-6 shadow-[0_20px_40px_rgba(25,28,30,0.02)] border border-outline-variant/10 relative overflow-hidden">
<!-- Decorative subtle gradient -->
<div class="absolute top-0 right-0 w-32 h-32 bg-primary-fixed-dim/20 rounded-full blur-3xl -mr-16 -mt-16 pointer-events-none"></div>
<div class="flex items-center gap-3 mb-4">
<div class="p-2 bg-surface-container rounded-lg text-primary">
<span class="material-symbols-outlined">security</span>
</div>
<h3 class="font-headline font-semibold text-lg text-primary">Seguridad Rápida</h3>
</div>
<p class="text-sm text-on-surface-variant font-body mb-5 leading-relaxed">
                            Fuerce el reseteo de credenciales o bloquee temporalmente cuentas sospechosas de forma global.
                        </p>
<div class="flex flex-col gap-3">
<button class="w-full bg-surface-container hover:bg-surface-container-high text-on-surface py-2.5 px-4 rounded-lg font-body text-sm font-medium flex items-center justify-between transition-colors">
<span class="flex items-center gap-2">
<span class="material-symbols-outlined text-sm text-on-surface-variant">key</span>
                                    Expirar contraseñas (90 días)
                                </span>
<span class="material-symbols-outlined text-sm text-outline">arrow_forward</span>
</button>
<button class="w-full bg-surface-container hover:bg-surface-container-high text-on-surface py-2.5 px-4 rounded-lg font-body text-sm font-medium flex items-center justify-between transition-colors">
<span class="flex items-center gap-2">
<span class="material-symbols-outlined text-sm text-on-surface-variant">policy</span>
                                    Políticas de acceso
                                </span>
<span class="material-symbols-outlined text-sm text-outline">arrow_forward</span>
</button>
</div>
</div>
<!-- Activity Log (Registro de Actividad) -->
<div class="bg-surface-container-low rounded-xl p-6 flex-1 flex flex-col border border-outline-variant/10">
<div class="flex items-center justify-between mb-5">
<h3 class="font-headline font-semibold text-base text-primary flex items-center gap-2">
<span class="material-symbols-outlined text-sm">history</span>
                                Registro de Actividad
                            </h3>
<button class="text-xs font-medium text-primary hover:underline">Ver todo</button>
</div>
<div class="flex flex-col gap-4 relative">
<!-- Timeline line -->
<div class="absolute left-[15px] top-2 bottom-2 w-px bg-outline-variant/30"></div>
<!-- Activity Item 1 -->
<div class="flex gap-4 relative z-10">
<div class="w-8 h-8 rounded-full bg-surface-container-lowest border border-outline-variant/20 flex items-center justify-center shrink-0">
<span class="material-symbols-outlined text-[14px] text-primary">person_add</span>
</div>
<div class="pb-1">
<p class="text-sm font-medium text-on-surface">Usuario creado</p>
<p class="text-xs text-on-surface-variant mt-0.5">Admin generó cuenta para <span class="font-medium">M. Vargas</span></p>
<p class="text-[10px] text-outline mt-1 uppercase tracking-wider">Hoy, 10:45 AM</p>
</div>
</div>
<!-- Activity Item 2 -->
<div class="flex gap-4 relative z-10">
<div class="w-8 h-8 rounded-full bg-surface-container-lowest border border-outline-variant/20 flex items-center justify-center shrink-0">
<span class="material-symbols-outlined text-[14px] text-on-surface-variant">manage_accounts</span>
</div>
<div class="pb-1">
<p class="text-sm font-medium text-on-surface">Cambio de Rol</p>
<p class="text-xs text-on-surface-variant mt-0.5"><span class="font-medium">L. Ramirez</span> ascendido a Firma Aut.</p>
<p class="text-[10px] text-outline mt-1 uppercase tracking-wider">Ayer, 16:30 PM</p>
</div>
</div>
<!-- Activity Item 3 -->
<div class="flex gap-4 relative z-10">
<div class="w-8 h-8 rounded-full bg-surface-container-lowest border border-outline-variant/20 flex items-center justify-center shrink-0">
<span class="material-symbols-outlined text-[14px] text-error">gpp_bad</span>
</div>
<div class="pb-1">
<p class="text-sm font-medium text-on-surface">Intento fallido</p>
<p class="text-xs text-on-surface-variant mt-0.5">3 intentos erróneos de J. Perez</p>
<p class="text-[10px] text-outline mt-1 uppercase tracking-wider">12/10/2023, 09:15 AM</p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</main>
</body></html>