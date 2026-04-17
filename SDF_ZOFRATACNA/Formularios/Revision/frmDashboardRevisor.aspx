<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmDashboardRevisor.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Revision.frmDashboardRevisor" %>
<!DOCTYPE html>

<html class="light" lang="es"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>SDF ZOFRATACNA - Panel de Control (Revisor)</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@400;500;600;700;800;900&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
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
<body class="bg-surface text-on-surface min-h-screen flex antialiased">
<!-- SideNavBar -->
<nav class="h-screen w-72 fixed left-0 top-0 border-r-0 bg-white shadow-[8px_0_24px_rgba(0,30,64,0.04)] z-50">
<div class="flex flex-col h-full py-8">
<!-- Brand / Header -->
<div class="px-6 mb-10">
<h1 class="text-lg font-black tracking-tighter text-[#001E40] uppercase">SDF ZOFRATACNA</h1>
<p class="font-public-sans tracking-tight text-sm font-medium text-slate-500">Sistema de Firmado Digital</p>
</div>
<!-- Navigation Links -->
<ul class="flex-1 space-y-2">
<li>
<a class="flex items-center gap-3 px-6 py-4 text-[#001E40] bg-slate-100 font-bold border-r-4 border-[#001E40] hover:bg-slate-100 transition-all duration-200" href="#">
<span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">dashboard</span>
<span class="font-public-sans tracking-tight text-sm font-medium">Dashboard</span>
</a>
</li>
<li>
<a class="flex items-center gap-3 px-6 py-4 text-slate-500 hover:bg-slate-50 transition-colors hover:bg-slate-100 transition-all duration-200" href="#">
<span class="material-symbols-outlined">description</span>
<span class="font-public-sans tracking-tight text-sm font-medium">Mis Documentos</span>
</a>
</li>
<li>
<a class="flex items-center gap-3 px-6 py-4 text-slate-500 hover:bg-slate-50 transition-colors hover:bg-slate-100 transition-all duration-200" href="#">
<span class="material-symbols-outlined">add_box</span>
<span class="font-public-sans tracking-tight text-sm font-medium">Registrar Nuevo</span>
</a>
</li>
<li>
<a class="flex items-center gap-3 px-6 py-4 text-slate-500 hover:bg-slate-50 transition-colors hover:bg-slate-100 transition-all duration-200" href="#">
<span class="material-symbols-outlined">archive</span>
<span class="font-public-sans tracking-tight text-sm font-medium">Archivo</span>
</a>
</li>
<li>
<a class="flex items-center gap-3 px-6 py-4 text-slate-500 hover:bg-slate-50 transition-colors hover:bg-slate-100 transition-all duration-200" href="#">
<span class="material-symbols-outlined">settings</span>
<span class="font-public-sans tracking-tight text-sm font-medium">Ajustes</span>
</a>
</li>
<li>
<a class="flex items-center gap-3 px-6 py-4 text-slate-500 hover:bg-slate-50 transition-colors hover:bg-slate-100 transition-all duration-200" href="#">
<span class="material-symbols-outlined">support_agent</span>
<span class="font-public-sans tracking-tight text-sm font-medium">Soporte</span>
</a>
</li>
</ul>
</div>
</nav>
<!-- Main Content Area -->
<div class="flex-1 ml-72 flex flex-col min-h-screen">
<!-- TopNavBar -->
<header class="fixed top-0 right-0 left-72 h-16 z-40 bg-white/80 backdrop-blur-xl shadow-sm">
<div class="flex items-center justify-between px-10 h-full w-full">
<nav class="flex gap-8 h-full">
<a class="text-[#001E40] font-bold border-b-2 border-[#001E40] pb-1 font-public-sans text-sm tracking-wide h-full flex items-center hover:text-[#001E40] transition-all duration-300 ease-in-out" href="#">Dashboard</a>
</nav>
<div class="flex items-center gap-6">
<div class="flex items-center gap-3">
<div class="w-8 h-8 rounded-full bg-surface-container-high overflow-hidden border border-outline-variant/20">
<img alt="Avatar de Usuario" class="w-full h-full object-cover" data-alt="Professional headshot of a man in a modern office setting, soft lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAxf9SdqTbPjer2dg9PAupFQONTIQTkgyjwXhbDcnh7zHVP1hXl_iV_DCndzd_WU3RuW9x0ttQzSOCrk7fn1Qv50tKNNyUlRvNTCcWdtuSkp56R2tfwBhIEm6qDfiu_nfGGSwrBORym57Mnl3LsNkwt-xsXe9WifyIJcBOeSrou0z6dzAB9l_TskKlZ1TPBlLVxr-FG2tGng0DIyAFFdttJ_vQKfCzikEFL46SHO33iDbcMavvZSKm1YDbC6SBu1KPrMQ_nfLEs62k2"/>
</div>
<span class="font-public-sans text-sm tracking-wide text-on-surface font-medium">Revisor</span>
</div>
<button class="text-slate-400 hover:text-[#001E40] transition-colors font-public-sans text-sm tracking-wide flex items-center gap-2">
<span class="material-symbols-outlined text-base">logout</span>
                        Cerrar Sesión
                    </button>
