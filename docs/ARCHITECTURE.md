# Bonk — Architecture

## Purpose

This document defines the technical architecture and engineering principles
for Bonk.

The purpose is to keep the project:

- maintainable
- understandable
- scalable
- testable
- easy to debug
- easy for a human developer to understand

The architecture should support the game as it grows without introducing
unnecessary complexity.

---

# 0. Phase 1 — Pragmatic Approach

This document describes the target architecture for Bonk.

The full architecture (Models, Services, Definitions, orchestration layers)
is the right long-term direction but should not be introduced prematurely.

During Phase 1, the following pragmatic simplifications are intentional and
acceptable:

- Global state lives in Autoloads (EventBus, Inventory, SaveManager)
- ResourceBuilding and Mine are Node-based scripts rather than separate Model + Service classes
- There is no orchestration layer yet
- The folder structure is simpler than the target structure

**This is not technical debt** — it is deliberate scope management.

These simplifications are appropriate when:

- only one or two systems exist
- the full separation would require building infrastructure before there is
  anything to put in it
- the simpler approach follows the same fundamental principles (EventBus for
  communication, data-driven content, single source of truth)

As new systems are introduced, the architecture should evolve toward the
full pattern described in this document.

The decision to simplify or migrate should be made deliberately, not
reactively.

---

# 1. Technology

## A001 — Engine

Bonk is built using:

- Godot 4.x
- GDScript

Use modern Godot 4 APIs and patterns.

Do not use deprecated Godot APIs unless there is a specific reason.

---

## A002 — Static Typing

GDScript should use static typing wherever practical.

Prefer:

var damage: int = 10

over:

var damage = 10

Prefer typed parameters and return values:

func calculate_damage(
    attacker: CharacterModel,
    defender: CharacterModel
) -> int:

This improves readability, editor support, and error detection.

Do not add typing purely for the sake of verbosity when it makes code
significantly harder to understand.

---

# 2. Core Architectural Principle

## A003 — Separate Data, Logic, Presentation, and Orchestration

Bonk should distinguish between:

### Data

What something IS.

Examples:

- CharacterModel
- ItemDefinition
- MonsterDefinition
- ResourceDefinition
- BuildingDefinition

### Logic

What something DOES.

Examples:

- CombatService
- InventoryService
- CityService
- CraftingService
- ResearchService

### Presentation

What the player SEES and interacts with.

Examples:

- HUD
- Inventory UI
- Combat UI
- Building UI
- Research UI

### Orchestration

What coordinates larger game flows.

Examples:

- GameFlowService
- application-level state management

Do not put all four responsibilities into one script.

---

# 3. Godot Scenes and Nodes

## A004 — Scenes Represent Game Objects and Presentation

Godot scenes should be used for reusable game objects and UI structures.

Examples:

- Game
- Player
- Monster
- Building
- Combat UI
- Inventory UI
- Research UI

Godot's scene system should be used naturally rather than creating a custom
framework that duplicates Godot's scene system.

---

## A005 — Nodes Should Have a Clear Responsibility

A Node should have a clear reason to exist.

Avoid creating nodes simply because a system "might need one."

Prefer simple composition over deep inheritance hierarchies.

---

## A006 — Avoid God Objects

Do not create a single enormous script responsible for:

- combat
- inventory
- city
- research
- saving
- UI
- progression
- quests

If a script starts accumulating unrelated responsibilities, stop and
consider separating the responsibilities.

---

# 4. Models

## A007 — Models Represent Runtime Game State

Models contain mutable gameplay state.

Examples:

- CharacterModel
- InventoryModel
- CityModel
- ProgressionModel
- ResearchModel
- CollectionModel

A model should primarily represent state.

It should not contain UI logic.

It should not directly manipulate scene nodes.

---

## A008 — Models Should Not Depend on UI

Models must not know about:

- Control nodes
- buttons
- labels
- panels
- animations
- UI scenes

Bad:

character_model.update_health_bar()

Good:

character_model.hp = new_hp

The UI observes the relevant state and updates itself.

---

## A009 — Models Should Not Own Global Systems

A model should not directly control unrelated systems.

For example:

CharacterModel should not:

- save the game
- create UI
- upgrade buildings
- perform research
- start quests

Models represent state.

Services operate on that state.

---

# 5. Definitions and Resources

## A010 — Static Game Data Uses Resources

Static game definitions should generally use Godot Resource types.

Examples:

- ItemDefinition
- MonsterDefinition
- BuildingDefinition
- RecipeDefinition
- ResearchDefinition
- LootTableDefinition
- ResourceDefinition

