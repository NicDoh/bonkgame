# Bonk — Development Roadmap

## Purpose

This document defines the recommended development order for Bonk.

The roadmap exists to prevent development from becoming chaotic or
over-engineered.

Bonk should be built incrementally.

Each phase should establish a stable foundation before the next major system
is introduced.

The roadmap is a development order, not a complete list of every feature
Bonk will eventually contain.

The game design may evolve during development. If the design changes, this
document should be updated rather than allowing development to silently drift.

---

# 1. Current Development Philosophy

Bonk should be developed from the smallest complete gameplay loops outward.

Do not attempt to build the entire game at once.

A feature should generally be introduced when:

- its design is sufficiently understood
- the required architecture exists
- it provides meaningful value
- it can be tested independently

Avoid implementing systems merely because they are planned for the final
game.

---

# 2. Development Order

The current high-level development order is:

PHASE 0 — Foundation
        ↓
PHASE 1 — Mud / City Core
        ↓
PHASE 2 — Resource Production
        ↓
PHASE 3 — Buildings & Upgrades
        ↓
PHASE 4 — Persistence
        ↓
PHASE 5 — Combat Foundation
        ↓
PHASE 6 — Loot & Inventory
        ↓
PHASE 7 — Crafting & Equipment
        ↓
PHASE 8 — Character Progression
        ↓
PHASE 9 — Research / Thinkery
        ↓
PHASE 10 — Quests / Story
        ↓
PHASE 11 — Collection / Museum
        ↓
PHASE 12 — Expansion & Polish

This order is not immutable.

If implementation reveals that two phases should be reordered, the change
should be discussed and documented rather than made silently.

---

# 3. Phase 0 — Foundation

## Goal

Establish the minimum technical foundation required to build Bonk cleanly.

This phase should remain intentionally small.

### Expected foundations

- Godot project
- basic project structure
- main game scene
- basic script structure
- basic data/resource structure
- basic game state handling where required
- basic UI foundation

### Important

Do not build major gameplay systems during this phase.

The purpose is to establish a clean starting point, not to create a giant
framework.

### Completion criteria

Phase 0 is complete when:

- the game launches correctly
- the project structure is understandable
- scripts can be added consistently
- scenes can be created and instantiated cleanly
- the basic architecture can support the first gameplay loop

---

# 4. Phase 1 — Mud / City Core

## Goal

Build the first complete Bonk gameplay loop before combat exists.

This is the current primary development phase.

The purpose is to prove that Bonk can have a satisfying resource-production
loop independently of combat.

## Core Loop

The first loop should conceptually be:

Mudhole
   ↓
Produces mud
   ↓
Player collects / receives mud
   ↓
Mud accumulates
   ↓
Player spends mud
   ↓
Mudhole improves
   ↓
Production increases
   ↓
Repeat

The implementation should be as simple as possible while still following the
architecture.

## Initial Mud System

The Mud system should establish:

- mud as a resource
- a source of mud
- production over time
- resource accumulation
- player interaction with the resource
- a visible representation of the resource
- a basic upgrade loop

The exact mechanics may evolve.

## Mudhole

The Mudhole should eventually have:

- level
- production rate
- upgrade cost
- resource output
- UI representation

Do not add unnecessary mechanics yet.

For example, do not prematurely add:

- workers
- multiple mud types
- complex production modifiers
- offline progression
- automation systems
- research dependencies

unless they are actually required by the current implementation.

## Completion Criteria

Phase 1 is complete when the following loop works reliably:

Player enters city
        ↓
Mud is produced
        ↓
Mud amount increases
        ↓
Player can see the amount
        ↓
Player can upgrade the Mudhole
        ↓
Upgrade costs mud
        ↓
Production improves
        ↓
The loop continues

At this point Bonk should already feel like a very small functioning game
rather than merely a collection of technical systems.

---

# 5. Phase 2 — Resource Production

## Goal

