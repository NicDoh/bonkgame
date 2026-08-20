# Bonk — Design Decisions

## Purpose

This document contains decisions that have been explicitly made for Bonk.

These decisions should be treated as the current source of truth unless the
developer explicitly changes them.

Ideas, suggestions, and unresolved questions must NOT be added here.

When a decision changes:

1. Identify the existing decision.
2. Discuss the change.
3. Explicitly confirm the new decision.
4. Update this document.
5. Record the change clearly in the changelog when appropriate.

---

# 1. Project Identity

## D001 — Project Name

**Decision:** The game is called **Bonk**.

**Status:** Confirmed

---

# 2. Core Game

## D002 — Core Genre

**Decision:** Bonk is fundamentally an:

**Idle PvM + City Builder + Collection/Progression game.**

The game combines:

- idle PvM combat
- character progression
- city development
- resource gathering
- refining
- crafting
- research
- quests/storyline
- collection

**Status:** Confirmed

---

## D003 — Idle Is a Core Feature

**Decision:** Idle progression is a fundamental part of Bonk.

The player should be able to configure a character/activity and allow
progression to continue without requiring constant manual interaction.

Active decisions determine what the player idles toward.

**Status:** Confirmed

---

# 3. City Resources

## D004 — Primary Construction Resource Family

**Decision:** The primary city-building resource progression is based around:

**Mud → Clay → Stone → Metal**

These are physical resources rather than abstract currencies.

**Status:** Confirmed

---

## D005 — Mud Is the Starting Resource

**Decision:** The player's earliest city resource is Mud.

The primitive starting building is conceptually a:

**Mudhole**

Mud is intentionally primitive and somewhat humorous.

**Status:** Confirmed

---

## D006 — Resource Progression Becomes More Advanced

**Decision:** The resource extraction progression should evolve from primitive
materials toward more advanced materials.

The conceptual progression is:

**Mud → Clay → Stone → Metal**

The exact buildings and extraction mechanics can evolve, but the progression
should remain intuitive.

**Status:** Confirmed

---

## D007 — Quarry Is a Drop Table

**Decision:** Resource extraction should not simply be a deterministic
"X resources per second" system.

The quarry should function more like a **drop table**.

The quarry continuously rolls for possible resources.

Higher quarry levels should provide access to better drops and/or better
drop chances.

**Status:** Confirmed

---

## D008 — Upgrading the Quarry Must Not Remove Early Resources

**Decision:** Upgrading the quarry must not create a situation where an
important early resource becomes nearly impossible to obtain.

For example:

> Upgrading the quarry should not mean that the player can no longer
> reasonably obtain Mud or Clay.

The system should preserve access to older resources.

**Status:** Confirmed

---

# 4. Resource Sinks

## D009 — Older Resources Need Long-Term Sinks

**Decision:** Older resources should not become completely useless simply
because the player has progressed to more advanced materials.

The game should provide natural ways to consume excess early resources.

Possible examples include:

- infrastructure
- permanent improvements
- cosmetic upgrades
- production
- other city investments

The exact sinks are not all finalized.

**Status:** Confirmed

---

## D010 — Infrastructure Can Consume Excess Resources

**Decision:** Infrastructure is an appropriate long-term sink for resources
such as Mud, Clay, and Stone.

Infrastructure may provide:

- gameplay bonuses
- convenience
- speed improvements
- permanent city improvements
- cosmetic progression

Not every infrastructure sink must provide a gameplay advantage.

**Status:** Confirmed

---

# 5. Thinkery / Research

## D011 — Thinkery Is the Research Building

**Decision:** The research/knowledge center is called the:

**Thinkery**

The Thinkery is responsible for research, knowledge, and discoveries.

**Status:** Confirmed

---

## D012 — Research Is Not Based Solely on Research Points

**Decision:** Research should not simply be a generic:

> "Spend research points to unlock technology."

Research should involve logical discoveries, items, and progression chains.

The player should feel that they are actually discovering knowledge.

**Status:** Confirmed

---

## D013 — Research Can Split Into Multiple Directions

**Decision:** Research can branch into multiple directions.

The player should be able to explore multiple branches.

Branches do NOT represent permanent mutually exclusive choices.

The player should not have to choose:

> "Combat OR City"

and permanently lose the other branch.