This allows game data to be edited independently from runtime state.

---

## A011 — Definitions vs Runtime State

Keep definitions separate from runtime state.

Example:

### MonsterDefinition

Contains:

- name
- base stats
- attack type
- possible drops
- visuals
- metadata

### MonsterModel

Contains:

- current HP
- current combat state
- temporary effects
- runtime information

Do not modify the definition when modifying an individual runtime instance.

---

## A012 — Avoid Hardcoded Game Content

Do not hardcode large amounts of game content directly into gameplay
scripts.

Bad:

if monster_name == "Wolf":
    drop_item("wolf_fang")

Prefer data-driven definitions and loot tables.

Gameplay code should describe how the system works.

Data should describe what exists in the game.

---

# 6. Services

## A013 — Services Contain Domain Logic

Services are responsible for gameplay operations.

Examples:

- CombatService
- InventoryService
- CityService
- CraftingService
- ResearchService
- QuestService
- CollectionService
- SaveService

A service should answer:

> How do we perform this operation?

rather than:

> What does this object look like?

---

## A014 — Services Should Be Focused

A service should have one coherent domain.

For example:

CombatService may handle:

- hit calculations
- damage calculations
- combat simulation
- combat results

It should not also:

- update UI
- save the game
- construct inventory panels
- upgrade buildings

---

## A015 — Do Not Create Services Prematurely

Not every function requires its own service.

Create a service when:

- a domain contains meaningful logic
- multiple systems need that logic
- the logic would otherwise make another class too large
- the domain needs clear boundaries

Avoid creating meaningless services such as:

- NameService
- NumberService
- HelperService
- StringService
- ButtonService

without a real architectural reason.

---

# 7. Game Flow

## A016 — One Orchestrator for Major Game Flow

Bonk should have a clear orchestration layer responsible for coordinating
major gameplay flows.

The exact implementation may evolve, but conceptually this layer handles
flows such as:

Player requests combat
    ↓
Combat is prepared
    ↓
Combat is simulated
    ↓
Result is produced
    ↓
Rewards are granted
    ↓
Progression is updated
    ↓
UI is notified

The orchestrator should coordinate systems rather than implement all of
their internal logic.

---

## A017 — Do Not Put All Logic Into the Orchestrator

The orchestrator exists to coordinate.

It should not become another God Object.

For example:

GameFlowService may call:

combat_service.simulate_battle()

and then:

reward_service.grant_rewards()

It should not implement the entire combat or reward system itself.

---

# 8. Signals and Events

## A018 — Prefer Signals for Decoupled Communication

Godot signals should be used when one system needs to communicate that
something happened without tightly coupling the receiver to the sender.

Examples:

- combat_finished
- inventory_changed
- character_stats_changed
- resource_changed
- research_unlocked
- quest_completed
- building_upgraded

---

## A019 — Do Not Use Signals for Everything

Signals are not automatically better than direct method calls.

Use a direct call when:

- one object explicitly owns another
- the dependency is intentional
- the operation is synchronous and local

Use a signal when:

- multiple systems may react
- the sender should not know who is listening
- the event represents something that happened

---

## A020 — Avoid Signal Spaghetti

Do not create dozens of global signals simply because they are convenient.

Signals should represent meaningful events.

If following a signal chain becomes difficult to understand, reconsider the
architecture.

---

# 9. Event Bus

## A021 — Global Events Should Be Limited

A global EventBus may be used for genuinely global events.

Examples:

- combat_started
- combat_finished
- quest_completed
- research_unlocked

However, the EventBus must not become a dumping ground for all communication.

Prefer direct references and local signals when appropriate.

---

# 10. UI Architecture

## A022 — UI Is Presentation

UI scripts should primarily:

- display state
- receive user input
- call appropriate game operations
- react to signals/events

UI should not contain core game rules.

---

## A023 — UI Must Not Be the Source of Truth

Bad:

$GoldLabel.text = "100"

followed by game logic assuming the label contains the player's gold.

Good:

PlayerModel.gold = 100
    ↓
gold_changed signal
    ↓
GoldLabel updates

The model/state is the source of truth.

---

## A024 — UI Should Not Directly Modify Complex Game State

A UI button should not manually perform an entire gameplay operation.

Bad:

func _on_upgrade_pressed():
    player.gold -= 100
    building.level += 1
    building.production *= 1.2
    save_game()
    update_everything()

Prefer:

building_service.upgrade_building(building_id)

The service owns the rules.

---

