<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmArchivoRegistrador.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Documentos.frmArchivoRegistrador" %>
<!DOCTYPE html>

<html lang="es"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Archivo - SDF ZOFRATACNA</title>
<!-- Google Fonts: Public Sans -->
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet"/>
<!-- Material Symbols -->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<!-- Theme Configuration -->
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
                        "on-tertiary-fixed": "#341100",
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
                        "headline": ["Public Sans", "sans-serif"],
                        "body": ["Public Sans", "sans-serif"],
                        "label": ["Public Sans", "sans-serif"]
                    }
                }
            }
        }
    </script>
<style>
        body { font-family: 'Public Sans', sans-serif; }
    </style>
</head>
<body class="bg-surface text-on-surface min-h-screen flex selection:bg-primary-container selection:text-white">
<!-- SideNavBar -->
<nav class="bg-white dark:bg-slate-950 text-[#001E40] dark:text-[#d5e3ff] font-public-sans tracking-tight text-sm font-medium h-screen w-72 fixed left-0 top-0 border-r-0 bg-slate-50 dark:bg-slate-900/50 shadow-[8px_0_24px_rgba(0,30,64,0.04)] z-50">
<div class="flex flex-col h-full py-8">
<!-- Brand -->
<div class="px-8 mb-12 flex items-center gap-4">
<div class="w-10 h-10 rounded bg-gradient-to-br from-primary to-primary-container flex items-center justify-center text-white shrink-0">
<span class="material-symbols-outlined font-light text-xl" style="font-variation-settings: 'FILL' 1;">assured_workload</span>
</div>
<div>
<h1 class="text-lg font-black tracking-tighter text-[#001E40] dark:text-white uppercase leading-tight">SDF ZOFRATACNA</h1>
<p class="text-xs text-slate-500 font-normal">Sistema de Firmado Digital</p>
</div>
</div>
<!-- Navigation Links -->
<div class="flex-1 flex flex-col gap-1 px-4">
<a class="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-lg" href="#">
<span class="material-symbols-outlined text-[20px]">dashboard</span>
<span>Dashboard</span>
</a>
<a class="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-lg" href="#">
<span class="material-symbols-outlined text-[20px]">description</span>
<span>Mis Documentos</span>
</a>
<a class="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-lg" href="#">
<span class="material-symbols-outlined text-[20px]">add_box</span>
<span>Registrar Nuevo</span>
</a>
<!-- Active Item: Archivo -->
<a class="flex items-center gap-3 px-6 py-4 text-[#001E40] dark:text-white bg-slate-100 dark:bg-[#001E40]/20 font-bold border-r-4 border-[#001E40] rounded-lg" href="#">
<span class="material-symbols-outlined text-[20px]" style="font-variation-settings: 'FILL' 1;">archive</span>
<span>Archivo</span>
</a>
<a class="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-lg" href="#">
<span class="material-symbols-outlined text-[20px]">settings</span>
<span>Ajustes</span>
</a>
<a class="flex items-center gap-3 px-6 py-4 text-slate-500 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors hover:bg-slate-100 dark:hover:bg-slate-800 transition-all duration-200 rounded-lg" href="#">
<span class="material-symbols-outlined text-[20px]">support_agent</span>
<span>Soporte</span>
</a>
</div>
<!-- User Profile Area -->
<div class="px-8 mt-auto">
<div class="pt-6 border-t border-slate-200 dark:border-slate-800 flex items-center gap-3">
<div class="w-8 h-8 rounded-full bg-surface-container-high overflow-hidden border border-outline-variant/30">
<img alt="Avatar de Usuario" class="w-full h-full object-cover" data-alt="professional portrait of a man in a modern office environment with soft lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDT4wl2TfLGbUZOIRZ5kBGPxLs_Ujq_vg5sj_QxEiO06FiU4R9kk82twWmzNuPXhDoccde_hfWi-ugnPArqOsUYfIuzhg4gcEqU7k1qQhBReU5LlXLgfCrVuYx3d8oikuyrxTaHdvPDypTB4TbRfw9nx796xb6tS_JJwV-UlROIGpGldDM9PW8dCW38yX4287O0o9e7V_fc0DOtY7aKtguJGJ6iw-9k80YdadMy2OitCL93QuyU2HhMI92RXPD71aRiHnWqGu3LqmE_"/>
</div>
<div class="flex flex-col">
<span class="text-xs font-bold text-primary-container">Registrador</span>
<span class="text-[10px] text-on-surface-variant uppercase tracking-wider">Activo</span>
</div>
</div>
</div>
</div>
</nav>
<!-- TopNavBar -->
<header class="bg-white/80 dark:bg-slate-950/80 backdrop-blur-xl text-[#001E40] dark:text-[#d5e3ff] font-public-sans text-sm tracking-wide fixed top-0 right-0 left-72 h-16 z-40 bg-slate-50 dark:bg-slate-900 shadow-sm dark:shadow-none transition-all duration-300 ease-in-out">
<div class="flex items-center justify-between px-10 h-full w-full">
<div class="hidden">SDF ZOFRATACNA</div>
<!-- Breadcrumbs / Top Nav Links -->
<div class="flex items-center gap-6">
<a class="text-slate-400 hover:text-[#001E40] transition-colors hover:text-[#001E40] dark:hover:text-white font-medium" href="#">Dashboard</a>
<span class="text-outline-variant material-symbols-outlined text-sm">chevron_right</span>
<span class="text-[#001E40] font-bold border-b-2 border-[#001E40] pb-1">Archivo Histórico</span>
</div>
<!-- Trailing Action -->
<div class="flex items-center gap-4">
<button class="flex items-center gap-2 text-on-surface-variant hover:text-primary-container transition-colors font-medium text-sm">
<span class="material-symbols-outlined text-[18px]">logout</span>
<span>Cerrar Sesión</span>
</button>
</div>
</div>
</header>
<!-- Main Content Canvas -->
<main class="ml-72 mt-16 flex-1 p-10 pb-20 max-w-7xl">
<!-- Header Section -->
<div class="mb-12 flex justify-between items-end">
<div class="max-w-2xl">
<h2 class="font-headline text-4xl font-extrabold tracking-tighter text-primary-container mb-3">Archivo Histórico</h2>
<p class="font-body text-on-surface-variant text-base leading-relaxed max-w-xl">
                    Consulta y descarga los documentos que han finalizado exitosamente su flujo de firma digital. El repositorio inmutable de la institución.
                </p>