**Status:** Confirmed

---

## D014 — Research Branches Can Depend on Each Other

**Decision:** Research departments can have cross-dependencies.

For example:

- Combat research may unlock a city technology.
- City research may unlock a combat technology.

The research system should therefore form an interconnected progression rather
than completely isolated trees.

**Status:** Confirmed

---

## D015 — The Entire Research Tree Should Not Necessarily Be Visible

**Decision:** The Thinkery should not necessarily show the player the entire
research tree immediately.

Research should be progressively revealed.

The interface should remain:

- intuitive
- readable
- understandable
- discoverable

**Status:** Confirmed

---

## D016 — Odd Stone Is an Early Discovery

**Decision:** The player should discover a special item early in the game,
currently called:

**Odd Stone**

The Odd Stone is connected to the development of the Thinkery.

As the Thinkery becomes more advanced, the artifact can become increasingly
refined, eventually resembling something such as a crystal ball or orrery.

The exact visual progression is not finalized.

**Status:** Confirmed

---

# 6. Research Departments

## D017 — Research Has Multiple Departments

**Decision:** Research should contain multiple areas rather than one
completely linear progression.

At minimum, there should be areas for:

- Combat
- City / Infrastructure / Construction

Additional departments may be added later.

**Status:** Confirmed

---

# 7. Combat

## D018 — Three Primary Attack Types

**Decision:** The primary attack types are:

- Melee
- Ranged
- Magic

These attack types exist partly to provide different ways of fighting and
different combat progression paths.

**Status:** Confirmed

---

## D019 — Attack Type and Element Are Separate

**Decision:** Attack type and element are separate concepts.

An attack does not inherently belong to one element.

For example:

- a melee weapon can deal Poison damage
- a ranged weapon can deal Fire damage
- a magic attack can potentially use other damage types

Elements are therefore an additional combat layer rather than subdivisions
of Melee/Ranged/Magic.

**Status:** Confirmed

---

## D020 — Core Player Stats

**Decision:** The baseline player stats are:

- Strength
- Defence
- Constitution
- Accuracy
- Speed
- Luck

This is the preferred core stat set.

**Status:** Confirmed

---

## D021 — Strength Is a General Offensive Stat

**Decision:** Strength is not restricted to melee.

Strength should function as a general offensive stat that can contribute to
damage across:

- Melee
- Ranged
- Magic

The exact formulas are not yet finalized.

**Status:** Confirmed

---

## D022 — Defence Is a General Defensive Stat

**Decision:** The player should have one general Defence stat rather than
separate player stats such as:

- Melee Defence
- Ranged Defence
- Magic Defence

Specialized defensive gear may still exist.

**Status:** Confirmed

---

## D023 — Gear Can Specialize Against Attack Types

**Decision:** Equipment can provide specialized defensive bonuses against
specific attack types.

The preferred presentation is a flat stat such as:

**+20 Magic Defence**

rather than displaying resistance primarily as a percentage.

**Status:** Confirmed

---

# 8. Combat XP

## D024 — Combat XP Comes From Damage

**Decision:** Combat XP is awarded based on successful damage dealt.

The player receives combat XP for hitting/dealing damage, regardless of
whether the overall battle is eventually won.

This makes training feel directly connected to performing the combat action.

**Status:** Confirmed

---

## D025 — Overall XP Is Separate From Combat XP

**Decision:** Overall progression is separate from individual combat training.

For combat:

**Damage dealt → Combat XP**

**Successful victory → Overall XP**

This separates:

> "How much did I train?"

from:

> "How much have I progressed?"

**Status:** Confirmed

---

# 9. Overall Level

## D026 — Player Has an Overall Level

**Decision:** The player has an overall level separate from individual
combat stats.

The overall level primarily communicates the player's overall progression.

Its main purposes include:

- indicating how far the player has progressed
- comparing players
- hiscores
- optionally gating some content

It is not intended to become an unnecessarily complicated secondary
progression system.

**Status:** Confirmed

---

# 10. Combat Discovery

## D027 — Some Monster Mechanics Are Discovered

**Decision:** Some unusual monster mechanics should not necessarily be
explicitly explained to the player.

The player may discover them through:

- experimentation
- rumours
- research
- quests
- observation
- repeated encounters

The game should allow players to discover unusual solutions themselves.