# 11. Inventory and Items

## A025 — Items Are Data-Driven

Items should be represented by reusable definitions.

An item definition may contain:

- ID
- display name
- description
- item type
- icon
- stackability
- equipment information
- crafting information
- other static properties

Runtime inventory state should reference these definitions.

---

## A026 — Inventory Owns Inventory State

Inventory-related state should live in the inventory domain.

Do not duplicate inventory state in:

- UI
- player scene
- individual item UI
- unrelated services

There should be one authoritative inventory state.

---

# 12. Combat Architecture

## A027 — Combat Must Be Separable From Combat Presentation

Combat simulation must not depend on:

- animations
- sprites
- combat UI
- timers used purely for presentation

The combat system should be able to calculate a result independently.

This is particularly important because Bonk contains idle/simulated combat.

---

## A028 — Combat Produces Results

Conceptually:

Combat input
    ↓
Combat simulation
    ↓
Battle result

The result may contain information such as:

- winner
- turns
- damage dealt
- remaining HP
- combat events/log
- relevant reward information

The visual combat presentation can then interpret the result.

---

## A029 — Combat Rules Live in Combat Logic

Do not put combat formulas into:

- UI scripts
- weapon scenes
- monster scenes
- animation scripts

Combat calculations belong to the combat domain.

---

# 13. Loot Architecture

## A030 — Loot Is Data-Driven

Loot should use definitions/tables rather than hardcoded conditional logic.

Conceptually:

Monster
    ↓
Loot Table
    ↓
Random Roll
    ↓
Loot Result

This should support:

- common drops
- uncommon drops
- rare drops
- extremely rare drops
- multiple rolls
- future modifiers

---

## A031 — Loot Probability Must Be Centralized

Loot probability calculations should have one clear owner.

Do not implement separate loot calculations inside:

- monsters
- combat
- inventory
- UI
- quests

This becomes particularly important if Luck eventually modifies loot.

---

# 14. City Architecture

## A032 — City State Is Separate From City Presentation

The city model should contain the actual state of the city.

Examples:

- buildings
- levels
- resources
- workers
- production state
- unlocked infrastructure

The city scene displays that state.

---

## A033 — Buildings Should Be Data-Driven Where Practical

Building definitions should contain static information such as:

- name
- icon
- costs
- level requirements
- production properties
- upgrade information
- visual information

Runtime building state should contain things such as:

- current level
- assigned workers
- current production state
- unlocked status

---

# 15. Research Architecture

## A034 — Research Should Be Data-Driven

Research nodes should be represented as data definitions rather than
hardcoded branches inside UI scripts.

A research definition may contain:

- ID
- display name
- description
- prerequisites
- requirements
- rewards
- department
- discovery information

---

## A035 — Research Logic Is Separate From Research UI

The Thinkery UI displays research.

The research system determines:

- whether something is available
- whether requirements are met
- what gets unlocked
- what rewards are granted

The UI should not implement these rules.

---

# 16. Quests

## A036 — Quest Data Should Be Separate From Quest Logic

Quest definitions should contain static information such as:

- title
- description
- objectives
- requirements
- rewards
- dialogue references

Quest runtime state should contain:

- current progress
- completed objectives
- completion state

Quest logic handles progression.

The UI displays it.

---

# 17. Saving

## A037 — Saving Is a Dedicated Concern

Saving should be handled by a dedicated save/load system.

Gameplay systems should not each write their own save files.

Avoid:

CombatService → save
InventoryService → save
CityService → save
ResearchService → save

Instead:

Game state
    ↓
Save system
    ↓
Save file

---

## A038 — Runtime State Must Be Serializable

Any persistent progression should have a clear representation that can be
saved and restored.

Examples:

- character progression
- inventory
- city
- research
- quests
- collection
- settings that are intended to persist

---

# 18. Time and Idle Progression

## A039 — Time-Based Systems Must Be Deterministic Where Practical

Idle progression should not rely purely on thousands of real-time callbacks.

Prefer calculating progression based on elapsed time when appropriate.

Conceptually:

last_update_time
    ↓
current_time
    ↓
elapsed_time
    ↓
calculate progression

This makes offline progression much easier to reason about.

---

## A040 — Offline Progression Is a Domain Rule

Offline progression should be handled by gameplay systems rather than by the
UI or scene lifecycle.

The game should determine:

- how much time is eligible
- what activities progressed
- what rewards were generated
- what limits apply

---

# 19. Dependencies

## A041 — Dependencies Should Point Toward Domain Logic

