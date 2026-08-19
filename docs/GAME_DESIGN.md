# Bonk — Game Design Document

## Document Status

This document describes the current game design of Bonk.

It is a living document.

Not every system is fully designed yet. Unresolved ideas must not be treated
as confirmed design.

Use the following labels when necessary:

- **Confirmed** — explicitly decided and accepted.
- **Proposed** — a possible design direction that has not been finalized.
- **Open Question** — intentionally unresolved.

Detailed individual decisions should be recorded in:

`docs/DECISIONS.md`

Unresolved questions should be recorded in:

`docs/OPEN_QUESTIONS.md`

---

# 1. Game Overview

## Working Title

**Bonk**

## Genre

Bonk is an:

**Idle PvM + City Builder + Collection/Progression game**

The game combines:

- idle PvM combat
- character progression
- resource gathering
- city development
- crafting and refining
- exploration
- quests and storyline
- research
- collection
- long-term grinds

The game should feel approachable and humorous while still having enough
depth for long-term progression.

---

# 2. Core Fantasy

The player starts with a primitive settlement and a very limited set of
resources.

The settlement gradually develops from primitive structures and basic
materials into a more advanced settlement capable of processing resources,
crafting equipment, researching new technologies, and supporting increasingly
difficult expeditions.

The player simultaneously develops:

- their character
- their combat capabilities
- their settlement
- their knowledge
- their collection

The world should gradually reveal more complexity rather than presenting the
player with a large number of systems immediately.

---

# 3. Core Gameplay Loop

The broad gameplay loop is:

1. Develop the settlement.
2. Gather resources.
3. Refine and craft materials.
4. Prepare the character.
5. Go on expeditions.
6. Fight monsters.
7. Obtain loot.
8. Complete quests and discover information.
9. Add discoveries and trophies to the collection.
10. Use resources and knowledge to improve the settlement and character.
11. Unlock new areas, monsters, resources, equipment, and systems.
12. Repeat at a higher level of progression.

The player should constantly have a reason to improve either:

- the character
- the settlement
- their knowledge
- their collection

---

# 4. Idle Philosophy

Idle progression is a core part of Bonk.

The player should be able to configure their character for a type of
activity and allow progression to continue without requiring constant manual
interaction.

However, the game should still provide meaningful active decisions.

Examples include:

- choosing what to farm
- choosing food
- choosing bait
- choosing equipment
- choosing where to fight
- choosing what to research
- choosing what to craft
- deciding how to develop the settlement

The goal is not to make the game completely passive.

The goal is to make active decisions determine what the player idles toward.

---

# 5. The Settlement

The settlement is one of the game's primary progression systems.

The player starts with a primitive settlement and gradually develops it.

The city should feel like it evolves physically and visually over time.

The settlement currently revolves around several major functions:

- resource extraction
- research
- quests/storyline
- refining
- crafting
- storage/inventory management
- collection/trophies
- infrastructure

Additional city systems may be added if the city feels too flat during
development.

---

# 6. Primary Building Categories

## 6.1 Resource Extraction

The settlement produces the main construction resources.

The current primary progression is based around:

**Mud → Clay → Stone → Metal**

The exact implementation and resource distribution are still subject to
balance and further design.

---

## 6.2 Mudhole / Quarry

The first major resource-producing structure is intended to begin as something
very primitive.

The initial concept is:

**Mudhole → Clay Pit → Stone Quarry → deeper quarry / advanced extraction**

The progression should feel intuitive:

The settlement initially digs simple mud.

As infrastructure and technology improve, the player gains access to deeper
and more valuable material.

---

# 7. Resource Philosophy

The primary settlement-building resource should feel grounded in the world.

The game should avoid abstract resources such as:

- coins as the primary construction resource
- arbitrary "city points"
- unexplained generic currencies

The settlement is a primitive community, so its resources should feel like
physical things that the community actually gathers and uses.