</div>
</div>
<!-- Filters Grid (Bento Style) -->
<div class="bg-surface-container-low rounded-lg p-6 mb-10 ring-1 ring-outline-variant/10">
<div class="flex flex-wrap gap-6 items-end">
<!-- Filter: Año -->
<div class="flex-1 min-w-[200px]">
<label class="block font-label text-xs font-bold uppercase tracking-widest text-on-surface-variant mb-2">Año de Emisión</label>
<div class="relative">
<select class="w-full bg-surface-container-highest border-0 border-b-2 border-outline-variant focus:border-primary-container focus:ring-0 rounded-t-sm px-4 py-3 text-sm font-medium text-primary-container appearance-none transition-colors">
<option>2024</option>
<option>2023</option>
<option>2022</option>
</select>
<span class="material-symbols-outlined absolute right-3 top-3 text-outline pointer-events-none">expand_more</span>
</div>
</div>
<!-- Filter: Mes -->
<div class="flex-1 min-w-[200px]">
<label class="block font-label text-xs font-bold uppercase tracking-widest text-on-surface-variant mb-2">Mes</label>
<div class="relative">
<select class="w-full bg-surface-container-highest border-0 border-b-2 border-outline-variant focus:border-primary-container focus:ring-0 rounded-t-sm px-4 py-3 text-sm font-medium text-primary-container appearance-none transition-colors">
<option>Todos los meses</option>
<option>Enero</option>
<option>Febrero</option>
<option>Marzo</option>
<option>Abril</option>
</select>
<span class="material-symbols-outlined absolute right-3 top-3 text-outline pointer-events-none">expand_more</span>
</div>
</div>
<!-- Filter: Tipo -->
<div class="flex-[2] min-w-[300px]">
<label class="block font-label text-xs font-bold uppercase tracking-widest text-on-surface-variant mb-2">Tipo de Documento</label>
<div class="relative">
<select class="w-full bg-surface-container-highest border-0 border-b-2 border-outline-variant focus:border-primary-container focus:ring-0 rounded-t-sm px-4 py-3 text-sm font-medium text-primary-container appearance-none transition-colors">
<option>Todos los tipos</option>
<option>Resolución Gerencial</option>
<option>Memorándum Múltiple</option>
<option>Contrato de Concesión</option>
<option>Acta de Directorio</option>
</select>
<span class="material-symbols-outlined absolute right-3 top-3 text-outline pointer-events-none">expand_more</span>
</div>
</div>
<div class="shrink-0">
<button class="bg-primary-container text-white px-6 py-3 rounded-md font-label text-sm font-bold tracking-wide hover:bg-primary transition-colors flex items-center gap-2">
<span class="material-symbols-outlined text-[18px]">filter_list</span>
                        Aplicar Filtros
                    </button>