**Status:** Confirmed

---

## D028 — Special Mechanics Are Not Necessarily Tied to Elements

**Decision:** Unusual monster mechanics do not have to be represented as
elemental weaknesses.

A monster may have a unique mechanical condition without the game explicitly
classifying it as:

> "Weak to X."

This allows special encounters to feel more like discoveries.

**Status:** Confirmed

---

# 11. Collection

## D029 — Collection Is a Major Progression Pillar

**Decision:** Collection is an important long-term motivation in Bonk.

The player should have reasons to collect:

- monsters
- equipment
- rare items
- trophies
- discoveries
- unusual drops

**Status:** Confirmed

---

## D030 — Museum / Trophy Hall Is Important

**Decision:** Bonk should contain a museum/trophy-hall style building.

It provides a physical representation of the player's collection and
long-term accomplishments.

**Status:** Confirmed

---

## D031 — Collection Can Provide Permanent Progression

**Decision:** Collection milestones can provide permanent character or
progression rewards.

An example concept is:

> Kill 100 Wolves → +1 Strength

The exact implementation is not yet finalized.

**Status:** Confirmed

---

# 12. Hub / Camp

## D032 — Central Hub / Camp Exists

**Decision:** The settlement contains a central hub/camp built around a
central fire.

This is a major location for:

- quests
- storyline
- community
- offerings
- progression interactions

**Status:** Confirmed

---

## D033 — Excess Loot Can Be Offered

**Decision:** The central camp can provide a way to consume excess expedition
loot through offerings.

Examples include:

- Bones
- miscellaneous monster materials
- other excess loot

Offerings can contribute toward long-term milestones and/or bonuses.

**Status:** Confirmed

---

# 13. Crafting

## D034 — Refining and Crafting Are Required Systems

**Decision:** Bonk must have a system for refining resources and crafting
equipment/items.

Examples of refining include:

- Metal → Bars
- Bones → Carved Bones
- Strings → Rope

Examples of crafting include:

- weapons
- gear
- items
- consumables

The exact building structure is not yet finalized.

**Status:** Confirmed

---

# 14. Food and Bait

## D035 — Food and Bait Are Potential Player Loadout Components

**Decision:** The current preferred direction includes:

- Food slot
- Bait slot

These allow the player to configure what they are trying to farm while
idling.

The exact mechanics are not yet finalized.

**Status:** Confirmed

---

## D036 — Bait Can Influence Monster Encounters

**Decision:** Bait can be used to attract specific monsters or influence
which monsters the player encounters.

This supports targeted farming.

The exact implementation is not yet finalized.

**Status:** Confirmed

---

# 15. Farming

## D037 — Farming Is Not Required for the Initial City

**Decision:** Farming is a possible future city system but is not required
for the initial version.

It should only be implemented if the city needs another meaningful activity
or if food/cooking requires it.

**Status:** Confirmed

---

# 16. City Skills

## D038 — City Skills Are Not Yet Locked In

**Decision:** Systems such as:

- Mining
- Smithing
- Cooking

should not automatically become skills simply because they are activities.

A city skill system should only be introduced if it creates meaningful
gameplay depth.

**Status:** Confirmed

---

# 17. Design Philosophy

## D039 — Simple Systems Should Create Depth

**Decision:** Bonk should favor several simple systems interacting with each
other rather than making each individual system unnecessarily complicated.

The game should be:

- easy to understand
- difficult to fully master

**Status:** Confirmed

---

## D040 — Active Decisions Determine Idle Progression

**Decision:** Idle gameplay should not eliminate meaningful player decisions.

The player should actively choose things such as:

- what to farm
- what to equip
- what food to use
- what bait to use
- what to research
- what to craft
- how to develop the city

Then the game can continue progressing while idle.

**Status:** Confirmed

---

## D041 — Old Content Should Have Meaningful Sinks

**Decision:** Early-game resources and content should not simply become
worthless when the player reaches late game.

Where appropriate, the game should provide:

- infrastructure sinks
- collection goals
- cosmetic sinks
- permanent progression
- conversion
- other logical uses

**Status:** Confirmed

---

## D042 — Rare Drops Must Remain Rare

**Decision:** Extremely rare drops should remain genuinely rare and
meaningful.