Avoid circular dependencies.

Bad:

UI → CombatService
CombatService → UI

Prefer:

UI
 ↓
Domain logic
 ↓
Models

and use signals/events for outward notification.

---

## A042 — Avoid Circular System Dependencies

Avoid:

InventoryService → CraftingService
CraftingService → InventoryService

when possible.

If two systems need to coordinate, consider whether an orchestration layer
should own the interaction.

---

# 20. Autoloads / Singletons

## A043 — Use Autoloads Sparingly

Autoloads may be used for genuinely global infrastructure.

Potential examples:

- application-level EventBus
- configuration
- save infrastructure

Do not turn every major system into an Autoload.

Avoid a project where everything can access everything.

---

# 21. File and Folder Structure

## Current structure (Phase 1)

The current project structure is intentionally simple:

res://
├── autoloads/     (EventBus, Inventory, SceneManager, SaveManager)
├── resources/     (Resource subclasses: ItemData, DropTable, etc.)
├── data/          (.tres item files, .json drop table data)
├── scenes/
│   ├── buildings/ (ResourceBuilding, Mine)
│   ├── debug/     (DebugPanel)
│   ├── main.tscn
│   └── town.tscn
├── assets/        (textures, audio)
└── docs/          (documentation)

## Target structure (Phase 3+)

As the game grows, the structure should evolve toward:

res://
├── autoloads/     (EventBus, SaveManager, SceneManager)
├── data/          (.tres definitions, .json tables)
├── scenes/
│   ├── city/
│   ├── combat/
│   ├── ui/
│   └── shared/
├── scripts/
│   ├── models/    (runtime state: InventoryModel, CityModel, etc.)
│   ├── services/  (domain logic: CombatService, CraftingService, etc.)
│   └── resources/ (Resource subclasses)
├── assets/
└── docs/

Do not migrate to the target structure prematurely.

Restructure when the current structure genuinely makes a feature harder to
build or understand — not before.

Do not create folders that contain only one arbitrary file merely to make the
architecture look sophisticated.

---

# 22. Naming

## A044 — Naming Must Be Consistent

Use clear, descriptive names.

Prefer:

- CombatService
- InventoryService
- ResearchService
- CharacterModel
- ItemDefinition

over vague names such as:

- Manager
- Helper
- Controller2
- SystemThing
- Utils

The name should communicate responsibility.

---

# 23. Managers

## A045 — Avoid Generic Managers

"Manager" is not an architectural pattern by itself.

Do not create classes such as:

- GameManager
- ItemManager
- BuildingManager
- CombatManager
- PlayerManager
- UIManager

unless their responsibilities are genuinely well-defined.

Prefer names based on responsibility:

- CombatService
- InventoryService
- SaveService
- ResearchService

A class should have a clear purpose beyond simply "managing" something.

---

# 24. Utility Code

## A046 — Utility Functions Must Remain Small and Generic

Utility code should only contain genuinely reusable functionality.

Do not use a `Utils` class as a dumping ground.

If a function belongs conceptually to a domain, keep it in that domain.

---

# 25. Testing

## A047 — Pure Game Logic Should Be Testable

Important calculations should be designed so they can be tested without
running the entire game.

Examples:

- damage calculations
- hit chance
- XP calculations
- loot rolls
- crafting requirements
- research requirements
- resource calculations

---

## A048 — Test Rules, Not Implementation Details

Tests should primarily verify behaviour.

For example:

Given attacker X and defender Y,
the resulting damage should be within the expected range.

Do not build tests around private implementation details that may change.

---

# 26. Debugging

## A049 — Debugging Must Identify the Root Cause

Do not patch symptoms repeatedly.

When a bug occurs:

1. Reproduce it.
2. Identify where the incorrect state originates.
3. Identify which system owns that state.
4. Fix the underlying issue.
5. Test related behaviour.

Avoid adding temporary conditionals that hide the actual problem.

---

# 27. Refactoring

## A050 — Refactor When Responsibility Becomes Unclear

Refactoring is encouraged when:

- a class has multiple unrelated responsibilities
- dependencies become circular
- code is duplicated
- logic becomes difficult to test
- naming no longer reflects responsibility

Do not refactor simply because a different architecture looks more elegant.

Working code with clear responsibilities is preferable to unnecessary
architectural churn.

---

# 28. Feature Development

## A051 — Every Feature Should Have a Clear Domain

When adding a feature, first identify:

1. What data does it need?
2. What rules does it introduce?
3. Which system owns those rules?
4. What UI displays it?
5. What existing systems does it interact with?
6. What persistent state does it create?
7. How will it be tested?

