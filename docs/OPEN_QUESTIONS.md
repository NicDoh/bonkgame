# Bonk — Open Questions

## Purpose

This document contains design questions that have not yet been fully decided.

An item in this document must NOT be treated as confirmed design.

Ideas may be discussed, compared, and proposed, but they should only be moved
to `docs/DECISIONS.md` after the developer explicitly accepts the decision.

When a question is resolved:

1. Confirm the decision.
2. Add the decision to `docs/DECISIONS.md`.
3. Remove or mark the question as resolved here.
4. Update `docs/GAME_DESIGN.md` if necessary.

---

# 1. Combat

## OQ001 — Exact Role of Melee, Ranged, and Magic

The three attack types are currently:

- Melee
- Ranged
- Magic

Their exact mechanical differences are not yet finalized.

Questions include:

- What makes each attack type meaningfully different?
- Do they use different weapons?
- Do they have different attack speeds?
- Do they interact differently with enemy behaviour?
- How much specialization should each provide?
- Should a player be able to freely switch between them?

---

## OQ002 — Exact Combat Stats

The current core stats are:

- Strength
- Defence
- Constitution
- Accuracy
- Speed
- Luck

The exact formulas and relationships between these stats are not finalized.

In particular:

- How much does Strength affect damage?
- How does Defence reduce incoming damage?
- How does Constitution translate into HP?
- How does Accuracy affect hit chance?
- How does Speed affect attack frequency?
- Does every stat need to have a meaningful training method?

---

## OQ003 — Luck

Luck is currently unresolved.

Potential roles include:

- critical-hit chance
- bonus loot rolls
- certain secondary combat rolls
- other random outcomes

The main concern is that Luck may feel unintuitive if it simultaneously affects
combat and loot.

Another concern is that Luck should not make extremely rare drops cease to
feel rare.

Questions:

- Should Luck exist at all?
- If it exists, what should it affect?
- Should it affect combat?
- Should it affect loot?
- Should it affect both?
- How can it remain intuitive?
- How can rare drops remain genuinely rare?

---

## OQ004 — Critical Hits

The exact location of critical-hit mechanics has not been finalized.

One possibility is to associate critical hits with Luck rather than Accuracy.

Questions:

- Which stat should control crit chance?
- Should crits exist for all three attack types?
- Should different weapons have different crit characteristics?
- Should crit damage be affected by Strength?

---

## OQ005 — Elements

Possible elements include:

- Fire
- Water
- Ice
- Poison
- Flying
- Dragon
- etc.

The exact elemental system is unresolved.

Questions:

- Which elements should exist?
- Are elements primarily offensive, defensive, or both?
- Do elements create strengths and weaknesses?
- How visible are those weaknesses to the player?
- Can equipment carry elemental properties?
- Can any attack type use any element?
- How complicated should the system become?

---

## OQ006 — Attack-Type-Specific Defence on Gear

The player should have one general Defence stat.

Gear may nevertheless have specialized defensive properties such as:

> +20 Magic Defence

The exact system is unresolved.

Questions:

- What defensive categories should equipment support?
- Should gear defend against Melee/Ranged/Magic?
- Should elements have separate defensive bonuses?
- Can one item specialize heavily against one attack type?
- How should the UI communicate this without becoming complicated?

---

## OQ007 — Special Monster Mechanics

Some monsters may have unusual mechanics that the player must discover.

Examples include:

- only being damageable through an unusual method
- requiring the player to heal the monster
- reacting to a particular weapon or behaviour
- other unexpected mechanics

The exact rules for these encounters are unresolved.

Questions:

- How common should these monsters be?
- How should the player discover their mechanics?
- How should rumours communicate information?
- How much experimentation should be required?
- How can these mechanics remain fun rather than frustrating?

---

## OQ008 — Special Monsters During Idle Combat

Special monster mechanics create a potential idle-combat problem.

A player may want to use a broadly effective setup while idling, but a special
monster could require a niche strategy.

Questions:

- Can special monsters appear during normal idle farming?
- Should the player be able to avoid them?
- Should special monsters have their own activity/encounter?
- Should failure against one be low-cost?
- Can the player configure an idle strategy that handles most situations?

---

# 2. Combat Progression

## OQ009 — Exact Combat Skill Structure

The current direction is that the player trains what they use.

The exact structure is unresolved.

Possible approaches include:

- one skill per attack type
- separate offensive and defensive skills
- direct stat XP
- combat skills that indirectly improve stats
- a hybrid system

Questions:

- What exactly levels up when the player deals damage?
- Is Melee a skill?
- Is Ranged a skill?
- Is Magic a skill?
- Is Defence trained separately?
- How is Accuracy trained?
- How is Speed trained?
- How is Constitution trained?

---

## OQ010 — How Defence Is Trained

Training Strength is intuitive if Strength is based on damage dealt.

Defence is less obvious.

Possible methods include:

- taking damage
- successfully defending against attacks
- surviving battles
- using defensive equipment
- completing defensive milestones

The exact method is unresolved.

---

## OQ011 — How Accuracy Is Trained

Accuracy is also less intuitive than damage-based stats.

Possible methods include:

- successful hits
- attacks attempted
- attacks against high-defence enemies
- some form of accuracy-specific progression

The exact method is unresolved.

---

## OQ012 — Stat XP vs Stat Points

The game may use:

- direct skill XP
- stat points
- milestone rewards
- or a combination

The relationship between these systems is unresolved.

In particular, it needs to be decided how museum milestones can grant rewards
such as:

> Kill 100 Wolves → +1 Strength

without making normal Strength XP feel redundant.

---

# 3. Overall Progression

## OQ013 — Exact Overall XP Sources

The current direction is:

> Damage dealt → Combat XP  
> Successful victory → Overall XP

However, the overall XP system outside combat is unresolved.

Questions:

- Should city progression grant overall XP?
- Should quests grant overall XP?
- Should research grant overall XP?
- Should collection milestones grant overall XP?
- Should building upgrades grant overall XP?
- Should all major accomplishments contribute?

---

## OQ014 — Overall Level Formula

The player has an overall level primarily as an indicator of progression and
for hiscores.

The exact formula is unresolved.

Questions:

- How much XP is required per level?
- Is the curve exponential?
- Is there a maximum level?
- Does the level directly influence anything?
- Should two players with different specializations be easily comparable?

---

# 4. City

## OQ015 — Storage

Storage is currently unresolved.

Possible approaches:

### Finite Storage

The player has limited capacity and upgrades storage over time.

### Effectively Infinite Storage

Resources and collection items can accumulate without a meaningful capacity
limit.

Questions:

- Does storage create interesting gameplay?
- Does it create unnecessary friction?
- Does storage belong as a city progression system?
- Should different categories have different capacity rules?

---

## OQ016 — Exact Quarry Progression

The conceptual progression is:

**Mudhole → Clay Pit → Stone Quarry → deeper/advanced extraction**

The exact building progression is unresolved.

Questions:

- Are these separate building upgrades or separate buildings?
- When does Stone become available?
- When does Metal become available?
- How does quarry depth work?
- Does the visual appearance change substantially?
- How much does each level affect the drop table?

---

## OQ017 — Quarry Drop Table

The quarry should function as a drop table.

The exact table is unresolved.

Questions:

- What can each quarry level drop?
- Are lower-tier resources always available?
- How much should upgrade level affect drop probabilities?
- Can extremely valuable resources be found randomly?
- Should the player ever choose what level/depth to mine?

---

## OQ018 — Mud Late-Game Sink

Mud is intentionally important early but may become less intuitive late game.

Potential sinks include:

- infrastructure
- automatic conversion
- fuel
- cosmetic upgrades
- production
- other settlement systems

The exact long-term role of Mud is unresolved.

---

## OQ019 — Automatic Mud → Clay Conversion

A possible Thinkery unlock could automatically replace Mud requirements with
Clay or allow Mud to be processed into Clay.

Questions:

- Is this necessary?
- Is it automatic?
- Is it a research unlock?
- Is it a refining recipe?
- Does the player retain a reason to collect Mud?

---

# 5. Farming and Food

## OQ020 — Farming

Farming is a possible future city system.

Questions:

- Does Bonk need farming?
- Does it add meaningful gameplay?
- Does it primarily exist to support Food?
- Can it also produce bait or crafting ingredients?
- Should it be added early or only if the city feels too flat?

---

## OQ021 — Food System

Food is intended as a possible loadout slot.

The exact function is unresolved.

Questions:

- Does food heal?
- Does food provide temporary buffs?
- Does food influence idle efficiency?
- Does food affect combat stats?
- Is food consumed per fight?
- Does food create another farming/cooking loop?