The main construction/resource progression is currently envisioned as:

### Mud

The earliest and most primitive material.

Mud is intentionally somewhat humorous and primitive.

### Clay

A more useful and refined material.

### Stone

A durable construction resource.

### Metal

A more advanced resource obtained through deeper extraction and/or later
processing.

---

# 8. Resource Drop Philosophy

The quarry should feel somewhat like a **loot table** rather than a simple
linear production machine.

The quarry continuously rolls for resources.

Higher quarry levels should improve the probability and/or quality of
valuable drops.

This creates a progression where upgrading the quarry does not mean that
early resources suddenly become inaccessible.

The player should not experience:

> "I upgraded my quarry, so now I can barely obtain the resource I still need."

Early resources should remain obtainable.

---

# 9. Early Resource Problem

Mud and clay are highly useful early but may become less relevant later.

This is an important design problem.

The game should therefore have natural sinks for older resources.

Potential sinks include:

- infrastructure upgrades
- cosmetic infrastructure
- permanent city improvements
- fuel
- production systems
- other city investments

The player should not accumulate enormous amounts of completely useless
resources with no meaningful outlet.

---

# 10. Resource Conversion

A possible late-game solution is a research unlock that allows automated
replacement of an older resource with a newer one.

For example:

**Automatic Mud → Clay conversion**

This should only be implemented if it provides a clear improvement to the
player experience.

The principle is:

Old resources should remain relevant without forcing the player to manually
farm obsolete content forever.

---

# 11. Infrastructure Resource Sink

Mud, clay, stone, and potentially other excess materials can be consumed by
infrastructure.

This is especially useful for resources that become less important as the
player progresses.

Infrastructure consumption may provide:

- movement/speed improvements
- production improvements
- convenience improvements
- permanent settlement bonuses
- cosmetic upgrades

Not every infrastructure sink needs to provide a gameplay advantage.

Purely cosmetic resource sinks are acceptable when they provide meaningful
long-term goals.

---

# 12. Food and Farming

A farming system is a **Proposed** feature.

The settlement may eventually include farming.

Possible purposes include:

- producing food
- supporting a kitchen
- producing ingredients
- creating bait
- adding another active settlement activity
- providing another sink for settlement resources

Farming is not currently required for the initial version of the city.

It should be added only if the city feels too flat without it.

---

# 13. Food

Food is intended to be part of the player's preparation for activities.

A possible player configuration includes:

- Food slot
- Bait slot

Food may influence the player's ability to sustain or optimize an idle
activity.

The exact food system is not yet finalized.

---

# 14. Bait

Bait is intended to be a meaningful part of targeting monsters.

The player may use bait to attract specific monsters or influence what they
encounter during combat.

This gives the player a way to deliberately farm specific enemies or drops.

The exact combat/encounter implementation is not yet finalized.

---

# 15. Thinkery

The **Thinkery** is the research and knowledge center of the settlement.

It should not simply be a generic:

> "Spend research points to unlock technology."

Instead, research should feel like an actual chain of discoveries.

The player should obtain or discover logical items and knowledge that allow
new research to become possible.

---

# 16. Research Structure

Research is organized into multiple interconnected areas.

At minimum, the research system should contain separate areas for:

- Combat
- City / Infrastructure / Construction

Additional research areas may be added later.

The research areas are not necessarily completely independent.

Most progression should allow the player to explore multiple directions.

However, some research nodes may require knowledge from another department.

Example:

A city technology might require a combat-related discovery.

A combat technology might require something developed by the city.

The player should never be forced to permanently choose one research branch
over another.

Branches may split, but the player can eventually explore both directions.

---

# 17. Research Presentation

The player should NOT necessarily see the entire research tree at once.

The Thinkery should be:

- easy to understand
- intuitive
- visually readable
- discoverable
- progressively revealed

The system should avoid presenting a giant technical skill tree immediately.