Only then should implementation begin.

---

## A052 — Implement Features Incrementally

Do not implement an entire feature in one enormous change.

Prefer:

1. Data model
2. Core logic
3. Integration
4. UI
5. Feedback/polish
6. Testing

Each step should leave the project in a working state where practical.

---

# 29. Claude Development Rules

## A053 — Claude Is the Technical Guide

Claude's default role is:

**Guide, explain, review, and teach.**

Claude should not assume permission to modify files or directly implement
features.

---

## A054 — Claude Must Not Generate Entire Systems Without Permission

When the developer asks:

> "How should I implement this?"

Claude should explain the architecture and provide the next concrete steps.

Do not immediately produce hundreds of lines of code.

---

## A055 — Claude May Provide Copy-Paste Code

The developer wants to learn by manually implementing the code.

Claude may therefore provide:

- short code snippets
- complete small scripts when appropriate
- exact lines to add
- terminal commands
- configuration snippets

The developer will normally copy these manually.

---

## A056 — Prefer Small Implementation Steps

Claude should generally provide one logical implementation step at a time.

Example:

Step 1:
Create CharacterModel.

Step 2:
Add the stats.

Step 3:
Add the stats_changed signal.

Step 4:
Test that changing a stat emits the signal.

Do not jump ahead into five systems that have not yet been built.

---

## A057 — Claude Must Explain Why

When suggesting an architectural decision, Claude should briefly explain:

- what it solves
- why it belongs there
- what alternatives were considered when relevant
- what trade-offs exist

This is a learning project as well as a production project.

---

## A058 — Claude Must Respect Existing Decisions

Before proposing a new architecture, Claude should check:

- CLAUDE.md
- GAME_DESIGN.md
- DECISIONS.md
- OPEN_QUESTIONS.md
- ARCHITECTURE.md

A new suggestion must not silently contradict an existing decision.

---

## A059 — Do Not Reopen Settled Decisions Without a Reason

If a confirmed decision creates a serious technical or design problem,
Claude should explain the problem before recommending a change.

Do not casually redesign the game every time a new idea appears.

---

# 30. What Claude Should Do When Asked to Build Something

Before implementation:

1. Identify the relevant existing architecture.
2. Identify the smallest required change.
3. Explain the plan.
4. Identify files that need modification.
5. Ask for permission before making substantial changes.

During implementation:

1. Work incrementally.
2. Provide exact code where useful.
3. Explain important concepts.
4. Avoid unrelated refactors.

After implementation:

1. Explain how to test it.
2. Identify expected behaviour.
3. Identify possible failure cases.
4. Update documentation if a design/architecture decision changed.

---

# 31. What Claude Must NOT Do

Claude must not:

- randomly restructure the project
- create unnecessary managers
- create unnecessary abstractions
- duplicate game state
- put game logic in UI scripts
- hardcode large amounts of game data
- silently change confirmed design
- create files without permission
- modify files without permission
- implement unrelated improvements
- rewrite working systems without a clear reason
- solve every problem with another singleton
- solve every problem with another service
- solve every problem with another signal
- over-engineer simple features

---

# 32. Architecture Priority

When choosing between architectural solutions, prefer this order:

1. Correctness
2. Understandability
3. Maintainability
4. Testability
5. Scalability
6. Performance
7. Cleverness

Do not sacrifice clarity for theoretical future flexibility.

---

# 33. AAA Principle

"AAA architecture" does NOT mean:

- maximum abstraction
- maximum number of systems
- maximum number of files
- enterprise patterns everywhere
- complex dependency injection
- unnecessary interfaces

For Bonk, AAA-quality architecture means:

- clear responsibilities
- predictable dependencies
- maintainable code
- data-driven content where appropriate
- testable game logic
- minimal duplication
- robust state management
- clear boundaries
- consistent naming
- deliberate design decisions

The architecture should be professional without becoming unnecessarily
complicated.

---

# 34. Final Rule

When uncertain:

**Do not guess.**

Determine whether the uncertainty is:

- a design question
- an architecture question
- an implementation question

Then handle it appropriately.

If it is a design question:

→ consult `DECISIONS.md` and `OPEN_QUESTIONS.md`.

If it is an architecture question:

→ consult `ARCHITECTURE.md`.

If it is an implementation question:

→ choose the simplest solution that follows the established architecture.

If the answer cannot be determined from the existing documentation:

→ explain the uncertainty and propose options rather than silently inventing
a new rule.
