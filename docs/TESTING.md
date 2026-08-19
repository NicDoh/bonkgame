# Bonk — Testing

## Purpose

This document describes how to test Bonk during development.

Bonk does not currently have automated tests.

All testing is currently manual.

This document defines what should be tested after each meaningful change.

---

# 1. How to Run the Game

Press **F5** in Godot (or click the Play button) to run the main scene.

The debug panel will appear automatically in debug builds.

---

# 2. Debug Panel

The debug panel is visible in debug builds only (`OS.is_debug_build()`).

It updates every second and displays the current contents of `Inventory.item`.

Use this to verify that resources are being produced and modified correctly.

---

# 3. Current Manual Test Cases

## TC001 — Mud Production

**What to test:** Mud accumulates over time.

**Steps:**
1. Run the game.
2. Wait a few seconds.
3. Check the debug panel.

**Expected result:** The Mud count increases by approximately 1 per second.

---

## TC002 — Clay Production (Mine level 2+)

**What to test:** Clay appears after upgrading the Mine to level 2.

**Steps:**
1. Run the game.
2. Upgrade the Mine to level 2.
3. Wait a few seconds.
4. Check the debug panel.

**Expected result:** Clay begins appearing in the debug panel alongside Mud.

---

## TC003 — Mine Upgrade Cost Deduction

**What to test:** Upgrading the Mine deducts the correct resources.

**Steps:**
1. Note the current Mud count in the debug panel.
2. Trigger a Mine upgrade.
3. Check the debug panel immediately after.

**Expected result:** Mud is reduced by the cost defined in `mine_data.json` for the current level.

---

## TC004 — Mine Upgrade Blocked When Insufficient Resources

**What to test:** The Mine cannot be upgraded without sufficient resources.

**Steps:**
1. Start a fresh save (or clear resources manually).
2. Attempt to upgrade the Mine before accumulating enough Mud.

**Expected result:** The upgrade does not happen. Resources are not deducted.

---

## TC005 — Save and Restore — Inventory

**What to test:** Inventory is correctly saved and restored.

**Steps:**
1. Run the game.
2. Wait until a meaningful amount of Mud has accumulated.
3. Close the game.
4. Reopen the game.
5. Check the debug panel.

**Expected result:** Mud count matches what was saved.

---

## TC006 — Save and Restore — Mine Level

**What to test:** Mine level is correctly saved and restored.

**Steps:**
1. Run the game.
2. Upgrade the Mine to level 2 or higher.
3. Close the game.
4. Reopen the game.
5. Verify that Clay (or the correct resources for that level) is still being produced.

**Expected result:** Mine resumes production at the correct level.

---

## TC007 — Drop Table Correctness

**What to test:** The Mine only drops resources available at its current level.

**Steps:**
1. Run the game at Mine level 1.
2. Wait and observe the debug panel.

**Expected result:** Only Mud appears at level 1. Clay does not appear until level 2.

---

# 4. After Every Change

After any meaningful code change:

1. Run the game.
2. Check for errors in the Godot debugger.
3. Verify that Mud still produces.
4. Verify that the debug panel displays correctly.
5. If save/load was touched, test TC005 and TC006.
6. If drop tables were touched, test TC007.

---

# 5. Known Limitations

- There is currently no automated test runner.
- The debug panel is the primary testing tool for resource state.
- Mine upgrading currently requires temporary test code in `town.gd` — this must be removed once UI exists.

---

# 6. Adding New Test Cases

When a new system is implemented, add a test case to this document.

Each test case should include:

- **What to test** — one sentence
- **Steps** — numbered list
- **Expected result** — what correct behaviour looks like