</div>
</div>
</div>
<!-- Document Grid -->
<div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-6">
<!-- Card 1 -->
<div class="bg-surface-container-lowest rounded-lg p-6 ring-1 ring-outline-variant/20 hover:shadow-[0_8px_24px_rgba(0,30,64,0.06)] transition-all duration-300 flex flex-col group relative overflow-hidden">
<!-- Decorative Top Accent -->
<div class="absolute top-0 left-0 w-full h-1 bg-gradient-to-r from-primary to-primary-container opacity-0 group-hover:opacity-100 transition-opacity"></div>
<div class="flex justify-between items-start mb-4">
<div class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full bg-primary-fixed text-on-primary-fixed text-[10px] font-bold uppercase tracking-widest">
<span class="material-symbols-outlined text-[14px]" style="font-variation-settings: 'FILL' 1;">check_circle</span>
                        Finalizado
                    </div>
<span class="text-xs font-label font-bold text-on-surface-variant">RG-2024-0892</span>
</div>
<h3 class="font-headline text-lg font-bold text-primary-container leading-tight mb-2">Resolución de Aprobación de Presupuesto Anual</h3>
<p class="font-body text-sm text-secondary mb-6 line-clamp-2">Aprueba las modificaciones presupuestales para el ejercicio fiscal correspondiente al periodo en curso.</p>
<div class="mt-auto pt-6 border-t border-surface-container-highest flex items-center justify-between">
<div class="flex items-center gap-2 text-xs font-medium text-on-surface-variant">
<span class="material-symbols-outlined text-[16px]">calendar_today</span>
                        12 Oct 2024
                    </div>
<button class="flex items-center gap-2 text-primary-container hover:text-primary font-bold text-sm bg-surface hover:bg-surface-container-high px-3 py-1.5 rounded transition-colors" title="Descargar PDF">
                        Descargar
                        <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">picture_as_pdf</span>
</button>
</div>
</div>
<!-- Card 2 -->
<div class="bg-surface-container-lowest rounded-lg p-6 ring-1 ring-outline-variant/20 hover:shadow-[0_8px_24px_rgba(0,30,64,0.06)] transition-all duration-300 flex flex-col group relative overflow-hidden">
<div class="absolute top-0 left-0 w-full h-1 bg-gradient-to-r from-primary to-primary-container opacity-0 group-hover:opacity-100 transition-opacity"></div>
<div class="flex justify-between items-start mb-4">
<div class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full bg-primary-fixed text-on-primary-fixed text-[10px] font-bold uppercase tracking-widest">
<span class="material-symbols-outlined text-[14px]" style="font-variation-settings: 'FILL' 1;">check_circle</span>
                        Finalizado
                    </div>