Research should feel like discovering knowledge.

---

# 18. Odd Stone

A special early-game item is intended to be discovered relatively early.

Working name:

**Odd Stone**

The stone becomes increasingly sophisticated as the Thinkery develops.

Possible progression:

**Odd Stone → increasingly processed artifact → crystal ball / orrery**

The artifact should visually communicate the increasing sophistication of the
Thinkery.

It can become an important visual centerpiece of the building.

The exact progression is still open.

---

# 19. Research as Quest/Discovery Chains

Research should use logical items and discoveries rather than an abstract
research-point economy.

Research chains may split into multiple directions.

The player can investigate both directions.

There should be no permanent choice where choosing one branch prevents the
player from eventually exploring another.

Some branches may depend on discoveries made elsewhere.

---

# 20. Hub / Camp

The settlement should contain a central hub/camp built around a central fire.

This is an important social and progression location.

Potential functions include:

- quests
- storyline
- offerings
- settlement progression
- character/community interaction

The hub should provide a clear place where the player returns between
expeditions.

---

# 21. Offerings

The central camp/fire can act as a sink for excess expedition loot.

For example:

- bones
- monster materials
- miscellaneous loot
- large quantities of otherwise unnecessary items

The player can make offerings.

Offerings can contribute toward long-term milestones.

For example:

**100,000 bones offered**

could unlock a permanent bonus or achievement.

The exact reward structure is not finalized.

---

# 22. Collection and Museum

A museum/trophy hall is an important part of the game's long-term progression.

The player should be able to display and track discoveries such as:

- monsters
- equipment
- rare items
- trophies
- collection milestones
- unusual discoveries

The museum should reinforce the game's collection-focused identity.

---

# 23. Museum Grinds

Museum/collection milestones may provide permanent progression.

For example:

> Kill 100 wolves → +1 Strength

This is a **Proposed** progression mechanism.

It provides a reason to pursue long-term collection and grind goals.

The system should be designed carefully so it does not create unnecessary
conflict with normal skill progression.

---

# 24. Crafting and Refining

The settlement must contain a dedicated place for refining and crafting.

A major building in this category is likely a:

**Forge / Refinery / Workshop**

The exact building structure is not finalized.

The system needs to support at least:

### Refining

Examples:

- metal → metal bars
- bones → carved bones
- strings → rope

### Crafting

Examples:

- weapons
- armour/gear
- tools
- consumables
- other useful items

The distinction between refining and crafting should remain intuitive.

---

# 25. Crafting Philosophy

Crafting should be based on physical and logical transformations.

Examples:

- ore becomes bars
- fibers/strings become rope
- bones become carved components
- refined materials become equipment

Recipes should feel understandable from the world rather than arbitrary.

---

# 26. Storage

Storage is currently an **Open Question**.

The game may either:

1. Have traditional finite storage that must be upgraded, or
2. Use effectively unlimited storage.

Unlimited storage is attractive because the game contains many resources and
collection items.

Finite storage could create another meaningful city progression system.

This decision should be resolved before implementing a large inventory/storage
system.

---

# 27. Combat

Combat is a major part of Bonk.

The current direction is idle PvM combat with active preparation.

The player prepares:

- equipment
- food
- bait
- target/activity

and then allows combat to occur.

Combat should be understandable at a high level while still containing enough
depth for optimization.

---

# 28. Attack Types

The current preferred attack types are:

- Melee
- Ranged
- Magic

These are intended to provide different ways of fighting and create meaningful
reasons to develop different combat capabilities.

The names and exact implementation are still open to refinement.

---

# 29. Attack Types and Elements

Attack type and element are separate concepts.

An attack does not have to be tied to a specific element.

For example:

- a melee weapon can deal poison damage
- a ranged weapon can deal fire damage
- a magic attack can potentially deal physical or other damage

Elements should therefore be treated as an independent layer of combat
mechanics if they are implemented.