</div>
</div>
</header>
<!-- Canvas -->
<main class="flex-1 pt-24 px-10 pb-12 overflow-y-auto">
<!-- Page Header -->
<div class="mb-10 flex justify-between items-end">
<div>
<h2 class="text-3xl font-headline font-bold text-on-surface tracking-tight -ml-[2px] leading-tight">Panel de Control</h2>
<p class="text-on-surface-variant font-body text-base mt-2">Resumen de actividad y carga de trabajo para el rol Revisor.</p>
</div>
<div class="flex gap-4">
<button class="h-10 px-6 rounded bg-surface-container-highest text-on-surface font-label text-sm font-semibold tracking-wide hover:bg-surface-variant transition-colors flex items-center gap-2">
<span class="material-symbols-outlined text-lg">filter_list</span>
                        Filtros
                    </button>
<button class="h-10 px-6 rounded text-on-primary font-label text-sm font-semibold tracking-wide flex items-center gap-2 shadow-sm" style="background: linear-gradient(135deg, #000511 0%, #001E40 100%);">
<span class="material-symbols-outlined text-lg">refresh</span>
                        Actualizar
                    </button>
</div>
</div>
<!-- Bento Grid: Key Metrics -->
<div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-10">
<!-- Metric 1: Pendientes -->
<div class="bg-surface-container-lowest rounded-lg p-6 relative overflow-hidden border border-outline-variant/20 shadow-[0_4px_12px_rgba(0,30,64,0.02)]">
<div class="absolute top-0 right-0 p-6 opacity-10">
<span class="material-symbols-outlined text-6xl text-error">pending_actions</span>
</div>
<p class="font-label text-xs uppercase tracking-widest text-on-surface-variant mb-2 font-semibold">Pendientes de Revisión</p>
<div class="flex items-baseline gap-3">
<span class="text-4xl font-headline font-bold text-on-surface">42</span>
<span class="text-error font-body text-sm font-medium flex items-center">
<span class="material-symbols-outlined text-sm mr-1">trending_up</span> +12%
                        </span>
</div>
<div class="mt-4 pt-4 border-t border-outline-variant/10">
<a class="text-primary-container font-label text-sm font-semibold hover:underline flex items-center gap-1" href="#">
                            Ver listado completo <span class="material-symbols-outlined text-sm">arrow_forward</span>
</a>
</div>
</div>
<!-- Metric 2: Observados -->
<div class="bg-surface-container-lowest rounded-lg p-6 relative overflow-hidden border border-outline-variant/20 shadow-[0_4px_12px_rgba(0,30,64,0.02)]">
<div class="absolute top-0 right-0 p-6 opacity-10">
<span class="material-symbols-outlined text-6xl text-on-tertiary-container">assignment_return</span>
</div>
<p class="font-label text-xs uppercase tracking-widest text-on-surface-variant mb-2 font-semibold">Observados (Retorno)</p>
<div class="flex items-baseline gap-3">
<span class="text-4xl font-headline font-bold text-on-surface">15</span>
<span class="text-on-surface-variant font-body text-sm font-medium flex items-center">
<span class="material-symbols-outlined text-sm mr-1">horizontal_rule</span> Estable
                        </span>
</div>
<div class="mt-4 pt-4 border-t border-outline-variant/10">
<a class="text-primary-container font-label text-sm font-semibold hover:underline flex items-center gap-1" href="#">
                            Gestionar retornos <span class="material-symbols-outlined text-sm">arrow_forward</span>
