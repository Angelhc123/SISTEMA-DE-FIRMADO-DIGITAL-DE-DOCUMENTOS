<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmArchivoFirmante.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Firma.frmArchivoFirmante" %>
<!DOCTYPE html>

<html lang="es"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Archivo del Firmante - SDF ZOFRATACNA</title>
<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&amp;family=Public+Sans:wght@500;600;700&amp;display=swap" rel="stylesheet"/>
<!-- Material Symbols -->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<!-- Tailwind Config -->
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
                        "headline": ["Public Sans", "sans-serif"],
                        "body": ["Inter", "sans-serif"],
                        "label": ["Inter", "sans-serif"]
                    }
                }
            }
        }
    </script>
<style>
        body { background-color: #f2f4f6; /* surface-container-low as base layer */ }
        .glass-panel {
            background-color: rgba(248, 249, 251, 0.85); /* surface-bright */
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
        }
    </style>
</head>
<body class="font-body text-on-surface antialiased flex min-h-screen">
<!-- SideNavBar (From JSON) -->
<nav class="fixed left-0 top-0 h-screen w-72 border-r border-transparent bg-slate-100 dark:bg-slate-900 flex flex-col p-4 z-40 font-public-sans font-semibold tracking-tight text-[#003366] dark:text-blue-400">
<div class="mb-8 px-4 pt-4">
<div class="flex items-center gap-3">
<div class="w-10 h-10 bg-primary rounded-lg flex items-center justify-center text-on-primary">
<span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">account_balance</span>
</div>
<div>
<h1 class="text-xl font-bold text-[#001e40] dark:text-white leading-none">SDF ZOFRATACNA</h1>
<span class="text-xs font-normal text-slate-500 mt-1 block">Arquitectura de Confianza</span>
</div>
</div>
</div>
<div class="flex-1 space-y-1">
<!-- Inactive -->
<a class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 scale-95 active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined font-light">dashboard</span>
<span>Dashboard</span>
</a>
<!-- Inactive -->
<a class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 scale-95 active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined font-light">description</span>
<span>Mis Documentos</span>
</a>
<!-- Inactive -->
<a class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 scale-95 active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined font-light">add_box</span>
<span>Registrar Nuevo</span>
</a>
<!-- ACTIVE: Archivo -->
<a class="flex items-center gap-3 px-4 py-3 rounded-lg text-[#001e40] dark:text-white font-bold bg-white dark:bg-slate-800 shadow-sm scale-95 active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">archive</span>
<span>Archivo</span>
</a>
<!-- Inactive -->
<a class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 scale-95 active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined font-light">settings</span>
<span>Ajustes</span>
</a>
</div>
<div class="mt-auto pt-4 border-t border-slate-200/50 dark:border-slate-800/50">
<a class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 scale-95 active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined font-light">contact_support</span>
<span>Soporte</span>
</a>
</div>
</nav>
<!-- TopNavBar (From JSON) -->
<header class="fixed top-0 right-0 w-[calc(100%-18rem)] h-16 z-50 bg-white/85 dark:bg-slate-950/85 backdrop-blur-md border-b border-slate-200/50 dark:border-slate-800/50 shadow-sm dark:shadow-none flex items-center justify-between px-8 text-[#001e40] dark:text-white font-inter text-sm opacity-90 hover:opacity-100 transition-opacity">
<div class="flex items-center flex-1">
<!-- Search bar logic placeholder per JSON -->
<div class="relative w-64">
<span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 text-lg">search</span>
<input class="w-full bg-slate-100 dark:bg-slate-900 border-none rounded-full pl-10 pr-4 py-2 text-sm focus:ring-2 focus:ring-primary/20 outline-none transition-all text-on-surface" placeholder="Buscar en archivo..." type="text"/>
</div>
</div>
<div class="flex items-center gap-6">
<button class="text-slate-600 dark:text-slate-400 hover:text-[#003366] dark:hover:text-blue-300 transition-all flex items-center justify-center">
<span class="material-symbols-outlined">notifications</span>
</button>
<button class="text-slate-600 dark:text-slate-400 hover:text-[#003366] dark:hover:text-blue-300 transition-all flex items-center justify-center">
<span class="material-symbols-outlined">help_outline</span>
</button>
<div class="h-6 w-px bg-slate-200 dark:bg-slate-800 mx-2"></div>
<div class="flex items-center gap-3 cursor-pointer group">
<img alt="Usuario Session" class="w-8 h-8 rounded-full ring-2 ring-transparent group-hover:ring-primary/20 transition-all" src="https://lh3.googleusercontent.com/aida-public/AB6AXuC2lvlToE73S_KLKwbr7PdQgMXbZDpSTFJ9cAcIsK6HeGJJPaxuVnsFFj4H8apZj0VmXrt0CPBChP2S6HvVH9wG8_QlSudMla8ibmCY6EXfym19ZbUPZ2HzaEAAxy85NX8aTZbEY674fUMoJuZd54LZK15ybc-hpTndYnCoIh6qveJDqzJ8KV65IMv3ls82N8OL3t_2JdBO_9w231yZthOWuPBEMxwrhU_2A2AjbzFjtzZGCDoJ40jQk7bUinnOvXJ9D7f056Yv_TZY"/>
<span class="font-medium text-[#003366] dark:text-white">Cerrar Sesión</span>
</div>
</div>
</header>
<!-- Main Content Canvas -->
<main class="flex-1 ml-72 pt-24 px-10 pb-16">
<div class="max-w-[1200px] mx-auto">
<!-- Header Section -->
<div class="mb-10">
<h2 class="text-4xl font-headline font-semibold text-primary tracking-tight mb-2">Archivo del Firmante</h2>
<p class="text-on-surface-variant font-body leading-relaxed max-w-2xl text-lg">
                    Repositorio personal asegurado. Acceda y descargue los documentos que han completado el ciclo de firma digital exitosamente.
                </p>
</div>
<!-- Bento Grid Metrics -->
<div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-10">
<!-- Card 1 -->
<div class="bg-surface-container-lowest rounded-xl p-6 relative overflow-hidden flex flex-col justify-between min-h-[160px]">
<div class="flex items-start justify-between">
<span class="material-symbols-outlined text-primary-container text-3xl font-light">task</span>
<div class="w-8 h-8 rounded-full bg-surface-container flex items-center justify-center">
<span class="material-symbols-outlined text-sm text-outline">trending_up</span>
</div>
</div>
<div>
<p class="text-sm font-label text-on-surface-variant mb-1">Total Firmados</p>
<p class="text-4xl font-headline font-semibold text-primary">1,248</p>
</div>
<!-- Decorative element -->
<div class="absolute -right-6 -bottom-6 w-32 h-32 bg-secondary-container opacity-20 rounded-full blur-2xl"></div>
</div>
<!-- Card 2 -->
<div class="bg-surface-container-lowest rounded-xl p-6 relative overflow-hidden flex flex-col justify-between min-h-[160px]">
<div class="flex items-start justify-between">
<span class="material-symbols-outlined text-secondary text-3xl font-light">calendar_month</span>
</div>
<div>
<p class="text-sm font-label text-on-surface-variant mb-1">Firmados este Mes</p>
<p class="text-4xl font-headline font-semibold text-primary">42</p>
</div>
</div>
<!-- Card 3: Image/Aesthetic Focus -->
<div class="rounded-xl overflow-hidden relative min-h-[160px] group">
<div class="absolute inset-0 bg-primary/80 z-10 mix-blend-multiply transition-opacity group-hover:opacity-90"></div>
<img alt="" class="absolute inset-0 w-full h-full object-cover z-0" data-alt="close up of pristine legal documents and a fountain pen resting on a dark polished wooden desk with soft dramatic lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCVEhd2Vpd1Y9esLagTsi-YyzaouNUEK1KD0QY-UnldDA0v-mr34p8xxuLnslUuUdmJP6SeFTKewePGGqrKvUhicg6uhlweR9KfQALDKdNENFKFxt7z3Aqw4xa1ohemyuWW1ZheH4lyadOMIp1STAVesY8jBCCdqjPl4sGQyb9VvizFn7gXoMrxEFAiOvYb5LiCG_YIZOWFgZpFbOCzAbGmCD0SssbqM25xG50kBFnD-vQ-i5IZmfeRbUGFNl4twbJVxFdRBzZNGN3O"/>
<div class="relative z-20 p-6 h-full flex flex-col justify-end">
<span class="material-symbols-outlined text-white/80 mb-2">verified_user</span>
<p class="text-white font-headline font-semibold text-lg leading-tight">Integridad legal garantizada</p>
</div>
</div>
</div>
<!-- Data Table Section (Design System specific) -->
<div class="bg-surface-container-lowest rounded-xl pt-6 pb-2 px-6">
<div class="flex items-center justify-between mb-6">
<h3 class="font-headline font-semibold text-xl text-primary">Historial de Documentos</h3>
<button class="text-primary text-sm font-medium hover:text-primary-container transition-colors flex items-center gap-1">
                        Filtrar <span class="material-symbols-outlined text-[18px]">filter_list</span>
</button>
</div>
<div class="overflow-x-auto">
<table class="w-full text-left border-collapse">
<thead>
<tr>
<th class="pb-4 font-label text-xs uppercase text-outline tracking-wider font-medium w-1/4">Código Ref.</th>
<th class="pb-4 font-label text-xs uppercase text-outline tracking-wider font-medium w-2/5">Título del Documento</th>
<th class="pb-4 font-label text-xs uppercase text-outline tracking-wider font-medium w-1/6">Fecha de Firma</th>
<th class="pb-4 font-label text-xs uppercase text-outline tracking-wider font-medium w-1/6 text-center">Estado</th>
<th class="pb-4 font-label text-xs uppercase text-outline tracking-wider font-medium text-right w-24">Acción</th>
</tr>
</thead>
<tbody class="text-sm font-body text-on-surface">
<!-- Row 1 -->
<tr class="group hover:bg-surface-container-high transition-colors duration-200">
<td class="py-4 font-medium text-primary-container rounded-l-lg pl-2">RES-DIR-045-2023</td>
<td class="py-4 pr-4">Resolución de Aprobación de Tarifario Anual ZOFRATACNA</td>
<td class="py-4 text-on-surface-variant">12 Oct 2023</td>
<td class="py-4 text-center">
<span class="inline-flex items-center justify-center px-3 py-1 rounded-full text-xs font-semibold bg-gradient-to-r from-primary-fixed to-primary-fixed-dim text-on-primary-fixed-variant">
                                        Firmado
                                    </span>
</td>
<td class="py-4 text-right pr-2 rounded-r-lg">
<button class="bg-secondary-container text-on-secondary-container hover:bg-secondary-fixed-dim rounded-full w-9 h-9 inline-flex items-center justify-center transition-colors focus:ring-2 focus:ring-primary/20 outline-none" title="Descargar PDF">
<span class="material-symbols-outlined text-[20px]">download</span>
</button>
</td>
</tr>
<!-- Space separator (simulated) -->
<tr class="h-2"></tr>
<!-- Row 2 -->
<tr class="group hover:bg-surface-container-high transition-colors duration-200">
<td class="py-4 font-medium text-primary-container rounded-l-lg pl-2">CON-CON-112-2023</td>
<td class="py-4 pr-4">Contrato de Concesión Lote B-4 Sector Industrial</td>
<td class="py-4 text-on-surface-variant">08 Oct 2023</td>
<td class="py-4 text-center">
<span class="inline-flex items-center justify-center px-3 py-1 rounded-full text-xs font-semibold bg-gradient-to-r from-primary-fixed to-primary-fixed-dim text-on-primary-fixed-variant">
                                        Firmado
                                    </span>
</td>
<td class="py-4 text-right pr-2 rounded-r-lg">
<button class="bg-secondary-container text-on-secondary-container hover:bg-secondary-fixed-dim rounded-full w-9 h-9 inline-flex items-center justify-center transition-colors focus:ring-2 focus:ring-primary/20 outline-none" title="Descargar PDF">
<span class="material-symbols-outlined text-[20px]">download</span>
</button>
</td>
</tr>
<!-- Space separator -->
<tr class="h-2"></tr>
<!-- Row 3 -->
<tr class="group hover:bg-surface-container-high transition-colors duration-200">
<td class="py-4 font-medium text-primary-container rounded-l-lg pl-2">MEM-INT-899-2023</td>
<td class="py-4 pr-4">Memorándum Interno de Designación de Jefatura Temporal</td>
<td class="py-4 text-on-surface-variant">28 Sep 2023</td>
<td class="py-4 text-center">
<span class="inline-flex items-center justify-center px-3 py-1 rounded-full text-xs font-semibold bg-gradient-to-r from-primary-fixed to-primary-fixed-dim text-on-primary-fixed-variant">
                                        Firmado
                                    </span>
</td>
<td class="py-4 text-right pr-2 rounded-r-lg">
<button class="bg-secondary-container text-on-secondary-container hover:bg-secondary-fixed-dim rounded-full w-9 h-9 inline-flex items-center justify-center transition-colors focus:ring-2 focus:ring-primary/20 outline-none" title="Descargar PDF">
<span class="material-symbols-outlined text-[20px]">download</span>
</button>
</td>
</tr>
<!-- Space separator -->
<tr class="h-2"></tr>
<!-- Row 4 -->
<tr class="group hover:bg-surface-container-high transition-colors duration-200">
<td class="py-4 font-medium text-primary-container rounded-l-lg pl-2">ACT-DIR-012-2023</td>
<td class="py-4 pr-4">Acta de Sesión Ordinaria de Directorio N° 012</td>
<td class="py-4 text-on-surface-variant">15 Sep 2023</td>
<td class="py-4 text-center">
<span class="inline-flex items-center justify-center px-3 py-1 rounded-full text-xs font-semibold bg-gradient-to-r from-primary-fixed to-primary-fixed-dim text-on-primary-fixed-variant">
                                         Firmado
                                     </span>
</td>
<td class="py-4 text-right pr-2 rounded-r-lg">
<button class="bg-secondary-container text-on-secondary-container hover:bg-secondary-fixed-dim rounded-full w-9 h-9 inline-flex items-center justify-center transition-colors focus:ring-2 focus:ring-primary/20 outline-none" title="Descargar PDF">
<span class="material-symbols-outlined text-[20px]">download</span>
</button>
</td>
</tr>
</tbody>
</table>
</div>
<!-- Pagination minimal -->
<div class="flex items-center justify-between py-6 mt-4 border-t border-outline-variant/30">
<span class="text-sm text-on-surface-variant">Mostrando 1 a 4 de 1,248 registros</span>
<div class="flex gap-2">
<button class="p-2 rounded-lg text-outline hover:bg-surface-container hover:text-primary transition-colors disabled:opacity-50" disabled="">
<span class="material-symbols-outlined text-xl">chevron_left</span>
</button>
<button class="p-2 rounded-lg text-outline hover:bg-surface-container hover:text-primary transition-colors">
<span class="material-symbols-outlined text-xl">chevron_right</span>
</button>
</div>
</div>
</div>
</div>
</main>
</body></html>