Possible elements include:

- Fire
- Water
- Ice
- Poison
- Flying
- Dragon
- etc.

The final elemental system is not yet finalized.

---

# 30. Monster Differentiation

Monsters should have recognizable differences without requiring the player
to understand a large visible spreadsheet of weaknesses.

Possible monster characteristics include:

- attack type
- elements
- combat stats
- special behavior
- unusual mechanics

The game may contain rare monsters with unusual mechanics.

Examples of experimental concepts include:

- a monster that can only be damaged using bare hands
- a monster that must be healed until it reaches a critical threshold
- other unusual mechanics

These special mechanics should NOT necessarily be explicitly revealed to
the player.

Discovery can come through:

- experimentation
- rumours
- research
- quests
- observation
- previous encounters

The player should feel like they discovered the mechanic.

---

# 31. Idle Combat and Special Monsters

Special mechanics create a potential conflict with idle combat.

The player should generally be able to configure a broadly effective setup for
idle progression.

Rare or unusual monsters should therefore be designed carefully so they do not
make ordinary idle setups frustrating or require constant manual supervision.

The exact solution is still an Open Question.

---

# 32. Character Stats

The preferred core stats are currently:

- Strength
- Defence
- Constitution
- Accuracy
- Speed
- Luck

These are the original preferred player stats and should remain the baseline
until explicitly changed.

---

# 33. Strength

Strength is intended to be a general offensive stat.

Strength should not be exclusive to melee.

It may act as a general damage multiplier or offensive scaling stat across:

- melee
- ranged
- magic

This allows the character to have one intuitive general offensive stat while
the attack types provide additional specialization.

The exact damage formulas are not yet finalized.

---

# 34. Defence

Defence is a general defensive stat.

The game should avoid creating separate player stats such as:

- melee defence
- ranged defence
- magic defence

unless there is a compelling reason to do so.

Defence should remain a simple and understandable core character stat.

Gear can still specialize against particular attack types without requiring
separate player stats.

---

# 35. Constitution

Constitution primarily contributes to:

- maximum HP
- survivability

The exact formula is not yet finalized.

---

# 36. Accuracy

Accuracy is intended to influence the likelihood of successfully hitting an
enemy.

Accuracy should remain focused on accuracy rather than being overloaded with
other unrelated mechanics.

---

# 37. Speed

Speed is intended to influence combat tempo.

Possible effects include:

- attack interval
- actions per unit of time
- other combat-speed mechanics

The exact implementation is not yet finalized.

---

# 38. Luck

Luck is currently an **Open Question**.

Luck is attractive because Bonk has a strong focus on:

- loot
- rare drops
- collection
- monster farming

However, there is concern that Luck may feel unintuitive if it simultaneously
affects unrelated systems such as:

- combat crits
- loot
- rare drops

A possible use is to move critical-hit mechanics to Luck while allowing Luck
to influence certain additional roll mechanics.

However, Luck should NOT make extremely rare items feel common.

Very rare drops should remain rare and meaningful.

If Luck is implemented, its effect on rare drops must be carefully balanced.

---

# 39. Combat Progression

The preferred direction is:

**The player trains what they use.**

Combat-related XP can be generated through combat actions.

For example:

- dealing damage with melee contributes to melee progression
- dealing damage with ranged contributes to ranged progression
- dealing damage with magic contributes to magic progression

The exact skill structure is still being finalized.

---

# 40. Combat XP

A current proposed rule is:

**Combat XP is awarded for dealing damage, not simply for winning.**

This is intended to make the progression feel logical.

If the player successfully hits and deals damage, they should receive
appropriate combat XP even if the overall battle is eventually lost.

This separates combat training from overall victory progression.

The exact XP formulas are not finalized.

---

# 41. Overall Level

The player can have an overall level separate from individual combat stats.

The purpose of the overall level is primarily to communicate:

> How far has this player progressed?

