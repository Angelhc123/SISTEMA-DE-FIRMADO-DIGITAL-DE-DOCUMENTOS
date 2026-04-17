<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmSeguimientoAuditoria.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Documentos.frmSeguimientoAuditoria" %>
<!DOCTYPE html>

<html class="light" lang="es"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Seguimiento de Auditoría - SDF ZOFRATACNA</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&amp;family=Public+Sans:wght@400;600;700;800&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
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
<style>
        .material-symbols-outlined {
          font-variation-settings: 'FILL' 0, 'wght' 300, 'GRAD' 0, 'opsz' 24;
        }
        .material-symbols-outlined.fill-icon {
          font-variation-settings: 'FILL' 1, 'wght' 300, 'GRAD' 0, 'opsz' 24;
        }
      </style>
</head>
<body class="bg-background text-on-surface font-body min-h-screen flex selection:bg-primary-container selection:text-on-primary-container">
<!-- SideNavBar Component -->
<aside class="fixed left-0 top-0 h-screen w-72 border-r border-transparent bg-slate-100 dark:bg-slate-900 z-40">
<div class="flex flex-col h-full p-4">
<!-- Brand Area -->
<div class="flex items-center gap-3 px-4 py-6 mb-4">
<div class="w-10 h-10 rounded-lg bg-primary flex items-center justify-center shrink-0">
<span class="material-symbols-outlined text-on-primary fill-icon text-xl" data-icon="assured_workload">assured_workload</span>
</div>
<div class="flex flex-col">
<span class="text-xl font-bold text-[#001e40] dark:text-white font-public-sans tracking-tight">SDF ZOFRATACNA</span>
<span class="text-xs text-on-surface-variant font-medium">Arquitectura de Confianza</span>
</div>
</div>
<!-- Navigation Links -->
<nav class="flex flex-col gap-1 flex-1">
<!-- Dashboard (Inactive) -->
<a class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 active:scale-90 font-public-sans font-semibold tracking-tight group" href="#">
<span class="material-symbols-outlined text-[20px] group-hover:scale-110 transition-transform" data-icon="dashboard">dashboard</span>
<span>Dashboard</span>
</a>
<!-- Mis Documentos (Active based on Intent: Audit Trail of a Document) -->
<a class="flex items-center gap-3 px-4 py-3 rounded-lg text-[#001e40] dark:text-white font-bold bg-white dark:bg-slate-800 shadow-sm transition-colors duration-200 active:scale-90 font-public-sans tracking-tight group relative" href="#">
<div class="absolute left-0 top-1/2 -translate-y-1/2 w-1 h-6 bg-primary rounded-r-full"></div>
<span class="material-symbols-outlined text-[20px] fill-icon text-primary group-hover:scale-110 transition-transform" data-icon="description">description</span>
<span>Mis Documentos</span>
</a>
<!-- Registrar Nuevo (Inactive) -->
<a class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 active:scale-90 font-public-sans font-semibold tracking-tight group" href="#">
<span class="material-symbols-outlined text-[20px] group-hover:scale-110 transition-transform" data-icon="add_box">add_box</span>
<span>Registrar Nuevo</span>
</a>
<!-- Archivo (Inactive) -->
<a class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 active:scale-90 font-public-sans font-semibold tracking-tight group" href="#">
<span class="material-symbols-outlined text-[20px] group-hover:scale-110 transition-transform" data-icon="archive">archive</span>
<span>Archivo</span>
</a>
</nav>
<!-- Bottom Actions -->
<div class="mt-auto pt-4 border-t border-slate-200/50 dark:border-slate-800/50 flex flex-col gap-1">
<a class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 active:scale-90 font-public-sans font-semibold tracking-tight group" href="#">
<span class="material-symbols-outlined text-[20px] group-hover:scale-110 transition-transform" data-icon="settings">settings</span>
<span>Ajustes</span>
</a>
<a class="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:text-[#003366] dark:hover:text-white hover:bg-slate-200/50 dark:hover:bg-slate-800/50 transition-colors duration-200 active:scale-90 font-public-sans font-semibold tracking-tight group" href="#">
<span class="material-symbols-outlined text-[20px] group-hover:scale-110 transition-transform" data-icon="contact_support">contact_support</span>
<span>Soporte</span>
</a>
</div>
</div>
</aside>
<!-- TopNavBar Component -->
<header class="fixed top-0 right-0 w-[calc(100%-18rem)] h-16 z-50 bg-white/85 dark:bg-slate-950/85 backdrop-blur-md border-b border-slate-200/50 dark:border-slate-800/50 shadow-sm dark:shadow-none transition-all">
<div class="flex items-center justify-between px-8 h-full">
<!-- Contextual Breadcrumb / Title Area -->
<div class="flex items-center gap-2 font-inter text-sm text-slate-600 dark:text-slate-400">
<a class="hover:text-[#003366] dark:hover:text-blue-300 transition-all opacity-90 hover:opacity-100 flex items-center gap-1" href="#">
<span class="material-symbols-outlined text-[18px]" data-icon="folder_open">folder_open</span>
                    Mis Documentos
                </a>