Generalize the city/resource architecture so Bonk can support additional
resources without duplicating the Mud system.

Potential future resources include:

- clay
- stone
- metal
- wood
- other materials

The exact resource list should come from the game design documentation.

## Important Principle

Do not make every resource its own completely separate system.

If Mud, Clay, Stone and Metal behave according to the same fundamental
production model, the architecture should allow them to share the same
underlying logic.

For example:

ResourceDefinition
        ↓
ProductionSystem
        ↓
Resource

However, do not create a generalized framework before the actual use case
requires it.

The first Mud implementation should be allowed to reveal what needs to be
generalized.

## Completion Criteria

Phase 2 is complete when adding another basic resource does not require
copying and rewriting the entire Mud system.

---

# 6. Phase 3 — Buildings & Upgrades

## Goal

Establish the core city-building structure.

Potential buildings include:

- Mudhole
- Thinkery
- Forge
- Refinery
- Hub / Camp
- Museum / Trophy Hall
- storage, if required
- future production buildings

Not all of these should be implemented in this phase.

The purpose of this phase is to establish the reusable building architecture.

## Building Architecture

A building should be able to have:

- definition
- runtime state
- level
- upgrade requirements
- production or functionality
- UI representation

Static building information should be data-driven where practical.

Runtime information should remain separate from the definition.

## Completion Criteria

The architecture should allow a second building to be introduced without
copying the entire implementation of the first building.

---

# 7. Phase 4 — Persistence

## Goal

Make Bonk retain meaningful player progress.

Persistent state will eventually include things such as:

- resources
- buildings
- building levels
- inventory
- character progression
- research
- quests
- collection
- other persistent progression

Only persist information that actually needs to survive a session.

## Initial Save System

The first save system should be intentionally simple.

It should establish:

Runtime State
      ↓
Save System
      ↓
Save Data

and:

Save Data
      ↓
Load System
      ↓
Runtime State

Do not build an unnecessarily complicated save architecture before the
actual persistent state exists.

## Completion Criteria

Closing and reopening the game should restore the important city/resource
progress accurately.

---

# 8. Phase 5 — Combat Foundation

## Goal

Introduce Bonk's combat system after the city loop is stable.

Combat should initially focus on the core simulation rather than visual
polish.

## Initial Combat Architecture

Conceptually:

Player
   ↓
Combat Input
   ↓
Combat Simulation
   ↓
Battle Result

The simulation should be independent from combat presentation.

## Initial Combat Scope

The first combat implementation should establish only the minimum required
combat rules.

Potential components include:

- attacker
- defender
- attack types
- accuracy
- damage
- defence
- HP
- attack timing
- combat result

Do not implement every planned combat mechanic immediately.

## Completion Criteria

A battle can be simulated reliably and produces a clear result.

The result can later be presented visually.

---

# 9. Phase 6 — Loot & Inventory

## Goal

Connect combat to Bonk's collection/progression loop.

Conceptually:

Combat
   ↓
Victory
   ↓
Loot Roll
   ↓
Items
   ↓
Inventory

## Loot

Loot should be data-driven.

The architecture should support:

- common items
- uncommon items
- rare items
- extremely rare items
- multiple drops
- future modifiers

Rare items must remain genuinely rare.

Do not introduce mechanics such as Luck simply because the architecture can
support them.

Luck should only exist if its final design provides meaningful gameplay value.

## Inventory

Inventory should establish:

- item definitions
- item stacks
- item acquisition
- item removal
- item display
- basic inventory persistence

## Completion Criteria

A player can defeat an enemy, receive loot and see the resulting items in
their inventory.

---

# 10. Phase 7 — Crafting & Equipment

## Goal

Introduce the transformation of resources and loot into useful items.

This phase covers systems such as:

Raw resources
    ↓
Refinement
    ↓
Materials
    ↓
Crafting
    ↓
Weapons / Gear / Items

Examples may include:

