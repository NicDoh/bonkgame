# Bonk — TODO

## Current milestone: Phase 1 completion — Mine UI

### Immediate

- [ ] Remove temporary `$Mine.upgrade()` call from `town.gd`
- [ ] Create `coal.tres` item definition
- [ ] Build Mine UI panel (level display, upgrade cost with colour, upgrade button)
- [ ] Build basic resource display in town scene (Mud, Clay)
- [ ] Make Mine building clickable in town scene to open panel

---

## Phase 1 remaining

- [ ] Visual building placeholder (sprite or coloured rect) for Mine in town
- [ ] Upgrade button disabled/greyed out when player cannot afford upgrade
- [ ] Remove all unused `_process(delta)` functions or rename parameter to `_delta`
- [ ] Resolve BONK vs bonk case mismatch in save path (rename project or clear old userdata)

---

## Phase 2 — Resource Production

- [ ] Generalise production architecture so additional resources do not require duplicating Mine
- [ ] Add second resource building when design requires it

---

## Phase 3 — Buildings & Upgrades

- [ ] Define building architecture (definition + runtime state)
- [ ] Support multiple buildings in town scene

---

## Phase 4 — Persistence (partially done)

- [x] SaveManager implemented
- [x] Inventory saved and restored
- [x] Mine level saved and restored
- [ ] Save versioning / migration strategy before save format changes

---

## Later phases (do not implement yet)

- Combat foundation
- Loot system
- Crafting and refining
- Character stats and progression
- Research / Thinkery
- Quests / Hub / Camp
- Collection / Museum
- Pets
- Offline progression
- Farming
- Food and bait