It should represent the player's broader progression through:

- combat
- city development
- progression systems
- collection
- other major activities

The overall level is especially useful for:

- hiscores
- player comparison
- communicating overall progression

It is NOT intended to become a complicated secondary progression system.

Some content may require an overall level, but level requirements are not the
primary purpose of the system.

---

# 42. Overall XP

A current proposed direction is that overall XP is primarily associated with
successful progression rather than raw combat activity.

For combat:

- damage dealt → combat XP
- successful victory → overall XP

This creates a distinction between:

**"How much did I train?"**

and

**"How far have I progressed?"**

The exact overall XP sources outside combat remain open.

---

# 43. Skills in the City

City activities may eventually provide their own progression.

Possible skills include:

- Mining
- Smithing
- Cooking
- other production skills

However, the value of a traditional skill-XP system in the city is currently
an Open Question.

The main concern is whether city skills add meaningful depth or simply create
more numbers.

The city should not have skills purely because other games have them.

---

# 44. Training Philosophy

If city skills are implemented, they should follow the same general philosophy
as combat:

**The player becomes better at what they actually do.**

However, there should be a clear gameplay purpose for each skill.

A skill should exist only if it provides meaningful progression, choices, or
specialization.

---

# 45. Stat Points vs XP

The relationship between:

- direct skill XP
- character stats
- stat points
- museum milestones

is not completely finalized.

A possible structure is:

- activity generates XP
- XP trains a relevant skill
- major milestones provide permanent stat increases

This could allow the museum to reward long-term accomplishments without
duplicating normal skill XP.

The exact progression model remains an Open Question.

---

# 46. Gear

Gear should provide meaningful specialization.

Equipment may have bonuses that make it particularly effective against certain
attack types.

For example, equipment could provide:

**+20 Magic Defence**

rather than displaying a percentage resistance.

This keeps gear readable while allowing specialized defensive equipment.

The exact equipment-stat system is not finalized.

---

# 47. Food and Bait Loadout

The player may have:

- Food slot
- Bait slot

These slots would allow the player to configure what they are farming while
idling.

This supports the idea that the player chooses an activity rather than simply
pressing a universal "idle" button.

The exact mechanics are still being designed.

---

# 48. Monsters and Loot

Monsters should provide meaningful reasons to fight them.

Different monsters may have:

- unique drops
- equipment
- materials
- collection entries
- rumours
- research discoveries
- special mechanics

Some monsters should be intentionally rare.

The collection system should make rare discoveries meaningful rather than
turning everything into a common resource.

---

# 49. Collection Philosophy

Collection is a major long-term motivation.

The player should be encouraged to:

- discover monsters
- obtain unusual drops
- collect equipment
- complete museum entries
- complete long-term grinds
- discover hidden mechanics

The game should reward completionists without making collection mandatory for
normal progression.

---

# 50. Progression Philosophy

Bonk should have several interconnected progression dimensions:

### Character

- stats
- combat capabilities
- equipment

### City

- buildings
- resource extraction
- infrastructure
- production

### Knowledge

- research
- discoveries
- rumours

### Collection

- monsters
- items
- trophies
- milestones

These progression systems should sometimes interact.

For example:

Combat research may unlock a city capability.

City infrastructure may unlock combat progression.

A monster discovery may unlock research.

A collection milestone may improve the character.

The connections should feel logical rather than arbitrary.

---

# 51. No Forced Build Choices

The player should generally be able to explore different systems without
permanently locking themselves out of other content.

Research branches may split.

Progression may specialize.

Equipment may specialize.

However, the player should not normally be forced into an irreversible
choice simply because they explored one direction first.

---

# 52. Discovery

Not all information should be explicitly displayed.

Bonk should contain some elements of discovery.

Players may learn information through:

- experimentation
- rumours
- research
- quests
- observation
- repeated encounters
- collection

This is particularly relevant to unusual monster mechanics and hidden
interactions.