- metal → bars
- bones → carved bones
- string → rope
- materials → weapons
- materials → equipment

The exact recipes should be defined by the game design.

## Refinement

Refinement should be distinct from crafting where that distinction is useful.

For example:

Metal Ore
    ↓
Metal Bar

is refinement.

Whereas:

Metal Bar + Wood + String
    ↓
Weapon

is crafting.

Do not force every transformation into separate systems if the distinction
does not provide meaningful value.

## Equipment

Equipment should integrate with:

- character stats
- combat
- inventory
- item definitions

Equipment should not contain the combat formulas themselves.

## Completion Criteria

The player can obtain raw materials, refine them and use them to create and
equip useful items.

---

# 11. Phase 8 — Character Progression

## Goal

Establish Bonk's player progression system.

This includes the distinction between:

- overall level
- combat-related progression
- individual stats
- skills, if retained
- collection-based progression

## Overall Level

The overall level is primarily an indicator of the player's overall progress.

It should communicate:

> How far has this player progressed through Bonk?

It may be used for requirements in some situations, but it should not become
the central mechanism behind every feature.

## Combat Progression

Combat XP should be based on combat activity.

The current design direction is:

- XP for dealing damage
- overall XP for winning encounters

This should remain separate from the actual combat calculations.

## Stat Progression

The exact final stat structure remains a design concern.

Do not hardcode assumptions into the architecture until the stat design is
confirmed.

---

# 12. Phase 9 — Research / Thinkery

## Goal

Introduce the Thinkery as Bonk's research/discovery system.

The Thinkery should not simply be:

Spend research points
    ↓
Unlock node

The current design direction is a more tangible system involving:

- logical items
- quests
- discoveries
- research requirements
- multiple interconnected departments

## Research Structure

Research may contain different departments such as:

- Combat
- City / Infrastructure
- other future departments

Branches may connect.

The player should not normally be forced to choose one permanent branch over
another.

Instead, the player should be able to explore different directions as they
progress.

## Thinkery Presentation

The complete research tree does not need to be visible at once.

The interface should prioritize:

- clarity
- discovery
- immediate next steps
- understandable requirements

The Thinkery should feel like a place of discovery rather than a giant
technical skill tree.

## Odd Stone

The Odd Stone is an important thematic element of the Thinkery.

The current concept is:

Odd Stone
    ↓
More advanced Thinkery
    ↓
More refined / mysterious object
    ↓
Crystal Ball / Orrery / similar final form

The exact progression should remain a design decision.

---

# 13. Phase 10 — Quests / Story

## Goal

Introduce the broader narrative and exploration layer.

The Hub / Camp should provide a central place for:

- quests
- storyline
- NPC interactions
- progression
- offerings or related systems where appropriate

## Quest Structure

Quest chains may split into multiple directions.

However:

The player should not normally be forced to choose one branch and lose
access to another.

A split should generally mean:

            Quest A
           /
Start ----<
           \
            Quest B

rather than:

Start
  ↓
Choose A OR B

The player should be able to explore both directions where the design allows.

---

# 14. Phase 11 — Collection / Museum

## Goal

Introduce the long-term collection and completion systems.

Potential systems include:

- Museum
- Trophy Hall
- Collection Log
- monster records
- item records
- achievement-like grinds

## Collection-Based Rewards

Collection milestones may provide meaningful rewards.

For example:

Kill 100 Wolves
        ↓
Museum milestone
        ↓
Permanent reward

The exact rewards remain a game-design decision.

Collection systems should complement progression rather than completely
replace normal progression.

---

# 15. Phase 12 — Expansion & Polish

## Goal

Only after the core systems are functioning should Bonk expand into deeper
systems and polish.

Potential additions include:

- farming
- food systems
- kitchen
- bait
- advanced monster mechanics
- deeper city systems
- advanced research
- more buildings
- more resources
- additional combat mechanics
- PvP
- cosmetics
- advanced idle/offline systems
- balancing
- audiovisual polish