<span class="text-xs font-label font-bold text-on-surface-variant">MM-2024-0145</span>
</div>
<h3 class="font-headline text-lg font-bold text-primary-container leading-tight mb-2">Memorándum Múltiple: Directrices de Seguridad Física</h3>
<p class="font-body text-sm text-secondary mb-6 line-clamp-2">Actualización de protocolos de acceso a zonas restringidas dentro del recinto franco.</p>
<div class="mt-auto pt-6 border-t border-surface-container-highest flex items-center justify-between">
<div class="flex items-center gap-2 text-xs font-medium text-on-surface-variant">
<span class="material-symbols-outlined text-[16px]">calendar_today</span>
                        05 Oct 2024
                    </div>
<button class="flex items-center gap-2 text-primary-container hover:text-primary font-bold text-sm bg-surface hover:bg-surface-container-high px-3 py-1.5 rounded transition-colors" title="Descargar PDF">
                        Descargar
                        <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">picture_as_pdf</span>
</button>
</div>
</div>
<!-- Card 3 -->
<div class="bg-surface-container-lowest rounded-lg p-6 ring-1 ring-outline-variant/20 hover:shadow-[0_8px_24px_rgba(0,30,64,0.06)] transition-all duration-300 flex flex-col group relative overflow-hidden">
<div class="absolute top-0 left-0 w-full h-1 bg-gradient-to-r from-primary to-primary-container opacity-0 group-hover:opacity-100 transition-opacity"></div>
<div class="flex justify-between items-start mb-4">
<div class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full bg-primary-fixed text-on-primary-fixed text-[10px] font-bold uppercase tracking-widest">
<span class="material-symbols-outlined text-[14px]" style="font-variation-settings: 'FILL' 1;">check_circle</span>
                        Finalizado
                    </div>
<span class="text-xs font-label font-bold text-on-surface-variant">CC-2024-0012</span>
</div>
<h3 class="font-headline text-lg font-bold text-primary-container leading-tight mb-2">Contrato de Concesión Lote B-45</h3>
<p class="font-body text-sm text-secondary mb-6 line-clamp-2">Adjudicación de espacio físico para operaciones logísticas de importación/exportación tecnológica.</p>
<div class="mt-auto pt-6 border-t border-surface-container-highest flex items-center justify-between">
<div class="flex items-center gap-2 text-xs font-medium text-on-surface-variant">
<span class="material-symbols-outlined text-[16px]">calendar_today</span>
                        28 Sep 2024
                    </div>
<button class="flex items-center gap-2 text-primary-container hover:text-primary font-bold text-sm bg-surface hover:bg-surface-container-high px-3 py-1.5 rounded transition-colors" title="Descargar PDF">
                        Descargar
                        <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">picture_as_pdf</span>
</button>
</div>
</div>
<!-- Card 4 -->
<div class="bg-surface-container-lowest rounded-lg p-6 ring-1 ring-outline-variant/20 hover:shadow-[0_8px_24px_rgba(0,30,64,0.06)] transition-all duration-300 flex flex-col group relative overflow-hidden">
<div class="absolute top-0 left-0 w-full h-1 bg-gradient-to-r from-primary to-primary-container opacity-0 group-hover:opacity-100 transition-opacity"></div>
<div class="flex justify-between items-start mb-4">
<div class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full bg-primary-fixed text-on-primary-fixed text-[10px] font-bold uppercase tracking-widest">
<span class="material-symbols-outlined text-[14px]" style="font-variation-settings: 'FILL' 1;">check_circle</span>
                        Finalizado
                    </div>
