# Bonk — Current Project State

## PROJECT STATUS

**Current phase:**
Phase 1 — Mud / City Core

---

## Implemented

- Godot project structure (`autoloads/`, `resources/`, `data/`, `scenes/`, `docs/`)
- **EventBus** (Autoload) — global signal hub with `item_produced` and `building_level_changed`
- **Inventory** (Autoload) — stores all items as a dictionary, listens to `item_produced`
- **SceneManager** (Autoload) — basic scene switching
- **SaveManager** (Autoload) — saves/loads `user://save.json`, autosaves every 30 seconds, saves on `NOTIFICATION_APPLICATION_PAUSED`
- **ResourceBuilding** (base class) — tick-based drop table production via `TickTimer`
- **Mine** (extends ResourceBuilding) — loads drop tables from `mine_data.json` per level, `upgrade()` deducts cost and reloads drop table, `can_afford_upgrade()` checks inventory
- **mine_data.json** — drop tables and upgrade costs for levels 1–4 (Mud, Clay, Coal)
- **ItemData** resource class — `item_name`, `description`, `icon`, `stackable`
- **DropTable**, **DropEntry**, **DropTableEntry**, **DropSource** resource classes
- **mud.tres**, **clay.tres** — item definitions
- **Debug panel** — live inventory display, only active in debug builds
- **Main scene** — instantiates debug panel in debug builds, no other logic
- **Town scene** — calls `SaveManager.load()` on ready, starts mine production

---

## Partially implemented

- **Mine upgrade system** — `upgrade()` logic is complete, but there is no player-facing UI; a temporary `$Mine.upgrade()` call in `town.gd` was used for testing and must be removed before the next milestone
- **Save system** — inventory and mine level are saved and restored; mine level restoration works via EventBus (`building_level_changed` emitted during load, mine listens and reloads drop table)
- **Phase 1 loop** — Mud produces, accumulates, and the mine can be upgraded, but the player cannot do any of this without a UI

---

## Not implemented

- Player-facing town UI (resource display, building interaction, upgrade button)
- Visual building representation (sprites/art)
- Multiple buildings (only Mine exists)
- Combat system
- Character stats and progression
- Loot system
- Crafting and refining
- Research / Thinkery
- Quests / Hub / Camp
- Collection / Museum
- Pets
- Offline progression (currently only real-time tick production)
- Coal.tres (Coal is referenced in level 4 mine_data.json but the item file does not exist yet)

---

## Current milestone

Complete Phase 1 — Mud / City Core by building the minimum player-facing UI:

- Resource display showing current Mud (and Clay when available)
- Mine panel showing current level, upgrade cost, and an upgrade button
- Upgrade button disabled or visually distinct when the player cannot afford it

The loop must be playable without any temporary debug code.

---

## Next task

Build the Mine UI panel:

1. A clickable Mine building in the town scene
2. A panel that appears when the Mine is clicked, showing:
   - Current level
   - Current upgrade cost (with green/red cost display)
   - Upgrade button
3. A basic resource display visible in the town scene

---

## Known problems

- `town.gd` still contains a temporary `$Mine.upgrade()` call used for testing — must be removed
- `Coal.tres` does not exist; level 4 mine drop table will error if reached
- Case mismatch warning on save file path (`bonk` vs `BONK`) — harmless on macOS but will fail on case-sensitive platforms such as iOS; the old BONK userdata folder from a previous project is causing the warning
- Several `_process(delta)` functions exist with unused `delta` parameters — Godot warns about these; they should be cleaned up or removed