Any mechanic that affects loot probability, including a potential Luck stat,
must be balanced so that it does not destroy the value of rare drops.

**Status:** Confirmed

---

## D043 — No Permanent Research Choices

**Decision:** Research branches may split, but the player should not be
forced into a permanent choice between branches.

The player should be able to explore multiple directions over time.

**Status:** Confirmed

---

## D044 — Discovery Should Be Part of the Experience

**Decision:** The game should not explain every mechanic immediately.

Some information should be discovered through gameplay.

This is especially relevant to:

- unusual monster mechanics
- rumours
- research
- hidden interactions
- collection discoveries

**Status:** Confirmed

---

# 18. Development Philosophy

## D045 — Best Practice Is the Default

**Decision:** Technical implementation should follow professional,
industry-standard best practices wherever appropriate.

The goal is to build a maintainable and scalable game rather than a collection
of quick hacks.

However, the project should not be over-engineered.

The simplest professional solution should be preferred.

**Status:** Confirmed

---

## D046 — The Developer Writes the Code

**Decision:** Claude should normally guide the developer rather than directly
implementing the project.

Claude may provide:

- explanations
- architecture guidance
- code snippets
- terminal commands
- debugging help
- reviews
- implementation steps

The developer should normally manually implement the changes.

Claude must not assume permission to directly modify project files unless the
developer explicitly asks for it.

**Status:** Confirmed

---

## D047 — Development Happens Incrementally

**Decision:** Bonk should be built in small, testable steps.

The preferred workflow is:

**Understand → Explain → Decide → Implement → Test → Document**

Large systems should not be implemented all at once when they can be built
incrementally.

**Status:** Confirmed

---

## D048 — Do Not Invent Unconfirmed Design

**Decision:** Claude must distinguish between:

- confirmed decisions
- proposed ideas
- open questions

A proposed idea must not silently become part of the game.

**Status:** Confirmed

---

# 19. Technical Architecture Decisions

## D049 — Save Format Is JSON During Development

**Decision:** The save format is JSON during development.

JSON is human-readable and easy to debug.

Before release, the format should be migrated to a binary format for
performance and to make cheating harder.

The SaveManager is the only system that reads or writes save data.

**Status:** Confirmed

---

## D050 — EventBus Is the Only Communication Channel Between Systems

**Decision:** Separate systems must communicate exclusively through the
EventBus.

No system should hold a direct reference to another system it does not own.

Direct references are only acceptable within the same system (for example,
a scene referencing its own child nodes).

This rule applies for the lifetime of the project.

**Why:** Direct cross-system references create tight coupling that makes the
codebase harder to maintain, test, and restructure as the game grows.

**Status:** Confirmed

---

## D051 — Phase 1 Architecture Is Intentionally Simpler

**Decision:** During Phase 1, the following simplifications are acceptable:

- Global state in Autoloads (EventBus, Inventory, SaveManager)
- Node-based scripts instead of separate Model + Service classes
- No orchestration layer

This is deliberate scope management, not technical debt.

The architecture should evolve toward the full pattern in `ARCHITECTURE.md`
as new systems are introduced. The migration should happen deliberately, not
reactively.

**Status:** Confirmed

---

# 21. Inventory Access

## D052 — Inventory Is Accessed via Character Profile

**Decision:** The player's full inventory is accessed through a character profile
button in the top left corner of the screen.

The character profile is also the entry point for:

- HP bar
- XP bar
- Character stats
- Gear

There is no permanent resource display in the town view.

The character profile button sits in the top left corner only.
The rest of the screen is free and transparent — no topbar.

This decision may be revisited as the game develops.

**Status:** Confirmed

---

# 20. Decision Changes

When a confirmed decision changes, this document must be updated.

The previous decision should not simply disappear.

When useful, preserve a short record of the change:

Example:

> D020 — Core Player Stats  
> Changed from the previous stat structure on YYYY-MM-DD.  
> Reason: ...

This allows the project's design history to remain understandable.

---

# 20. Important Principle

The existence of a decision in this document means:

**Do not reopen the question casually.**

Claude may still identify a serious problem with an existing decision.

If that happens, Claude should:

1. Identify the problem.
2. Explain why it matters.
3. Explain the consequences.
4. Propose alternatives.
5. Ask the developer whether the decision should be reconsidered.

Claude must not silently override a confirmed decision.