<span class="material-symbols-outlined text-[16px] opacity-50" data-icon="chevron_right">chevron_right</span>
<span class="text-[#003366] font-semibold">Auditoría: EXP-2023-00892</span>
</div>
<!-- Right Actions -->
<div class="flex items-center gap-6">
<!-- Icon Actions -->
<div class="flex items-center gap-4 text-slate-600 dark:text-slate-400">
<button class="hover:text-[#003366] dark:hover:text-blue-300 transition-all opacity-90 hover:opacity-100 relative">
<span class="material-symbols-outlined" data-icon="notifications">notifications</span>
<span class="absolute top-0 right-0 w-2 h-2 bg-error rounded-full ring-2 ring-white"></span>
</button>
<button class="hover:text-[#003366] dark:hover:text-blue-300 transition-all opacity-90 hover:opacity-100">
<span class="material-symbols-outlined" data-icon="help_outline">help_outline</span>
</button>
</div>
<!-- Separation -->
<div class="w-px h-6 bg-slate-200 dark:bg-slate-800"></div>
<!-- Profile Area -->
<div class="flex items-center gap-3">
<div class="flex flex-col items-end hidden md:flex">
<span class="font-inter text-sm font-semibold text-[#001e40] dark:text-white leading-tight">Dr. Carlos Mendoza</span>
<span class="text-xs text-slate-500 font-medium">Asesoría Legal</span>
</div>
<button class="relative group">
<img alt="Usuario Session" class="w-9 h-9 rounded-full object-cover ring-2 ring-transparent group-hover:ring-primary/20 transition-all" data-alt="professional corporate headshot of a mature hispanic man in a dark blue suit with a subtle neutral office background" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBmGrBq7dLe6fCjNvlQzqz2CnCcA_IVU4ikVLZRLn3hnanu1IUb1iO5SfVRKGhkFoFzCvFVeJL7LHmkQuLUPUhkYKyYhEfCg4u_X7RyGOiuj2DlSn0RugtgFHddp_gwTY3eBmsnRKqKWKv4o2C3sihR0BPBI7t-qlR2ZYSvCgyrZnk1m9eYBxhnLyGssa9LWmG_42hPZMEx-kvgNWjSBFfF3qwQP4bXmfbKMeAJvBICFcYGbHgSiv934IzvrseeOlhMdhg33fJe6S50"/>
</button>
<button class="text-sm font-inter font-medium text-slate-600 hover:text-error transition-colors flex items-center gap-1 ml-2">
<span class="material-symbols-outlined text-[18px]" data-icon="logout">logout</span>
<span class="hidden xl:inline">Cerrar Sesión</span>
</button>
</div>
</div>
</div>
</header>
<!-- Main Content Canvas -->
<main class="ml-72 mt-16 w-full p-10 pb-20 overflow-y-auto">
<div class="mx-auto max-w-[1200px] flex flex-col gap-8">
<!-- Header Section -->
<section class="flex flex-col md:flex-row md:items-start justify-between gap-6">
<div class="flex flex-col gap-2 max-w-3xl">
<div class="flex items-center gap-3 mb-1">
<span class="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-md bg-tertiary-fixed text-on-tertiary-fixed-variant text-xs font-semibold tracking-wide uppercase font-label">
<span class="material-symbols-outlined text-[14px]" data-icon="pending_actions">pending_actions</span>
                            En Proceso
                        </span>
<span class="text-sm text-on-surface-variant font-medium font-inter">Alta Prioridad</span>
</div>
<h1 class="text-3xl font-headline font-semibold text-primary tracking-tight leading-tight">
                        Contrato de Concesión Comercial - Lote B4
                    </h1>