<span class="text-xs font-label font-bold text-on-surface-variant">AD-2024-004</span>
</div>
<h3 class="font-headline text-lg font-bold text-primary-container leading-tight mb-2">Acta de Sesión Ordinaria de Directorio</h3>
<p class="font-body text-sm text-secondary mb-6 line-clamp-2">Documento oficial que registra los acuerdos tomados en la cuarta sesión del año en curso.</p>
<div class="mt-auto pt-6 border-t border-surface-container-highest flex items-center justify-between">
<div class="flex items-center gap-2 text-xs font-medium text-on-surface-variant">
<span class="material-symbols-outlined text-[16px]">calendar_today</span>
                        15 Sep 2024
                    </div>
<button class="flex items-center gap-2 text-primary-container hover:text-primary font-bold text-sm bg-surface hover:bg-surface-container-high px-3 py-1.5 rounded transition-colors" title="Descargar PDF">
                        Descargar
                        <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">picture_as_pdf</span>
</button>
</div>
</div>
<!-- Card 5 -->
<div class="bg-surface-container-lowest rounded-lg p-6 ring-1 ring-outline-variant/20 hover:shadow-[0_8px_24px_rgba(0,30,64,0.06)] transition-all duration-300 flex flex-col group relative overflow-hidden">
<div class="absolute top-0 left-0 w-full h-1 bg-gradient-to-r from-primary to-primary-container opacity-0 group-hover:opacity-100 transition-opacity"></div>
<div class="flex justify-between items-start mb-4">
<div class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full bg-primary-fixed text-on-primary-fixed text-[10px] font-bold uppercase tracking-widest">
<span class="material-symbols-outlined text-[14px]" style="font-variation-settings: 'FILL' 1;">check_circle</span>
                        Finalizado
                    </div>
<span class="text-xs font-label font-bold text-on-surface-variant">RG-2024-0810</span>
</div>
<h3 class="font-headline text-lg font-bold text-primary-container leading-tight mb-2">Resolución de Modificación de Tarifario</h3>
<p class="font-body text-sm text-secondary mb-6 line-clamp-2">Ajustes tarifarios para servicios de pesaje y estiba aplicables al último trimestre.</p>
<div class="mt-auto pt-6 border-t border-surface-container-highest flex items-center justify-between">
<div class="flex items-center gap-2 text-xs font-medium text-on-surface-variant">
<span class="material-symbols-outlined text-[16px]">calendar_today</span>
                        02 Sep 2024
                    </div>
<button class="flex items-center gap-2 text-primary-container hover:text-primary font-bold text-sm bg-surface hover:bg-surface-container-high px-3 py-1.5 rounded transition-colors" title="Descargar PDF">
                        Descargar
                        <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">picture_as_pdf</span>
</button>
</div>
</div>
</div>
<!-- Pagination (Minimalist) -->
<div class="mt-12 flex justify-center">
<div class="inline-flex items-center gap-2 bg-surface-container-lowest rounded-md ring-1 ring-outline-variant/20 p-1">
<button class="w-8 h-8 flex items-center justify-center rounded text-outline hover:text-primary-container hover:bg-surface-container-low transition-colors disabled:opacity-50" disabled="">
<span class="material-symbols-outlined text-sm">chevron_left</span>
</button>
<button class="w-8 h-8 flex items-center justify-center rounded bg-primary-container text-white font-label text-sm font-bold">1</button>
<button class="w-8 h-8 flex items-center justify-center rounded text-on-surface-variant font-label text-sm font-bold hover:bg-surface-container-low transition-colors">2</button>
<button class="w-8 h-8 flex items-center justify-center rounded text-on-surface-variant font-label text-sm font-bold hover:bg-surface-container-low transition-colors">3</button>
<span class="text-outline mx-1">...</span>
<button class="w-8 h-8 flex items-center justify-center rounded text-on-surface-variant font-label text-sm font-bold hover:bg-surface-container-low transition-colors">12</button>
<button class="w-8 h-8 flex items-center justify-center rounded text-on-surface-variant hover:text-primary-container hover:bg-surface-container-low transition-colors">
<span class="material-symbols-outlined text-sm">chevron_right</span>
</button>
</div>
</div>
</main>
</body></html>