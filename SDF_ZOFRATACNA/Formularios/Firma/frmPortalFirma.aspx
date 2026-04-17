<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmPortalFirma.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Firma.frmPortalFirma" %>
<!DOCTYPE html>

<html lang="es"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Portal de Firma - ZOFRATACNA</title>
<!-- Google Fonts: Public Sans & Inter -->
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&amp;family=Public+Sans:wght@500;600;700&amp;display=swap" rel="stylesheet"/>
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
                    "inverse-surface": "#2d3133",
                    "tertiary": "#381300",
                    "secondary-container": "#cbe7f5",
                    "surface-container": "#eceef0",
                    "primary": "#001e40",
                    "surface-container-high": "#e6e8ea",
                    "primary-fixed-dim": "#a7c8ff",
                    "surface-container-lowest": "#ffffff",
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
<style>
        /* Smooth scrolling and basic resets */
        html { scroll-behavior: smooth; }
        body { -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; }
        
        /* Custom scrollbar for PDF viewer area to match UI */
        .custom-scrollbar::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }
        .custom-scrollbar::-webkit-scrollbar-track {
            background: #f2f4f6;
            border-radius: 4px;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb {
            background: #c3c6d1;
            border-radius: 4px;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb:hover {
            background: #737780;
        }
    </style>
</head>
<body class="bg-background text-on-surface font-body h-screen flex overflow-hidden">
<!-- Shared Component: SideNavBar -->
<aside class="fixed left-0 top-0 h-screen w-72 border-r border-transparent bg-slate-100 dark:bg-slate-900 z-40 flex flex-col p-4">
<!-- Brand Area -->
<div class="px-4 py-6 mb-4 flex items-center gap-4">
<div class="w-10 h-10 rounded-lg bg-primary flex items-center justify-center text-white shrink-0">
<span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">assured_workload</span>
</div>
<div class="flex flex-col">
<span class="text-xl font-bold text-[#001e40] dark:text-white font-headline tracking-tight">SDF ZOFRATACNA</span>
<span class="text-xs text-slate-500 font-label">Arquitectura de Confianza</span>
</div>
</div>
<!-- Navigation Links -->
<nav class="flex-1 space-y-1 overflow-y-auto custom-scrollbar">
<a class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 scale-95 active:scale-90 font-public-sans font-semibold tracking-tight" href="#">
<span class="material-symbols-outlined text-lg">dashboard</span>
<span class="font-body text-sm">Dashboard</span>
</a>
<!-- Active State Navigation -->
<a class="flex items-center gap-3 px-4 py-3 text-[#001e40] dark:text-white font-bold bg-white dark:bg-slate-800 rounded-lg shadow-sm font-public-sans tracking-tight" href="#">
<span class="material-symbols-outlined text-lg" style="font-variation-settings: 'FILL' 1;">description</span>
<span class="font-body text-sm">Mis Documentos</span>
</a>
<a class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 scale-95 active:scale-90 font-public-sans font-semibold tracking-tight" href="#">
<span class="material-symbols-outlined text-lg">add_box</span>
<span class="font-body text-sm">Registrar Nuevo</span>
</a>
<a class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 scale-95 active:scale-90 font-public-sans font-semibold tracking-tight" href="#">
<span class="material-symbols-outlined text-lg">archive</span>
<span class="font-body text-sm">Archivo</span>
</a>
<div class="pt-8 pb-2 px-4">
<span class="text-xs font-semibold text-slate-400 uppercase tracking-wider">Sistema</span>
</div>
<a class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 scale-95 active:scale-90 font-public-sans font-semibold tracking-tight" href="#">
<span class="material-symbols-outlined text-lg">settings</span>
<span class="font-body text-sm">Ajustes</span>
</a>
<a class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 scale-95 active:scale-90 font-public-sans font-semibold tracking-tight" href="#">
<span class="material-symbols-outlined text-lg">contact_support</span>
<span class="font-body text-sm">Soporte</span>
</a>
</nav>
<!-- User Profile Minimal -->
<div class="mt-auto pt-4 border-t border-slate-200/50">
<div class="flex items-center gap-3 px-2">
<img alt="Usuario Session" class="w-9 h-9 rounded-full bg-slate-200 object-cover border border-white" data-alt="portrait of a professional latin man in a bright office environment" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBap8glsuLmp8Cg61i-FhLJUDG7TSMZRJKasvvni7DvLW4rDlcdVvhu-r_mr_CAHCQzVsMSi-xgObCdFB28E_uLnTaI8N-E85FhIRb8v22qnCMZz57-PuK5DDjUA-hl_WJPe-pIiYoSqYhfT11VS4AinKTbYxBfaYSdgPdJLuNvxiKOgHq9zfd_KAYO9RB1xT7SlLmXsjaLR7LEAIHWNcU4kg0FlktG1Grs_EFQDA-tMXGvGVLLeCNmNKcnX6ZkdGOYkcmsJnyRTdfM"/>
<div class="flex flex-col">
<span class="text-sm font-semibold text-primary">Carlos M.</span>
<span class="text-xs text-slate-500">Gerente General</span>
</div>
</div>
</div>
</aside>
<!-- Main Content Wrapper -->
<div class="flex-1 flex flex-col ml-72 relative">
<!-- Shared Component: TopNavBar -->
<header class="fixed top-0 right-0 w-[calc(100%-18rem)] h-16 z-50 bg-white/85 dark:bg-slate-950/85 backdrop-blur-md border-b border-slate-200/50 dark:border-slate-800/50 shadow-sm dark:shadow-none flex items-center justify-between px-8 transition-all font-inter text-sm text-[#001e40] dark:text-white">
<!-- Search Bar (on_left) -->
<div class="flex items-center flex-1 max-w-md">
<div class="relative w-full group">
<span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 group-focus-within:text-primary transition-colors">search</span>
<input class="w-full bg-slate-100/50 border-none rounded-full py-2 pl-10 pr-4 text-sm focus:ring-2 focus:ring-primary/20 focus:bg-white transition-all outline-none text-slate-600 placeholder-slate-400" placeholder="Buscar documento, expediente..." type="text"/>
</div>
</div>
<!-- Actions Right -->
<div class="flex items-center gap-6">
<!-- Icon Actions -->
<div class="flex items-center gap-2">
<button class="p-2 rounded-full text-slate-600 dark:text-slate-400 hover:bg-slate-100 hover:text-[#003366] transition-all opacity-90 hover:opacity-100 relative">
<span class="material-symbols-outlined">notifications</span>
<span class="absolute top-1 right-1 w-2 h-2 bg-error rounded-full border-2 border-white"></span>
</button>
<button class="p-2 rounded-full text-slate-600 dark:text-slate-400 hover:bg-slate-100 hover:text-[#003366] transition-all opacity-90 hover:opacity-100">
<span class="material-symbols-outlined">help_outline</span>
</button>
</div>
<!-- Trailing Primary Action -->
<button class="flex items-center gap-2 text-slate-600 hover:text-error transition-colors font-medium">
<span class="material-symbols-outlined text-[1.1rem]">logout</span>
                    Cerrar Sesión
                </button>
</div>
</header>
<!-- Main Canvas (Scrollable) -->
<main class="flex-1 overflow-y-auto pt-24 px-8 pb-16 custom-scrollbar bg-background">
<div class="max-w-[1200px] mx-auto flex flex-col gap-8">
<!-- Header Section -->
<div class="flex flex-col md:flex-row md:items-start justify-between gap-4">
<div class="space-y-2">
<!-- Navigation Breadcrumb -->
<div class="flex items-center gap-2 text-xs font-label text-outline mb-1">
<span class="hover:text-primary cursor-pointer transition-colors">Mis Documentos</span>
<span class="material-symbols-outlined text-[1rem]">chevron_right</span>
<span class="text-on-surface">Bandeja de Firma</span>
</div>
<div class="flex items-center gap-4">
<h1 class="text-3xl font-headline font-semibold text-primary tracking-tight">Resolución Directoral N° 045-2023-ZOFRATACNA</h1>
<!-- Status Badge -->
<span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-tertiary-fixed text-on-tertiary-fixed-variant whitespace-nowrap">
<span class="w-1.5 h-1.5 rounded-full bg-on-tertiary-fixed-variant mr-2 opacity-70"></span>
                                Pendiente
                            </span>
</div>
<div class="flex flex-wrap items-center gap-6 text-sm text-on-surface-variant font-label">
<div class="flex items-center gap-1.5">
<span class="material-symbols-outlined text-[1.1rem] opacity-70">folder_open</span>
<span>Expediente: <strong>2023-0892-ADM</strong></span>
</div>
<div class="flex items-center gap-1.5">
<span class="material-symbols-outlined text-[1.1rem] opacity-70">calendar_today</span>
<span>Ingreso: 12 Nov 2023, 10:45 AM</span>
</div>
<div class="flex items-center gap-1.5">
<span class="material-symbols-outlined text-[1.1rem] opacity-70">person</span>
<span>Remitente: Oficina de Administración</span>
</div>
</div>
</div>
</div>
<!-- Asymmetric Bento Grid Layout -->
<div class="grid grid-cols-1 lg:grid-cols-12 gap-6 items-start">
<!-- Left Column: PDF Viewer Area (Larger span) -->
<div class="lg:col-span-8 flex flex-col gap-4">
<!-- PDF Container Card -->
<div class="bg-surface-container-lowest rounded-xl flex flex-col h-[800px] border border-outline-variant/30 overflow-hidden shadow-[0_4px_20px_rgba(25,28,30,0.02)]">
<!-- Viewer Toolbar -->
<div class="h-14 bg-surface-container-low border-b border-outline-variant/30 flex items-center justify-between px-4 shrink-0">
<div class="flex items-center gap-2">
<button class="p-1.5 rounded-lg text-on-surface-variant hover:bg-surface-variant transition-colors" title="Imprimir">
<span class="material-symbols-outlined text-[1.2rem]">print</span>
</button>
<div class="w-px h-5 bg-outline-variant/50 mx-1"></div>
<button class="p-1.5 rounded-lg text-on-surface-variant hover:bg-surface-variant transition-colors">
<span class="material-symbols-outlined text-[1.2rem]">zoom_out</span>
</button>
<span class="text-sm font-label text-on-surface-variant w-12 text-center">100%</span>
<button class="p-1.5 rounded-lg text-on-surface-variant hover:bg-surface-variant transition-colors">
<span class="material-symbols-outlined text-[1.2rem]">zoom_in</span>
</button>
</div>
<div class="flex items-center gap-3">
<span class="text-sm font-label text-on-surface-variant">Página 1 de 4</span>
<div class="flex items-center gap-1">
<button class="p-1 rounded-lg text-on-surface-variant hover:bg-surface-variant transition-colors disabled:opacity-30">
<span class="material-symbols-outlined text-[1.2rem]">keyboard_arrow_up</span>
</button>
<button class="p-1 rounded-lg text-on-surface-variant hover:bg-surface-variant transition-colors">
<span class="material-symbols-outlined text-[1.2rem]">keyboard_arrow_down</span>
</button>
</div>
</div>
</div>
<!-- Document Canvas (Simulated PDF) -->
<div class="flex-1 bg-surface-container overflow-y-auto p-8 flex justify-center custom-scrollbar">
<!-- The Paper -->
<div class="w-[600px] bg-white min-h-[850px] shadow-sm flex flex-col p-12 shrink-0">
<!-- Decorative Document Placeholder -->
<div class="flex justify-between items-start mb-12 border-b border-surface-container-high pb-6">
<div class="w-24 h-12 bg-surface-container rounded"></div>
<div class="text-right space-y-2">
<div class="h-4 w-48 bg-surface-container rounded"></div>
<div class="h-3 w-32 bg-surface-container rounded ml-auto"></div>
</div>
</div>
<div class="h-6 w-3/4 bg-surface-container rounded mb-8 mx-auto"></div>
<div class="space-y-4 mb-16">
<div class="h-3 w-full bg-surface-container rounded"></div>
<div class="h-3 w-full bg-surface-container rounded"></div>
<div class="h-3 w-11/12 bg-surface-container rounded"></div>
<div class="h-3 w-full bg-surface-container rounded"></div>
<div class="h-3 w-4/5 bg-surface-container rounded"></div>
</div>
<div class="space-y-4 mb-16">
<div class="h-3 w-full bg-surface-container rounded"></div>
<div class="h-3 w-10/12 bg-surface-container rounded"></div>
<div class="h-3 w-full bg-surface-container rounded"></div>
</div>
<!-- Signature Block Area (Simulating previous signatures visibility) -->
<div class="mt-auto grid grid-cols-2 gap-8 pt-12">
<div class="flex flex-col items-center gap-2">
<!-- Valid Signature visual -->
<div class="w-40 h-16 border border-primary-fixed-dim bg-primary-fixed/20 rounded flex items-center justify-center relative overflow-hidden">
<span class="material-symbols-outlined absolute top-1 right-1 text-primary text-sm opacity-50">verified</span>
<div class="text-center">
<div class="text-[10px] font-bold text-primary">FIRMADO DIGITALMENTE POR:</div>
<div class="text-[9px] text-primary">JUAN PEREZ GOMEZ</div>
<div class="text-[8px] text-primary/70">Fecha: 12.11.2023 11:30:00</div>
</div>
</div>
<div class="h-px w-48 bg-surface-container-high mt-4"></div>
<span class="text-xs font-label text-on-surface-variant text-center">Jefe de Administración</span>
</div>
<div class="flex flex-col items-center gap-2 opacity-30">
<!-- Pending Signature placeholder -->
<div class="w-40 h-16 border-2 border-dashed border-outline-variant rounded flex items-center justify-center bg-surface-container-lowest">
<span class="text-xs font-semibold text-outline">Espacio para Firma</span>
</div>
<div class="h-px w-48 bg-surface-container-high mt-4"></div>
<span class="text-xs font-label text-on-surface-variant text-center">Gerente General</span>
</div>
</div>
</div>
</div>
</div>
</div>
<!-- Right Column: Actions and Flow (Sticky) -->
<div class="lg:col-span-4 flex flex-col gap-6 sticky top-24">
<!-- Primary Action Card -->
<div class="bg-surface-container-lowest rounded-xl p-6 shadow-[0_4px_20px_rgba(25,28,30,0.03)] border border-outline-variant/20 flex flex-col gap-5">
<div>
<h2 class="font-headline font-semibold text-lg text-primary mb-1">Acción Requerida</h2>
<p class="text-sm font-label text-on-surface-variant">El documento requiere su firma digital para continuar el flujo institucional.</p>
</div>
<div class="bg-surface-container-low rounded-lg p-4 flex flex-col gap-3">
<div class="flex items-center justify-between">
<span class="text-sm font-medium text-on-surface">Motor de Firma</span>
<span class="text-xs font-semibold px-2 py-0.5 bg-primary-fixed text-on-primary-fixed rounded">ReFirma</span>
</div>
<div class="flex items-center gap-2 text-sm text-on-surface-variant">
<span class="material-symbols-outlined text-[1.1rem] text-primary">usb</span>
<span>Token conectado y detectado</span>
</div>
</div>
<button class="w-full bg-gradient-to-r from-primary to-primary-container text-on-primary py-3.5 rounded-lg font-headline font-semibold text-[15px] flex justify-center items-center gap-2 hover:opacity-95 transition-opacity shadow-[0_4px_12px_rgba(0,30,64,0.15)] active:scale-[0.98]">
<span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">draw</span>
                                Firmar Documento
                            </button>
<div class="flex items-center gap-3">
<button class="flex-1 py-2.5 rounded-lg border border-outline-variant/50 text-sm font-medium text-primary hover:bg-surface-container transition-colors">
                                    Descargar PDF
                                </button>
<button class="flex-1 py-2.5 rounded-lg text-sm font-medium text-error hover:bg-error-container/50 transition-colors">
                                    Observar
                                </button>
</div>
</div>
<!-- Sequence Flow Card -->
<div class="bg-surface-container-lowest rounded-xl p-6 shadow-[0_4px_20px_rgba(25,28,30,0.03)] border border-outline-variant/20">
<h3 class="font-headline font-semibold text-base text-primary mb-5 flex items-center gap-2">
<span class="material-symbols-outlined text-[1.2rem]">route</span>
                                Secuencia de Visación
                            </h3>
<div class="relative">
<!-- Vertical Line -->
<div class="absolute left-[15px] top-4 bottom-4 w-0.5 bg-surface-container-high"></div>
<div class="flex flex-col gap-6">
<!-- Step 1: Completed -->
<div class="flex items-start gap-4 relative z-10">
<div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center shrink-0 border-2 border-surface-container-lowest">
<span class="material-symbols-outlined text-white text-[1rem] font-bold">check</span>
</div>
<div class="flex flex-col pt-1">
<span class="text-sm font-semibold text-on-surface">Oficina de Administración</span>
<span class="text-xs font-label text-on-surface-variant">Juan Perez G. (Jefe)</span>
<span class="text-[10px] text-outline mt-1">12 Nov, 11:30 AM</span>
</div>
</div>
<!-- Step 2: Current/Pending -->
<div class="flex items-start gap-4 relative z-10 bg-surface-container p-2 -ml-2 rounded-lg border border-surface-container-high">
<div class="w-8 h-8 rounded-full bg-tertiary-fixed border-2 border-tertiary flex items-center justify-center shrink-0">
<div class="w-2.5 h-2.5 rounded-full bg-tertiary animate-pulse"></div>
</div>
<div class="flex flex-col pt-1">
<span class="text-sm font-semibold text-primary">Gerencia General</span>
<span class="text-xs font-label text-primary/80">Carlos M. (Usted)</span>
<span class="text-[10px] text-tertiary font-semibold mt-1">Esperando firma</span>
</div>
</div>
<!-- Step 3: Future -->
<div class="flex items-start gap-4 relative z-10 opacity-50">
<div class="w-8 h-8 rounded-full bg-surface-container-high flex items-center justify-center shrink-0 border-2 border-surface-container-lowest text-outline">
<span class="text-xs font-bold">3</span>
</div>
<div class="flex flex-col pt-1">
<span class="text-sm font-medium text-on-surface">Archivo Central</span>
<span class="text-xs font-label text-on-surface-variant">Registro Institucional</span>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</main>
</div>
</body></html>