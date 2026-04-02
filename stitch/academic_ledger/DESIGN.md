```markdown
# Design System Document: The Academic Ledger

## 1. Overview & Creative North Star
**Creative North Star: "The Architectural Archive"**

In designing for a University Digital Signing System, we must move beyond the "generic SaaS" aesthetic. This design system rejects the cluttered, line-heavy interfaces of the past in favor of **Architectural Clarity**. We treat the UI as a series of physical, high-end academic spaces—think of the quiet, authoritative weight of a modern university library or a secure government vault.

The "template" look is broken here through **Tonal Layering** and **Intentional Asymmetry**. By utilizing a sophisticated hierarchy of surfaces and editorial-grade typography, we create an environment that feels immutable, secure, and prestigious. We do not use borders to contain information; we use the weight of the layout and the shift of tones to guide the eye.

---

## 2. Colors: Tonal Architecture
This palette is rooted in a "Deep Navy" foundation, but its sophistication comes from the interplay of its neutral containers.

### The "No-Line" Rule
**Explicit Instruction:** 1px solid borders for sectioning are strictly prohibited. Boundaries must be defined solely through background color shifts. For example, a document preview area (`surface-container-low`) should sit on the main `background` without a stroke. This creates a "seamless" feel that mimics high-end stationery.

### Surface Hierarchy & Nesting
Instead of a flat grid, treat the UI as a series of nested layers.
- **Base Level:** `background` (#f7f9fb)
- **Secondary Level (Sidebars/Navigation):** `surface-container` (#e8eff3)
- **Content Cards:** `surface-container-lowest` (#ffffff) for maximum focus.
- **Active Selection:** `surface-container-highest` (#d9e4ea) to indicate depth.

### The "Glass & Gradient" Rule
To elevate the institutional feel, use **Glassmorphism** for floating action bars or mobile overlays. Use `surface` at 80% opacity with a `backdrop-filter: blur(12px)`. Main CTAs should utilize a subtle linear gradient from `primary` (#465f88) to `primary_dim` (#3a537b) to give buttons a "die-cast" professional weight.

---

## 3. Typography: The Editorial Scale
We use a dual-typeface system to balance institutional authority with digital legibility.

*   **Display & Headlines (Manrope):** Chosen for its geometric precision and modern academic flair. Use `headline-lg` for dashboard greetings and `headline-sm` for section headers.
*   **Body & Labels (Inter):** The workhorse for readability. `body-md` is the standard for document metadata, while `label-sm` (all-caps with 0.05em tracking) should be used for status indicators like "IN REVIEW."

**Hierarchy as Brand:** Large, low-contrast headlines (`on_surface_variant`) paired with high-contrast, small metadata creates an "archival" feel that conveys importance without shouting.

---

## 4. Elevation & Depth: Tonal Layering
We do not use shadows to create "pop"; we use them to simulate **Ambient Presence**.

*   **The Layering Principle:** Depth is achieved by stacking tiers. Place a `surface-container-lowest` card on a `surface-container-low` section. This creates a soft, natural lift.
*   **Ambient Shadows:** For "floating" elements like modals or signature pads, use an extra-diffused shadow: `box-shadow: 0 12px 40px rgba(42, 52, 57, 0.06)`. Note the use of `on_surface` color for the shadow tint—never use pure black.
*   **The "Ghost Border" Fallback:** If accessibility requires a boundary, use a "Ghost Border": `outline-variant` (#a9b4b9) at **15% opacity**.

---

## 5. Components: The Signature Elements

### Buttons (Institutional Weights)
- **Primary:** Gradient fill (`primary` to `primary_dim`), `white` text, `lg` (0.5rem) roundedness.
- **Secondary:** `surface-container-high` background with `on_primary_container` text. No border.
- **Tertiary:** No background. `primary` text with an underline that appears only on hover.

### Status Badges (The "Observed" Scale)
Badges should be pill-shaped (`full` roundedness) using low-saturation backgrounds to maintain a professional tone:
- **In Review:** `secondary_container` background / `on_secondary_container` text.
- **Signed:** `primary_container` background / `on_primary_container` text.
- **Observed:** `surface_variant` background / `on_surface_variant` text.

### Input Fields
Avoid the "boxed" look. Use a `surface-container-low` background with a 2px bottom-accent of `outline` that transitions to `primary` on focus. This mimics the "line" on a physical paper contract.

### Cards & Document Lists
**Rule:** No dividers. Use `Spacing Scale: 6` (1.3rem) to separate list items. Each item should exist on a `surface-container-lowest` tile when hovered, creating a "lift" effect through color alone.

### Signature Sidebar
The sidebar should be a solid block of `surface-container` with no border. Navigation items should use `title-sm` typography. Active states are indicated by a `primary` vertical "nib" (3px wide) on the leading edge.

---

## 6. Do's and Don'ts

### Do:
- **Do** use `Spacing Scale: 12` or `16` for generous margins around document previews to create a "gallery" feel.
- **Do** use `tertiary` tokens for "Internal-only" or "System-level" notes to distinguish them from user content.
- **Do** favor `surface-bright` for areas where users are expected to spend long periods reading text.

### Don't:
- **Don't** use high-vibrancy blues. Stick to the muted, authoritative `primary` (#465f88).
- **Don't** use 100% black text. Always use `on_surface` (#2a3439) for a softer, premium contrast.
- **Don't** use sharp corners. Stick to the `md` (0.375rem) or `lg` (0.5rem) scale to ensure the system feels approachable yet structured.
- **Don't** use "Drop Shadows" on cards. Rely on the "No-Line" Rule of background shifts.

---

**Director's Final Note:** This system is about the *weight of the word*. Every signature is a legal commitment; the UI must reflect that gravity through calm, spacious, and impeccably layered design.```