<p class="text-on-surface-variant font-body text-base leading-relaxed">
                        Expediente: <span class="font-semibold text-primary">EXP-2023-00892</span> • Iniciado por: Departamento de Operaciones
                    </p>
</div>
<div class="flex items-center gap-3 shrink-0">
<button class="px-4 py-2.5 rounded-lg bg-transparent text-primary hover:bg-surface-container transition-colors duration-200 font-inter text-sm font-medium flex items-center gap-2">
<span class="material-symbols-outlined text-[20px]" data-icon="print">print</span>
                        Imprimir
                    </button>
<button class="px-5 py-2.5 rounded-lg bg-secondary-container text-on-secondary-container hover:bg-secondary-container/80 transition-colors duration-200 font-inter text-sm font-semibold flex items-center gap-2 shadow-sm shadow-black/5">
<span class="material-symbols-outlined text-[20px]" data-icon="download">download</span>
                        Descargar PDF
                    </button>
</div>
</section>
<!-- Bento Grid Summary -->
<section class="grid grid-cols-1 md:grid-cols-3 gap-6">
<!-- Card 1: Progreso de Firmas -->
<div class="bg-surface-container-lowest p-6 rounded-2xl border border-outline-variant/15 flex flex-col gap-4 relative overflow-hidden">
<div class="absolute -right-4 -top-4 w-24 h-24 bg-primary-fixed-dim/20 rounded-full blur-2xl pointer-events-none"></div>
<div class="flex items-center gap-3 text-primary">
<span class="material-symbols-outlined fill-icon" data-icon="signature">signature</span>
<h3 class="font-headline font-semibold text-base">Progreso de Firmas</h3>
</div>
<div class="flex items-end gap-2 mt-2">
<span class="text-4xl font-headline font-bold text-primary leading-none">2</span>
<span class="text-xl font-headline text-on-surface-variant leading-none pb-0.5">/ 3</span>
</div>
<div class="w-full bg-surface-container-high h-2 rounded-full overflow-hidden mt-1">
<div class="bg-primary h-full w-[66%] rounded-full"></div>
</div>
<p class="text-xs text-on-surface-variant font-inter mt-1">Falta firma de: Gerencia General</p>
</div>
<!-- Card 2: Última Actividad -->
<div class="bg-surface-container-lowest p-6 rounded-2xl border border-outline-variant/15 flex flex-col gap-4">
<div class="flex items-center gap-3 text-secondary">
<span class="material-symbols-outlined fill-icon" data-icon="history">history</span>
<h3 class="font-headline font-semibold text-base">Última Actividad</h3>
</div>
<div class="flex flex-col mt-2">
<span class="text-lg font-headline font-semibold text-on-surface">Hace 2 horas</span>
<span class="text-sm text-on-surface-variant font-inter mt-1">Revisión aprobada por Asesoría Legal</span>
</div>
<div class="mt-auto pt-4 flex items-center gap-2 text-xs font-inter text-on-surface-variant border-t border-surface-container-high">
<span class="material-symbols-outlined text-[14px]" data-icon="person">person</span>
                        Dr. Carlos Mendoza
                    </div>
</div>
<!-- Card 3: Detalles del Documento -->
<div class="bg-surface-container-lowest p-6 rounded-2xl border border-outline-variant/15 flex flex-col gap-4">
<div class="flex items-center gap-3 text-secondary">
<span class="material-symbols-outlined fill-icon" data-icon="info">info</span>
<h3 class="font-headline font-semibold text-base">Metadatos</h3>
</div>
<ul class="flex flex-col gap-3 mt-2 font-inter text-sm">
<li class="flex justify-between items-center">
<span class="text-on-surface-variant">Tipo:</span>
<span class="font-medium text-on-surface">Contrato Principal</span>
</li>
<li class="flex justify-between items-center">
<span class="text-on-surface-variant">Creación:</span>
<span class="font-medium text-on-surface">12 Oct 2023</span>
</li>
<li class="flex justify-between items-center">
<span class="text-on-surface-variant">Folios:</span>
<span class="font-medium text-on-surface">14</span>
</li>
</ul>
</div>
</section>
<!-- Traceability Timeline Core -->
<section class="mt-4">
<h2 class="text-xl font-headline font-semibold text-primary mb-6 flex items-center gap-2">
<span class="material-symbols-outlined" data-icon="route">route</span>
                    Ruta de Auditoría
                </h2>