</a>
</div>
</div>
<!-- Metric 3: Revisados Hoy -->
<div class="bg-surface-container-lowest rounded-lg p-6 relative overflow-hidden border border-outline-variant/20 shadow-[0_4px_12px_rgba(0,30,64,0.02)]">
<div class="absolute top-0 right-0 p-6 opacity-10">
<span class="material-symbols-outlined text-6xl text-primary-container">task_alt</span>
</div>
<p class="font-label text-xs uppercase tracking-widest text-on-surface-variant mb-2 font-semibold">Revisados (Hoy)</p>
<div class="flex items-baseline gap-3">
<span class="text-4xl font-headline font-bold text-on-surface">28</span>
<span class="text-primary-container font-body text-sm font-medium flex items-center">
<span class="material-symbols-outlined text-sm mr-1">trending_up</span> +5%
                        </span>
</div>
<div class="mt-4 pt-4 border-t border-outline-variant/10">
<a class="text-primary-container font-label text-sm font-semibold hover:underline flex items-center gap-1" href="#">
                            Ver historial de hoy <span class="material-symbols-outlined text-sm">arrow_forward</span>
</a>
</div>
</div>
</div>
<!-- Lower Section: Chart & Recent List -->
<div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
<!-- Chart Area (Placeholder) -->
<div class="lg:col-span-2 bg-surface-container-lowest rounded-lg p-8 border border-outline-variant/20 shadow-[0_4px_12px_rgba(0,30,64,0.02)] flex flex-col">
<div class="flex justify-between items-center mb-8">
<div>
<h3 class="font-headline font-bold text-xl text-on-surface">Carga de Trabajo</h3>
<p class="font-body text-sm text-on-surface-variant mt-1">Volumen de documentos revisados vs pendientes en los últimos 7 días.</p>
</div>
<div class="flex bg-surface-container-low rounded p-1">
<button class="px-3 py-1 bg-surface-container-lowest text-on-surface font-label text-xs font-semibold rounded shadow-sm">Semana</button>
<button class="px-3 py-1 text-on-surface-variant font-label text-xs font-medium hover:bg-surface-container-highest rounded">Mes</button>
</div>
</div>
<!-- Abstract Chart Representation -->
<div class="flex-1 min-h-[240px] relative flex items-end gap-4 pt-6">
<!-- Y-Axis Lines -->
<div class="absolute inset-0 flex flex-col justify-between pb-6 opacity-20 pointer-events-none">
<div class="border-b border-outline-variant w-full h-0"></div>
<div class="border-b border-outline-variant w-full h-0"></div>
<div class="border-b border-outline-variant w-full h-0"></div>
<div class="border-b border-outline-variant w-full h-0"></div>
</div>
<!-- Bars -->
<div class="flex-1 flex flex-col justify-end gap-2 group">
<div class="w-full bg-surface-container-high rounded-t-sm h-[40%] transition-all group-hover:bg-surface-variant"></div>
<div class="w-full bg-primary-container rounded-t-sm h-[60%] transition-all group-hover:opacity-90"></div>
<span class="text-center font-label text-[10px] text-on-surface-variant uppercase mt-2">Lun</span>
</div>
<div class="flex-1 flex flex-col justify-end gap-2 group">
<div class="w-full bg-surface-container-high rounded-t-sm h-[30%] transition-all group-hover:bg-surface-variant"></div>
<div class="w-full bg-primary-container rounded-t-sm h-[70%] transition-all group-hover:opacity-90"></div>
<span class="text-center font-label text-[10px] text-on-surface-variant uppercase mt-2">Mar</span>
</div>
<div class="flex-1 flex flex-col justify-end gap-2 group">
<div class="w-full bg-surface-container-high rounded-t-sm h-[50%] transition-all group-hover:bg-surface-variant"></div>
<div class="w-full bg-primary-container rounded-t-sm h-[40%] transition-all group-hover:opacity-90"></div>
<span class="text-center font-label text-[10px] text-on-surface-variant uppercase mt-2">Mié</span>
</div>
<div class="flex-1 flex flex-col justify-end gap-2 group">
<div class="w-full bg-surface-container-high rounded-t-sm h-[20%] transition-all group-hover:bg-surface-variant"></div>
<div class="w-full bg-primary-container rounded-t-sm h-[80%] transition-all group-hover:opacity-90"></div>
<span class="text-center font-label text-[10px] text-on-surface-variant uppercase mt-2">Jue</span>
</div>
<div class="flex-1 flex flex-col justify-end gap-2 group">
<div class="w-full bg-surface-container-high rounded-t-sm h-[60%] transition-all group-hover:bg-surface-variant"></div>
<div class="w-full bg-primary-container rounded-t-sm h-[30%] transition-all group-hover:opacity-90"></div>
<span class="text-center font-label text-[10px] text-on-surface-variant uppercase mt-2">Vie</span>
</div>
</div>
<!-- Legend -->
<div class="flex gap-6 mt-6 justify-center">
<div class="flex items-center gap-2">
<div class="w-3 h-3 rounded-sm bg-primary-container"></div>
<span class="font-label text-xs text-on-surface-variant">Revisados</span>
</div>
<div class="flex items-center gap-2">
<div class="w-3 h-3 rounded-sm bg-surface-container-high"></div>
<span class="font-label text-xs text-on-surface-variant">Pendientes</span>
</div>
</div>
</div>
<!-- Urgent Items List -->
<div class="bg-surface-container-low rounded-lg p-8 border border-outline-variant/10 flex flex-col">
<div class="mb-6 flex justify-between items-center">
<h3 class="font-headline font-bold text-lg text-on-surface">Atención Urgente</h3>
<span class="bg-error-container text-on-error-container font-label text-[10px] font-bold px-2 py-1 rounded-full tracking-wide">ALTA PRIORIDAD</span>
</div>
<div class="flex-1 flex flex-col gap-4">
<!-- List Item 1 -->
<div class="bg-surface-container-lowest p-4 rounded border border-outline-variant/20 shadow-sm hover:shadow-md transition-shadow cursor-pointer flex gap-4">
<div class="w-10 h-10 rounded bg-error-container flex items-center justify-center text-on-error-container shrink-0">
<span class="material-symbols-outlined text-xl">priority_high</span>
</div>
<div>
<h4 class="font-headline font-semibold text-sm text-on-surface line-clamp-1">Contrato de Arrendamiento Lote B-45</h4>
<p class="font-body text-xs text-on-surface-variant mt-1">Doc. ID: 0992-2023</p>
<div class="mt-2 flex items-center gap-2">
<span class="material-symbols-outlined text-[14px] text-error">schedule</span>
<span class="font-label text-[10px] font-bold text-error uppercase tracking-wider">Vence en 2h</span>
</div>
</div>
</div>
<!-- List Item 2 -->
<div class="bg-surface-container-lowest p-4 rounded border border-outline-variant/20 shadow-sm hover:shadow-md transition-shadow cursor-pointer flex gap-4">
<div class="w-10 h-10 rounded bg-surface-container-high flex items-center justify-center text-on-surface-variant shrink-0">
<span class="material-symbols-outlined text-xl">description</span>
</div>
<div>
<h4 class="font-headline font-semibold text-sm text-on-surface line-clamp-1">Resolución Directoral 045-2023</h4>
<p class="font-body text-xs text-on-surface-variant mt-1">Doc. ID: 0995-2023</p>
<div class="mt-2 flex items-center gap-2">
<span class="material-symbols-outlined text-[14px] text-on-surface-variant">schedule</span>
<span class="font-label text-[10px] font-bold text-on-surface-variant uppercase tracking-wider">Vence hoy</span>
</div>
</div>
</div>
<!-- List Item 3 -->
<div class="bg-surface-container-lowest p-4 rounded border border-outline-variant/20 shadow-sm hover:shadow-md transition-shadow cursor-pointer flex gap-4">
<div class="w-10 h-10 rounded bg-surface-container-high flex items-center justify-center text-on-surface-variant shrink-0">
<span class="material-symbols-outlined text-xl">folder_open</span>
</div>
<div>
<h4 class="font-headline font-semibold text-sm text-on-surface line-clamp-1">Anexo Técnico Proyecto ZED</h4>
<p class="font-body text-xs text-on-surface-variant mt-1">Doc. ID: 1002-2023</p>
<div class="mt-2 flex items-center gap-2">
<span class="material-symbols-outlined text-[14px] text-on-surface-variant">schedule</span>
<span class="font-label text-[10px] font-bold text-on-surface-variant uppercase tracking-wider">Vence mañana</span>
</div>
</div>
</div>
</div>
<button class="w-full mt-6 py-3 border border-outline-variant/30 rounded font-label text-xs font-semibold text-on-surface hover:bg-surface-container-highest transition-colors">
                        Ver todos los urgentes
                    </button>
</div>
</div>
</main>
</div>
</body></html>