The game should avoid spoiling every mechanic through tooltips and UI.

---

# 53. Humor and Tone

Bonk should maintain a goofy, lighthearted tone.

The world can contain serious progression systems while the presentation
remains humorous.

Early primitive systems should embrace this.

Examples include:

- Mudhole
- Bonk
- silly monster names
- exaggerated resource names
- humorous discoveries

The humor should support the world rather than making the systems impossible
to understand.

---

# 54. Player Experience Principles

Bonk should aim to be:

- easy to understand
- difficult to fully master
- rewarding to optimize
- satisfying to collect
- relaxing to idle
- meaningful to actively play
- humorous
- visually readable

Complexity should emerge from interacting simple systems rather than from
making each individual system complicated.

---

# 55. Current Major Buildings

The following buildings/functions are currently important:

### Thinkery
Research and knowledge.

### Central Hub / Camp
Quests, storyline, community, and offerings.

### Mudhole / Quarry
Primary settlement resource extraction.

### Forge / Refinery / Workshop
Refining and crafting.

### Museum / Trophy Hall
Collection and long-term achievements.

### Storage
Currently unresolved whether dedicated storage is necessary.

Additional buildings may be added as the city develops.

---

# 56. Systems That May Be Added Later

The following systems are possible but should not be implemented prematurely:

- farming
- cooking
- city skills
- advanced infrastructure
- additional research departments
- more complex elemental combat
- PvP
- additional city production
- advanced collection systems

These should be introduced only when they solve a real design problem.

---

# 57. PvP

PvP is intended as a future part of Bonk.

The combat system should therefore avoid making PvM-specific assumptions that
would make PvP impossible to support.

However, PvP should NOT drive the design of the initial combat system to the
point where PvM becomes unnecessarily complicated.

The PvM experience remains the primary focus during early development.

---

# 58. Design Principles

The following principles should guide future design decisions:

### 1. Intuitive before complex

A player should understand what something does without needing a spreadsheet.

### 2. Depth through interaction

Prefer several simple systems interacting with each other over individually
complicated systems.

### 3. Physical and logical resources

Resources should generally make sense in the world.

### 4. Progression should feel earned

Upgrades should represent meaningful advancement.

### 5. Old content should not become completely useless

Older resources and systems should have reasonable long-term sinks where
appropriate.

### 6. Rare should remain rare

Collection and rare drops should preserve their excitement.

### 7. Discovery matters

Not everything should be explicitly explained.

### 8. No unnecessary choices

The player should have meaningful choices, not decisions that exist only to
create complexity.

### 9. No permanent punishment for exploration

The player should generally be able to explore different progression paths.

### 10. Idle and active gameplay should complement each other

Active decisions should determine what the player gets from idle progression.

### 11. Build for the game that exists

Do not create systems for hypothetical future requirements.

### 12. Professional implementation

Technical implementation should follow professional game-development
principles without unnecessary complexity.

---

# 59. Current Design Status

Bonk is still in the design and prototyping phase.

Many systems are intentionally incomplete.

The following are particularly important areas that still require design work:

- exact combat formulas
- attack-type mechanics
- elemental mechanics
- Luck
- combat skill progression
- city skill progression
- stat points vs skill XP
- museum rewards
- storage
- food
- bait
- farming
- research presentation
- research progression
- crafting structure
- PvP
- idle combat edge cases
- special monster mechanics

These should be resolved progressively rather than all at once.

---

# 60. Fundamental Design Goal

Bonk should feel like a simple game on the surface with substantial depth
underneath.

The player should be able to understand:

> "What should I do next?"

without understanding every system in the game.

At the same time, long-term players should discover:

- optimization
- efficient farming
- rare drops
- hidden mechanics
- research interactions
- equipment specialization
- collection goals
- city optimization

The game should reward curiosity and mastery without requiring the player to
understand everything from the beginning.