<div class="bg-surface-container-low rounded-2xl p-8 relative">
<!-- Vertical Line connecting nodes -->
<div class="absolute left-[3.25rem] top-12 bottom-12 w-0.5 bg-outline-variant/30 hidden md:block"></div>
<div class="flex flex-col gap-6 relative z-10">
<!-- Timeline Item: Pending (Current State) -->
<div class="flex flex-col md:flex-row gap-6 relative group">
<div class="hidden md:flex flex-col items-center shrink-0 w-10">
<div class="w-10 h-10 rounded-full bg-surface-container-lowest border-2 border-primary border-dashed flex items-center justify-center shadow-sm">
<div class="w-3 h-3 rounded-full bg-primary animate-pulse"></div>
</div>
</div>
<div class="bg-surface-container-lowest p-6 rounded-xl flex-1 shadow-[0_2px_10px_rgba(25,28,30,0.02)] border-l-4 border-l-primary hover:bg-surface-bright transition-colors duration-200">
<div class="flex justify-between items-start mb-2">
<div class="flex flex-col">
<span class="text-xs font-semibold uppercase tracking-wider text-primary font-label mb-1">Paso Actual</span>
<h4 class="text-lg font-headline font-semibold text-on-surface">Pendiente de Firma Final</h4>
</div>
<span class="text-xs font-inter text-on-surface-variant flex items-center gap-1">
<span class="material-symbols-outlined text-[14px]" data-icon="schedule">schedule</span>
                                        En espera
                                    </span>
</div>
<p class="text-sm font-inter text-on-surface-variant leading-relaxed">
                                    El documento ha sido derivado a la Gerencia General para su validación criptográfica final.
                                </p>
<div class="mt-4 flex items-center gap-3">
<div class="w-8 h-8 rounded-full bg-surface-variant flex items-center justify-center text-on-surface-variant text-xs font-bold uppercase">GG</div>
<span class="text-sm font-medium text-on-surface font-inter">Gerencia General</span>
</div>
</div>
</div>
<!-- Timeline Item: Signed/Approved -->
<div class="flex flex-col md:flex-row gap-6 relative">
<div class="hidden md:flex flex-col items-center shrink-0 w-10">
<div class="w-10 h-10 rounded-full bg-primary flex items-center justify-center shadow-sm text-on-primary">
<span class="material-symbols-outlined text-[20px]" data-icon="check_circle">check_circle</span>
</div>
</div>
<div class="bg-surface-container-lowest p-6 rounded-xl flex-1 shadow-[0_2px_10px_rgba(25,28,30,0.02)] hover:bg-surface-bright transition-colors duration-200">
<div class="flex justify-between items-start mb-2">
<div class="flex flex-col">
<h4 class="text-lg font-headline font-semibold text-on-surface">Firma Digital Estampada</h4>
</div>
<span class="text-xs font-inter text-on-surface-variant text-right">
                                        14 Oct 2023<br/>10:45 AM
                                    </span>
</div>
<div class="inline-flex items-center gap-1.5 px-2.5 py-1 mt-2 rounded-md bg-gradient-to-r from-primary-fixed to-primary-fixed-dim text-on-primary-fixed text-xs font-semibold tracking-wide font-label mb-3">
<span class="material-symbols-outlined text-[14px]" data-icon="verified_user">verified_user</span>
                                    Firma Válida
                                </div>
<p class="text-sm font-inter text-on-surface-variant leading-relaxed">
                                    Certificado digital verificado exitosamente (RENIEC). Hash del documento sellado.
                                </p>
