# Implementation Log

---

## 2026-08-18 — Core Architecture and Mud Production Foundation

### Implemented

- **EventBus** autoload — global signal hub (`item_produced`, `building_level_changed`)
- **Inventory** autoload — stores items as a dictionary, updated via `item_produced` signal
- **SceneManager** autoload — basic scene switching
- **ItemData** resource class — `item_name`, `description`, `icon`, `stackable`
- **DropTable**, **DropEntry**, **DropTableEntry**, **DropSource** resource classes — multi-table weighted loot system
- **ResourceBuilding** base class — tick-based production using a `TickTimer`, rolls drop table on each tick
- **Mine** (extends ResourceBuilding) — loads drop tables per level from `mine_data.json`
- **mine_data.json** — data-driven drop tables and upgrade costs for levels 1–4
- **mud.tres**, **clay.tres** — item definitions
- **Debug panel** — live inventory display, only active in debug builds
- **Main scene** and **Town scene** — basic scene structure; Town starts mine production and triggers save load

### Architecture

- All inter-system communication goes through EventBus — no direct references between systems
- Drop tables are data-driven (JSON) rather than hardcoded
- ResourceBuilding is a reusable base class; Mine extends it and overrides data loading
- Item names in JSON must match `item_name` in `.tres` files exactly (case-sensitive)

### Result

Mud production works. Mine ticks every second, rolls the drop table, and emits items to Inventory via EventBus. Debug panel shows live resource counts.

---

## 2026-08-18 — Save System

### Implemented

- **SaveManager** autoload — saves and loads `user://save.json`
- Autosave every 30 seconds via an in-code `Timer`
- Saves on `NOTIFICATION_APPLICATION_PAUSED` (mobile app backgrounding)
- `SaveManager.load()` called from `town.gd _ready()` — after Mine is ready in the scene tree
- Inventory state saved and restored correctly
- Mine level saved via `building_level_changed` signal; SaveManager stores building levels and emits the signal on load; Mine listens and reloads its drop table accordingly

### Architecture

- SaveManager is the only system that reads or writes to disk
- Building levels are communicated via EventBus in both directions (mine → save on upgrade, save → mine on load)
- Save format is JSON for now; binary format before release

### Result

Closing and reopening the game correctly restores inventory and mine level.

---

## 2026-08-18 — Mine Upgrade System

### Implemented

- `load_drop_table()` extracted from `_ready()` into its own function so it can be called on upgrade
- `can_afford_upgrade()` — reads upgrade cost from `mine_data.json` for the current level, checks against Inventory
- `upgrade()` — checks affordability, deducts cost from Inventory, increments level, emits `building_level_changed`, reloads drop table, restarts production
- Mine level 2 unlocks Clay drops; level 3 increases Clay probability; level 4 unlocks Coal (requires `coal.tres`)

### Architecture

- Upgrade cost is data-driven in `mine_data.json` alongside drop tables
- Item names in JSON must use the same capitalisation as `item_name` in `.tres` files

### Known issues

- `coal.tres` does not yet exist — level 4 will error if reached
- No player-facing UI for upgrading; a temporary `$Mine.upgrade()` call in `town.gd` was used for testing and must be removed

### Result

The upgrade loop works in code. Mud is deducted, mine level increases, drop table reloads correctly, and Clay begins dropping at level 2.

---

## 2026-08-18 — Documentation Setup

### Implemented

- `CLAUDE.md` — mentor-mode rules and development workflow
- `docs/GAME_DESIGN.md` — full game design document
- `docs/DECISIONS.md` — confirmed design decisions (D001–D048)
- `docs/OPEN_QUESTIONS.md` — unresolved design questions (OQ001–OQ044)
- `docs/ARCHITECTURE.md` — technical architecture principles (A001–A059)
- `docs/ROADMAP.md` — phased development plan (Phase 0–12)
- `docs/CURRENT_STATE.md` — current project status
- `docs/SESSION_LOG.md` — this file

### Result

Project documentation is in place. Future sessions should begin by reading `CURRENT_STATE.md`.