---

## OQ022 — Cooking

If farming and food exist, cooking may become a city activity.

Questions:

- Is Cooking a skill?
- Is Cooking simply a crafting/refining system?
- Does cooking provide meaningful specialization?
- Is it worth adding another skill to the game?

---

# 6. Bait

## OQ023 — Exact Bait Mechanics

Bait should influence which monsters the player encounters.

The exact system is unresolved.

Questions:

- Is bait consumed per encounter?
- Does bait increase the chance of a specific monster?
- Can bait guarantee a monster?
- Can bait attract rare monsters?
- Can bait be crafted?
- Can bait be farmed?
- Does bait occupy a permanent loadout slot?

---

# 7. Crafting and Refining

## OQ024 — Building Structure for Crafting

The game needs a place to refine resources and craft equipment.

Possible structure:

- Forge
- Refinery
- Workshop
- multiple specialized buildings
- one combined production building

The exact structure is unresolved.

---

## OQ025 — Refining Categories

Potential refining chains include:

- Metal → Bars
- Bones → Carved Bones
- Strings → Rope

Questions:

- Which resources should be refinable?
- How many intermediate materials should exist?
- Should refining take time?
- Is refining idle or active?
- Can refining run automatically?

---

## OQ026 — Crafting

The crafting system must eventually support:

- weapons
- gear
- items
- consumables

The exact recipe and progression structure is unresolved.

Questions:

- Are recipes discovered through Thinkery?
- Are recipes discovered through quests?
- Are recipes learned automatically?
- Do crafting levels exist?
- Does crafting require active interaction?

---

# 8. Thinkery

## OQ027 — Research UI

The Thinkery should be easy to understand without displaying the entire
research tree.

The exact interface is unresolved.

Questions:

- How much of the future is visible?
- How are locked discoveries represented?
- How are branches shown?
- How does the player understand dependencies?
- How does the Odd Stone communicate progress?

---

## OQ028 — Research Chain Structure

Research should be based on logical items/discoveries rather than generic
research points.

The exact progression is unresolved.

Questions:

- Are research requirements primarily items?
- Are they discoveries?
- Are they quests?
- Can research require combat drops?
- Can research require city resources?
- Can research require crafting?
- How much cross-department dependency should exist?

---

## OQ029 — Odd Stone Progression

The Odd Stone should evolve visually as the Thinkery becomes more advanced.

The exact progression is unresolved.

Potential progression:

**Odd Stone → refined artifact → crystal ball / orrery**

Questions:

- What causes each transformation?
- Is it purely visual?
- Does it unlock functionality?
- Is it the physical representation of the research system?

---

# 9. Hub and Offerings

## OQ030 — Offering Rewards

The central camp can consume excess loot through offerings.

The exact rewards are unresolved.

Possible rewards include:

- permanent buffs
- city bonuses
- combat bonuses
- cosmetic upgrades
- milestone unlocks
- progression toward other systems

Questions:

- Are offerings permanent?
- Are they repeatable?
- Do they consume specific quantities?
- Can different offerings provide different effects?

---

## OQ031 — Non-Resource Offering System

It is already intuitive to burn/offering items such as Bones at a central
fire.

It is less intuitive to simply throw large quantities of Mud, Clay, or Stone
into a fire.

City infrastructure is therefore currently considered a more intuitive sink
for these physical resources.

The exact separation between:

**monster loot offerings**

and

**construction-resource infrastructure sinks**

is unresolved.

---

# 10. Museum

## OQ032 — Museum Progression

The museum is an important collection system.

The exact contents and progression are unresolved.

Questions:

- Does every monster have an entry?
- Does every equipment item have an entry?
- Are rare drops separately tracked?
- Are there completion percentages?
- Are there region-based collections?
- Are there long-term grind milestones?

---

## OQ033 — Museum Rewards

Museum milestones may provide permanent rewards.

The exact reward philosophy is unresolved.

Questions:

- Flat stat increases?
- Cosmetic rewards?
- Unlocks?
- Titles?
- Collection bonuses?
- Overall XP?
- Combination?

The system should avoid making normal skill progression feel redundant.

---

# 11. City Skills

## OQ034 — Mining / Smithing / Cooking Skills

It is unresolved whether activities such as:

- Mining
- Smithing
- Cooking

should have their own XP and levels.

Questions:

- Do city activities need skills at all?
- Do skills provide meaningful gameplay?
- Would they create unnecessary complexity?
- Should the player train them by performing the activity?
- Should they contribute to overall progression?

---

# 12. Idle System

## OQ035 — Idle Activity Configuration

The player should be able to choose what they are farming while idling.

The exact configuration system is unresolved.

Questions:

- Does the player select a monster?
- Does the player select a region?
- Does bait determine the target?
- Does food determine the activity?
- Can the player define a fallback target?
- What happens when inventory fills?

---

## OQ036 — Idle Failure Handling

The exact behaviour when an idle activity encounters a situation the current
setup cannot handle is unresolved.

Questions:

- Does the player stop?
- Does the character skip the enemy?
- Does the character die?
- Does the player receive reduced rewards?
- Does the player need to configure a fallback strategy?

---

# 13. PvP

## OQ037 — PvP Integration

PvP is intended as a future system.

The exact design is unresolved.

Questions:

- Is PvP real-time or simulated?
- Does it use the same combat system?
- Are PvP stats identical to PvM stats?
- Are there separate rules?
- How is balance handled?
- Does gear work identically?
- Does overall level matter?

PvP should not unnecessarily complicate the initial PvM system.

---

# 14. Resource Economy

## OQ038 — Resource Quantity and Value

The exact economic scale of resources is unresolved.

Questions:

- How quickly should players accumulate Mud?
- How quickly should Clay accumulate?
- How rare should Stone be?
- How rare should Metal be?
- How expensive should buildings be?
- How much should resources matter in late game?

---

## OQ039 — Resource Conversion

The exact relationship between:

- Mud
- Clay
- Stone
- Metal
- refined materials

is unresolved.

Questions:

- Can lower-tier resources always be converted upward?
- Are some resources only obtainable directly?
- Does refining require time?
- Does refining consume additional materials?

---

# 15. Long-Term Progression

## OQ040 — Relationship Between Major Progression Systems

Bonk currently has several possible progression dimensions:

- character stats
- combat progression
- overall level
- city progression
- research
- crafting
- collection

The exact relationship between these systems is unresolved.

The systems should feel interconnected without creating a confusing web of
requirements.

---

## OQ041 — Cross-System Requirements

Some systems may require progression in another department.

For example:

> Combat discovery → unlocks city technology

or:

> City technology → unlocks combat progression

The exact amount of cross-system dependency is unresolved.

The goal is to create meaningful interaction without creating frustrating
progression walls.

---

# 16. Scope

## OQ042 — Which Systems Belong in the First Playable Version?

Not every planned system should be implemented immediately.

The exact scope of the first meaningful playable version is unresolved.

Potential systems include:

- city
- Mudhole
- quarry
- basic resources
- Thinkery
- research
- combat
- monsters
- loot
- inventory
- crafting
- refining
- museum
- quests
- food
- bait
- farming

The initial version should remain small enough to build and test properly.

---

# 17. General Design Questions

## OQ043 — How Much Complexity Can Bonk Support?

Bonk should be easy to understand while still providing significant depth.

The exact complexity ceiling is unknown.

As systems are added, continuously evaluate whether each new mechanic:

- adds meaningful decisions
- creates interesting interactions
- supports the core fantasy
- improves long-term progression

If a system only adds another number, it should be questioned.

---

## OQ044 — What Should the Player Always Be Working Toward?

The game needs clear short-, medium-, and long-term goals.

Possible goals include:

- next building
- next research discovery
- better equipment
- new monster
- rare drop
- collection milestone
- city upgrade
- new region

The exact hierarchy of these goals is unresolved.

---

# 18. Resolution Rule

When resolving an open question, do not simply pick the option that is easiest
to program.

Evaluate the decision according to:

1. Player understanding
2. Gameplay depth
3. Intuitiveness
4. Long-term progression
5. Interaction with existing systems
6. Balance
7. Technical complexity
8. Maintainability

The simplest solution is preferred when it provides the same gameplay quality.

---

# 19. Current Priority

Not every open question needs to be solved immediately.

Questions should be resolved when they become necessary for the next stage of
development.

Avoid designing systems years ahead of implementation.

The immediate goal is to establish enough design certainty to build the core
game correctly without locking the project into unnecessary architecture.