<div class="mt-4 flex items-center gap-3 bg-surface-container p-3 rounded-lg">
<img alt="Firma" class="w-8 h-8 rounded-full object-cover" data-alt="professional corporate headshot of a mature hispanic man in a dark blue suit" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCV08vbLxNT3LAW423102D6GqSBFpatpHMK3Zx1pPEV1BDjl4dSOYz14tw9jlCsAuptuxqKN978eYv8jFmBMY9Nohs4jQo3Vl5dBz-2loX-JQk0NDPdy-tz3s9D_OPpbcnmuyTqHMNUNa7hSb2H-TfBn6mhTk30t9k59x7_rftfSEAy9_YntQRE8S53k3I00M4_VYBp7p3CEP3xqdhr8a9Suu1IKMxmNsOIEH02s-IYr5YaDIgPMRZYYncrGv5QaSeIJEDopZbEljwE"/>
<div class="flex flex-col">
<span class="text-sm font-medium text-on-surface font-inter">Dr. Carlos Mendoza</span>
<span class="text-xs text-on-surface-variant">Asesoría Legal</span>
</div>
</div>
</div>
</div>
<!-- Timeline Item: Observed (Exception handling) -->
<div class="flex flex-col md:flex-row gap-6 relative">
<div class="hidden md:flex flex-col items-center shrink-0 w-10">
<div class="w-10 h-10 rounded-full bg-error-container text-on-error-container flex items-center justify-center shadow-sm">
<span class="material-symbols-outlined text-[20px]" data-icon="assignment_return">assignment_return</span>
</div>
</div>
<div class="bg-surface-container-lowest p-6 rounded-xl flex-1 shadow-[0_2px_10px_rgba(25,28,30,0.02)] border-l-4 border-l-error hover:bg-surface-bright transition-colors duration-200">
<div class="flex justify-between items-start mb-2">
<div class="flex flex-col">
<h4 class="text-lg font-headline font-semibold text-on-surface">Documento Observado</h4>
</div>
<span class="text-xs font-inter text-on-surface-variant text-right">
                                        13 Oct 2023<br/>16:20 PM
                                    </span>
</div>
<span class="inline-flex items-center gap-1.5 px-2.5 py-1 mt-1 mb-3 rounded-md bg-error-container text-on-error-container text-xs font-semibold tracking-wide font-label">
<span class="material-symbols-outlined text-[14px]" data-icon="error">error</span>
                                    Corrección Requerida
                                </span>
<div class="bg-surface-container-low p-4 rounded-lg mt-2">
<p class="text-sm font-inter text-on-surface italic leading-relaxed">
                                        "Se detectó un error en la cláusula 4.2 respecto a los plazos de entrega. Favor de alinear con el anexo técnico antes de proceder con la firma."
                                    </p>
</div>
<div class="mt-4 flex items-center gap-3">
<div class="w-8 h-8 rounded-full bg-surface-variant flex items-center justify-center text-on-surface-variant text-xs font-bold uppercase">AL</div>
<span class="text-sm font-medium text-on-surface font-inter">Revisión Legal</span>
</div>
</div>
</div>
<!-- Timeline Item: Created -->
<div class="flex flex-col md:flex-row gap-6 relative">
<div class="hidden md:flex flex-col items-center shrink-0 w-10">
<div class="w-10 h-10 rounded-full bg-secondary-fixed text-on-secondary-fixed-variant flex items-center justify-center shadow-sm">
<span class="material-symbols-outlined text-[20px]" data-icon="upload_file">upload_file</span>
</div>
</div>
<div class="bg-surface-container-lowest p-6 rounded-xl flex-1 shadow-[0_2px_10px_rgba(25,28,30,0.02)] hover:bg-surface-bright transition-colors duration-200">
<div class="flex justify-between items-start mb-2">
<div class="flex flex-col">
<h4 class="text-lg font-headline font-semibold text-on-surface">Ingreso al Sistema SDF</h4>
</div>
<span class="text-xs font-inter text-on-surface-variant text-right">
                                        12 Oct 2023<br/>09:15 AM
                                    </span>
</div>
<span class="inline-flex items-center gap-1.5 px-2.5 py-1 mt-1 mb-3 rounded-md bg-secondary-fixed text-on-secondary-fixed-variant text-xs font-semibold tracking-wide font-label">
                                    Registrado
                                </span>
<p class="text-sm font-inter text-on-surface-variant leading-relaxed">
                                    Carga inicial del documento en formato PDF/A por mesa de partes virtual. Asignación de expediente automático.
                                </p>
<div class="mt-4 flex items-center gap-3">
<div class="w-8 h-8 rounded-full bg-surface-variant flex items-center justify-center text-on-surface-variant text-xs font-bold uppercase">OP</div>
<span class="text-sm font-medium text-on-surface font-inter">Operaciones - Mesa de Partes</span>
</div>
</div>
</div>
</div>
</div>
</section>
</div>
</main>
</body></html>