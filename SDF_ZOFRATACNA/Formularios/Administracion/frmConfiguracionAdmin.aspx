<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmConfiguracionAdmin.aspx.cs" Inherits="SDF_ZOFRATACNA.Formularios.Administracion.frmConfiguracionAdmin" %>
<!DOCTYPE html>

<html class="light" lang="es"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>SDF ZOFRATACNA - Ajustes de Administración</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@400;600;700&amp;family=Inter:wght@400;500;600&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
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
                    borderRadius: {
                        "DEFAULT": "0.125rem",
                        "lg": "0.25rem",
                        "xl": "0.5rem",
                        "full": "0.75rem"
                    },
                    fontFamily: {
                        "headline": ["Public Sans", "sans-serif"],
                        "body": ["Inter", "sans-serif"],
                        "label": ["Inter", "sans-serif"]
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-background text-on-background font-body antialiased selection:bg-primary-container selection:text-on-primary min-h-screen flex">
<!-- SideNavBar -->
<aside class="fixed left-0 top-0 h-screen w-72 border-r border-transparent bg-surface-container-low z-40 hidden md:flex flex-col">
<div class="flex flex-col h-full p-4">
<!-- Brand Logo -->
<div class="mb-8 px-4 flex items-center gap-3">
<div class="w-10 h-10 rounded-lg bg-primary flex items-center justify-center shrink-0">
<span class="material-symbols-outlined text-on-primary" data-icon="shield_lock" data-weight="fill" style="font-variation-settings: 'FILL' 1;">shield_lock</span>
</div>
<div>
<h1 class="text-xl font-bold text-primary font-headline tracking-tight">SDF ZOFRATACNA</h1>
<p class="text-xs text-outline font-body">Arquitectura de Confianza</p>
</div>
</div>
<!-- Navigation Links -->
<nav class="flex-1 space-y-1 font-public-sans font-semibold tracking-tight">
<a class="flex items-center gap-3 px-4 py-3 text-on-surface-variant hover:bg-surface-container-highest transition-colors duration-200 rounded-lg scale-95 active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined font-light" data-icon="dashboard">dashboard</span>
<span>Dashboard</span>
</a>
<a class="flex items-center gap-3 px-4 py-3 text-on-surface-variant hover:bg-surface-container-highest transition-colors duration-200 rounded-lg scale-95 active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined font-light" data-icon="description">description</span>
<span>Mis Documentos</span>
</a>
<a class="flex items-center gap-3 px-4 py-3 text-on-surface-variant hover:bg-surface-container-highest transition-colors duration-200 rounded-lg scale-95 active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined font-light" data-icon="add_box">add_box</span>
<span>Registrar Nuevo</span>
</a>
<a class="flex items-center gap-3 px-4 py-3 text-on-surface-variant hover:bg-surface-container-highest transition-colors duration-200 rounded-lg scale-95 active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined font-light" data-icon="archive">archive</span>
<span>Archivo</span>
</a>
<a class="flex items-center gap-3 px-4 py-3 text-primary font-bold bg-surface-container-lowest rounded-lg shadow-sm scale-95 active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined font-light" data-icon="settings">settings</span>
<span>Ajustes</span>
</a>
<a class="flex items-center gap-3 px-4 py-3 text-on-surface-variant hover:bg-surface-container-highest transition-colors duration-200 rounded-lg scale-95 active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined font-light" data-icon="contact_support">contact_support</span>
<span>Soporte</span>
</a>
</nav>
</div>
</aside>
<!-- TopNavBar -->
<header class="fixed top-0 right-0 w-full md:w-[calc(100%-18rem)] h-16 z-50 bg-surface-bright/85 backdrop-blur-md border-b border-outline-variant/15 shadow-sm hidden md:block">
<div class="flex items-center justify-end h-full px-8 gap-4 font-inter text-sm">
<div class="flex items-center gap-2 mr-4">
<button class="w-10 h-10 rounded-full flex items-center justify-center text-on-surface-variant hover:bg-surface-container-highest transition-colors">
<span class="material-symbols-outlined" data-icon="notifications">notifications</span>
</button>
<button class="w-10 h-10 rounded-full flex items-center justify-center text-on-surface-variant hover:bg-surface-container-highest transition-colors">
<span class="material-symbols-outlined" data-icon="help_outline">help_outline</span>
</button>
</div>
<div class="h-6 w-px bg-outline-variant/30"></div>
<div class="flex items-center gap-3 ml-2 cursor-pointer group">
<img alt="Usuario Session" class="w-8 h-8 rounded-full border border-outline-variant/30 object-cover" data-alt="professional corporate headshot of a business person against a neutral grey background soft lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBPd0HB0k16MRTzV9M33b91zZtddoON5JNRyJFlhwOsKIm0KjlMERFv-3w-E1Zz6sUSyB6_bEF7m5BPAQt11S8FcNpWAe2ULrtPpxFlM7OdKCZI4xNwu4EEl3w5tTPpyNTHetupXqA69tpBhOEpDdoT0T__OQHwz3aQUGKsWb-E20OdXAQ84f01h5y3d_3t-kabjM0rZf__J_av4rn3c7s4t2-dCsRkJhNzOKhKsPT8CPK5Jj254dKMwTYpG4qPnjqaSrsTiMehD_nB"/>
<div class="flex flex-col">
<span class="font-medium text-on-surface text-sm">Admin Sistema</span>
<span class="text-xs text-on-surface-variant">Soporte Técnico</span>
</div>
<span class="material-symbols-outlined text-on-surface-variant text-sm group-hover:text-primary transition-colors" data-icon="keyboard_arrow_down">keyboard_arrow_down</span>
</div>
<button class="ml-4 px-4 py-2 text-primary font-medium hover:bg-surface-container-highest rounded-lg transition-colors duration-200 text-sm flex items-center gap-2">
<span>Cerrar Sesión</span>
<span class="material-symbols-outlined text-[18px]" data-icon="logout">logout</span>
</button>
</div>
</header>
<!-- Main Content Canvas -->
<main class="flex-1 ml-0 md:ml-72 mt-0 md:mt-16 p-6 md:p-10 max-w-[1200px] mx-auto w-full">
<!-- Page Header -->
<div class="mb-8">
<div class="flex items-center gap-2 text-sm text-on-surface-variant mb-2 font-body">
<span>Ajustes</span>
<span class="material-symbols-outlined text-sm" data-icon="chevron_right">chevron_right</span>
<span class="text-primary font-medium">Configuración Maestro</span>
</div>
<h2 class="text-3xl font-semibold font-headline text-on-surface tracking-tight">Catálogos del Sistema</h2>
<p class="text-on-surface-variant mt-2 font-body leading-relaxed max-w-2xl">Mantenimiento de la tabla GEN_Maestro. Administre los estados, roles y parámetros generales que rigen el flujo documental institucional.</p>
</div>
<!-- Layout Grid -->
<div class="grid grid-cols-1 lg:grid-cols-12 gap-8">
<!-- Left Column: Master List -->
<div class="lg:col-span-8 flex flex-col gap-6">
<!-- Controls Row -->
<div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 bg-surface-container-lowest p-4 rounded-xl">
<div class="relative w-full sm:w-72">
<span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-outline" data-icon="search">search</span>
<input class="w-full pl-10 pr-4 py-2 bg-surface-container rounded-lg border-0 focus:ring-2 focus:ring-primary/20 text-sm font-body text-on-surface placeholder:text-outline-variant transition-all" placeholder="Buscar en catálogos..." type="text"/>
</div>
<div class="flex items-center gap-3 w-full sm:w-auto">
<select class="bg-surface-container text-on-surface text-sm rounded-lg border-0 focus:ring-2 focus:ring-primary/20 py-2 pl-4 pr-8 font-body w-full sm:w-auto appearance-none bg-no-repeat" style="background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2224%22%20height%3D%2224%22%20viewBox%3D%220%200%2024%2024%22%20fill%3D%22none%22%20stroke%3D%22%23737780%22%20stroke-width%3D%222%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%3E%3Cpolyline%20points%3D%226%209%2012%2015%2018%209%22%3E%3C%2Fpolyline%3E%3C%2Fsvg%3E'); background-position: right 0.5rem center; background-size: 1.2em 1.2em;">
<option>Filtrar por Dominio</option>
<option>ESTADOS_DOC</option>
<option>ROLES_SYS</option>
<option>TIPO_DOC</option>
</select>
<button class="bg-primary hover:bg-primary-container text-on-primary px-4 py-2 rounded-lg text-sm font-medium transition-colors duration-200 flex items-center gap-2 whitespace-nowrap shadow-sm">
<span class="material-symbols-outlined text-[18px]" data-icon="add">add</span>
<span>Nuevo Registro</span>
</button>
</div>
</div>
<!-- Data Table Card -->
<div class="bg-surface-container-lowest rounded-xl overflow-hidden flex flex-col relative">
<div class="overflow-x-auto">
<table class="w-full text-left border-collapse">
<thead>
<tr class="border-b border-outline-variant/15">
<th class="px-6 py-4 font-label text-xs uppercase tracking-wider text-outline font-semibold">Código</th>
<th class="px-6 py-4 font-label text-xs uppercase tracking-wider text-outline font-semibold">Dominio</th>
<th class="px-6 py-4 font-label text-xs uppercase tracking-wider text-outline font-semibold">Descripción</th>
<th class="px-6 py-4 font-label text-xs uppercase tracking-wider text-outline font-semibold">Valor</th>
<th class="px-6 py-4 font-label text-xs uppercase tracking-wider text-outline font-semibold">Estado</th>
<th class="px-6 py-4 font-label text-xs uppercase tracking-wider text-outline font-semibold text-right">Acciones</th>
</tr>
</thead>
<tbody class="text-sm font-body divide-y divide-transparent">
<tr class="hover:bg-surface-container-high transition-colors duration-150 group">
<td class="px-6 py-4 text-on-surface font-medium">EST-001</td>
<td class="px-6 py-4 text-on-surface-variant">ESTADOS_DOC</td>
<td class="px-6 py-4 text-on-surface">Pendiente de Firma</td>
<td class="px-6 py-4 text-on-surface-variant">PND</td>
<td class="px-6 py-4">
<span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-secondary-fixed text-on-secondary-fixed-variant">Activo</span>
</td>
<td class="px-6 py-4 text-right">
<button class="text-on-surface-variant hover:text-primary transition-colors p-1 opacity-0 group-hover:opacity-100 focus:opacity-100">
<span class="material-symbols-outlined text-[20px]" data-icon="edit">edit</span>
</button>
</td>
</tr>
<tr class="hover:bg-surface-container-high transition-colors duration-150 group bg-surface-container-low/30">
<td class="px-6 py-4 text-on-surface font-medium">EST-002</td>
<td class="px-6 py-4 text-on-surface-variant">ESTADOS_DOC</td>
<td class="px-6 py-4 text-on-surface">Firmado Digitalmente</td>
<td class="px-6 py-4 text-on-surface-variant">FRM</td>
<td class="px-6 py-4">
<span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-secondary-fixed text-on-secondary-fixed-variant">Activo</span>
</td>
<td class="px-6 py-4 text-right">
<button class="text-on-surface-variant hover:text-primary transition-colors p-1 opacity-0 group-hover:opacity-100 focus:opacity-100">
<span class="material-symbols-outlined text-[20px]" data-icon="edit">edit</span>
</button>
</td>
</tr>
<tr class="hover:bg-surface-container-high transition-colors duration-150 group">
<td class="px-6 py-4 text-on-surface font-medium">ROL-010</td>
<td class="px-6 py-4 text-on-surface-variant">ROLES_SYS</td>
<td class="px-6 py-4 text-on-surface">Gerente General</td>
<td class="px-6 py-4 text-on-surface-variant">GG</td>
<td class="px-6 py-4">
<span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-secondary-fixed text-on-secondary-fixed-variant">Activo</span>
</td>
<td class="px-6 py-4 text-right">
<button class="text-on-surface-variant hover:text-primary transition-colors p-1 opacity-0 group-hover:opacity-100 focus:opacity-100">
<span class="material-symbols-outlined text-[20px]" data-icon="edit">edit</span>
</button>
</td>
</tr>
<tr class="hover:bg-surface-container-high transition-colors duration-150 group bg-surface-container-low/30">
<td class="px-6 py-4 text-outline font-medium">ROL-011</td>
<td class="px-6 py-4 text-outline">ROLES_SYS</td>
<td class="px-6 py-4 text-outline line-through">Asistente Externo</td>
<td class="px-6 py-4 text-outline">AST_EXT</td>
<td class="px-6 py-4">
<span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-surface-container-highest text-on-surface-variant">Inactivo</span>
</td>
<td class="px-6 py-4 text-right">
<button class="text-on-surface-variant hover:text-primary transition-colors p-1 opacity-0 group-hover:opacity-100 focus:opacity-100">
<span class="material-symbols-outlined text-[20px]" data-icon="edit">edit</span>
</button>
</td>
</tr>
</tbody>
</table>
</div>
<!-- Pagination -->
<div class="border-t border-outline-variant/15 p-4 flex items-center justify-between bg-surface-container-lowest">
<span class="text-xs text-on-surface-variant font-body">Mostrando 1 a 4 de 42 registros</span>
<div class="flex gap-1">
<button class="w-8 h-8 rounded flex items-center justify-center text-outline hover:bg-surface-container-highest transition-colors" disabled="">
<span class="material-symbols-outlined text-[18px]" data-icon="chevron_left">chevron_left</span>
</button>
<button class="w-8 h-8 rounded flex items-center justify-center bg-primary text-on-primary text-sm font-medium">1</button>
<button class="w-8 h-8 rounded flex items-center justify-center text-on-surface hover:bg-surface-container-highest transition-colors text-sm font-medium">2</button>
<button class="w-8 h-8 rounded flex items-center justify-center text-on-surface hover:bg-surface-container-highest transition-colors text-sm font-medium">3</button>
<button class="w-8 h-8 rounded flex items-center justify-center text-on-surface hover:bg-surface-container-highest transition-colors">
<span class="material-symbols-outlined text-[18px]" data-icon="chevron_right">chevron_right</span>
</button>
</div>
</div>
</div>
</div>
<!-- Right Column: Edit Detail Form -->
<div class="lg:col-span-4">
<div class="bg-surface-container-lowest rounded-xl border border-outline-variant/15 sticky top-24 shadow-[0_20px_40px_rgba(25,28,30,0.02)]">
<!-- Form Header -->
<div class="p-6 border-b border-outline-variant/15 bg-surface-container-lowest rounded-t-xl">
<div class="flex justify-between items-center mb-1">
<h3 class="font-headline font-semibold text-lg text-on-surface">Detalle de Registro</h3>
<span class="material-symbols-outlined text-outline" data-icon="edit_note">edit_note</span>
</div>
<p class="text-xs text-on-surface-variant font-body">Editando código EST-001</p>
</div>
<!-- Form Body -->
<div class="p-6 space-y-5 bg-surface-container-lowest">
<!-- Input Group -->
<div class="space-y-1.5">
<label class="block text-xs font-semibold font-label text-on-surface-variant uppercase tracking-wider">Dominio</label>
<input class="w-full bg-surface-container-low border border-outline-variant/30 rounded-lg px-3 py-2.5 text-sm text-on-surface font-body focus:bg-surface-container-lowest focus:border-primary/50 focus:ring-1 focus:ring-primary/20 transition-all shadow-sm" readonly="" type="text" value="ESTADOS_DOC"/>
<p class="text-[11px] text-outline mt-1">El dominio agrupa registros lógicamente.</p>
</div>
<!-- Input Group -->
<div class="space-y-1.5">
<label class="block text-xs font-semibold font-label text-on-surface-variant uppercase tracking-wider">Código Interno</label>
<input class="w-full bg-surface-container-low border border-outline-variant/30 rounded-lg px-3 py-2.5 text-sm text-on-surface font-body focus:bg-surface-container-lowest focus:border-primary/50 focus:ring-1 focus:ring-primary/20 transition-all shadow-sm" readonly="" type="text" value="EST-001"/>
</div>
<!-- Input Group -->
<div class="space-y-1.5">
<label class="block text-xs font-semibold font-label text-on-surface-variant uppercase tracking-wider">Descripción <span class="text-error">*</span></label>
<textarea class="w-full bg-surface-container-lowest border border-outline-variant/40 rounded-lg px-3 py-2.5 text-sm text-on-surface font-body focus:border-primary/50 focus:ring-1 focus:ring-primary/20 transition-all shadow-sm resize-none" rows="2">Pendiente de Firma</textarea>
</div>
<!-- Input Group -->
<div class="space-y-1.5">
<label class="block text-xs font-semibold font-label text-on-surface-variant uppercase tracking-wider">Valor Físico / Alias</label>
<input class="w-full bg-surface-container-lowest border border-outline-variant/40 rounded-lg px-3 py-2.5 text-sm text-on-surface font-body focus:border-primary/50 focus:ring-1 focus:ring-primary/20 transition-all shadow-sm" type="text" value="PND"/>
</div>
<!-- Toggle -->
<div class="flex items-center justify-between pt-2">
<div class="flex flex-col">
<label class="text-sm font-medium text-on-surface font-body">Estado del Registro</label>
<span class="text-xs text-on-surface-variant">Habilitar para uso en el sistema</span>
</div>
<button aria-checked="true" class="relative inline-flex h-6 w-11 flex-shrink-0 cursor-pointer rounded-full border-2 border-transparent bg-primary transition-colors duration-200 ease-in-out focus:outline-none focus:ring-2 focus:ring-primary/20" role="switch" type="button">
<span aria-hidden="true" class="pointer-events-none inline-block h-5 w-5 transform rounded-full bg-surface-container-lowest shadow ring-0 transition duration-200 ease-in-out translate-x-5"></span>
</button>
</div>
</div>
<!-- Form Footer / Actions -->
<div class="p-6 border-t border-outline-variant/15 bg-surface-container-lowest rounded-b-xl flex justify-end gap-3">
<button class="px-4 py-2 text-sm font-medium text-primary hover:bg-primary/5 rounded-lg transition-colors duration-200" type="button">
                            Cancelar
                        </button>
<button class="px-4 py-2 text-sm font-medium text-on-primary bg-primary hover:bg-primary-container rounded-lg shadow-sm transition-colors duration-200 flex items-center gap-2" type="button">
<span class="material-symbols-outlined text-[18px]" data-icon="save">save</span>
                            Guardar Cambios
                        </button>
</div>
</div>
</div>
</div>
</main>
</body></html>