These systems should be introduced based on actual gameplay needs.

---

# 16. Farming Is Not Required Immediately

Farming is intentionally not part of the initial city loop.

The current city foundation can function without it.

Farming may later be introduced if:

- the city feels too flat
- food needs more depth
- the bait system benefits from it
- mud/resource loops need another meaningful sink
- the player needs more active city interaction

Do not add farming merely because it exists on the long-term feature list.

---

# 17. Resource Sinks

Bonk should avoid creating resources that eventually become completely
meaningless.

Early resources such as:

- mud
- clay
- stone

should have meaningful long-term sinks where appropriate.

Potential sinks may include:

- infrastructure
- upgrades
- refinement
- crafting
- cosmetics
- offerings
- fuel
- other city systems

However, these systems should be added when their need becomes apparent.

Do not create artificial resource sinks solely to consume numbers.

---

# 18. Prototype vs Final Systems

Not every early implementation needs to be production-complete.

During prototyping, it is acceptable to use:

- placeholder art
- simplified UI
- simplified formulas
- temporary values
- temporary data

However:

Do not create prototype architecture that makes the final architecture
unnecessarily difficult to build.

When a prototype proves a mechanic is worth keeping, it should be cleaned up
before the system becomes deeply interconnected with the rest of the game.

---

# 19. Phase Completion Rule

A phase is not complete merely because the code exists.

A phase is complete when:

1. The intended behaviour works.
2. The relevant state is represented correctly.
3. The UI communicates the system clearly enough.
4. The system does not introduce obvious architectural debt.
5. The feature can be tested.
6. The project remains functional.
7. The documentation is still accurate.

Only then should development move to the next major phase.

---

# 20. Claude's Role During the Roadmap

Claude must always be aware of the current phase.

Before suggesting implementation, Claude should determine:

What phase are we currently in?
        ↓
What is the current milestone?
        ↓
What is the smallest next step?
        ↓
What existing architecture should be used?

Claude should not jump to future phases unless the developer explicitly asks
about them.

For example:

If the current phase is Mud / City Core, Claude should not suddenly begin
implementing:

- combat
- inventory
- crafting
- research
- PvP

unless specifically requested.

---

# 21. Current Development Rule

At any given time, there should be one clearly defined active milestone.

Claude should be able to answer:

> "What are we building right now?"

with a specific and concrete answer.

If there is no clear answer, stop and establish the next milestone before
writing significant code.

---

# 22. No Premature Expansion

When a system is being built, do not automatically add every feature that
could eventually interact with it.

Example:

When building Mud production, do not automatically implement:

- Clay
- Stone
- Metal
- Workers
- Farming
- Offline progression
- Research
- Crafting
- Fuel
- Offerings

unless the current milestone actually requires them.

Build the smallest useful version first.

---

# 23. Development Loop

For each milestone, follow:

1. Define the goal.
2. Inspect the existing project.
3. Identify required architecture.
4. Implement the smallest version.
5. Run and test.
6. Fix problems.
7. Refactor if necessary.
8. Confirm completion.
9. Update documentation.
10. Move to the next milestone.

Do not skip directly from step 1 to building the entire feature.

---

# 24. Current Status

## Active Phase

**Phase 1 — Mud / City Core**

The current priority is to establish the first functioning city/resource
loop before combat is introduced.

The immediate goal is not to build the entire city.

The immediate goal is:

Mud production
    ↓
Mud accumulation
    ↓
Player interaction
    ↓
Mud spending
    ↓
Mudhole upgrade
    ↓
Improved production

Everything else should be considered secondary until this loop is working.

---

# 25. Final Rule

The roadmap is a guide, not a prison.

If development reveals that a different order is better, discuss the reason
and update this document.

However:

**Do not allow future features to pull the project away from the current
milestone without an explicit decision.**

The goal is steady, understandable progress.

One system.

One milestone.

One working loop at a time.
