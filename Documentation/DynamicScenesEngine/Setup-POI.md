# Dynamic Scenes Engine: Setting up a POI

This page describes the minimum setup for a POI, cave, clutter pack-in, or similar encounter space that should be managed by Dynamic Scenes Engine.

The short version: place a manager, place markers, link the markers back to the manager with the correct `DSE_LinkedRef_*` keywords, then configure the manager's spawn groups.

## Required Components

The following activators and statics must be present in the scene, pack-in, or POI or DSE will not have enough information to work. All markers need to be linked by keyword to the parent manager.

### Scene manager

A scene manager is required. Use one of the provided manager activators, such as `DSE_Manager_ActivatorOnEnter` or `DSE_Manager_CellOnLoad`, unless you intentionally need a custom object with the matching `DSEManager` script attached.

The manager owns the local encounter configuration:

- when the encounter should run;
- whether the encounter can spawn based on chance conditions;
- which spawn group definitions are available;
- which linked marker groups should be used for bosses, minions, and chests;
- whether waves or timer-delayed waves should be used.

All spawn markers must be linked to this manager for NPC and chest spawning to function at game time.

### Required marker links

At minimum, link these references back to the manager:

- center marker with `DSE_LinkedRef_Marker_Center`;
- map marker with `DSE_LinkedRef_Marker_Map`;
- at least one boss marker for the active scene group;
- at least two minion markers for the active scene group;
- at least one chest marker if the encounter can spawn a boss chest.

Use the scene-specific linked ref keyword that matches the group you are configuring. For example, Scene A boss markers should use `DSE_LinkedRef_Marker_SceneA_Bosses`, Scene A minions should use `DSE_LinkedRef_Marker_SceneA_Minions`, and Scene A chests should use `DSE_LinkedRef_Marker_SceneA_Chests`.

### Scene group markers

You must have at least one scene group, but you can define as many as the POI can support. Scene groups let the same POI support multiple encounter layouts, such as a small patrol in one area or a larger fight that uses the whole location.

The current built-in group vocabulary is:

- Scene A: bosses, minions, and chests;
- Scene B: bosses, minions, and chests;
- Scene C: bosses, minions, and chests.

HINT: Use the ref window batch editor in the View menu to link everything. You can select a group of references in the cell, then use the LinkedRef mode of the editor to link them all to the manager in one shot. This seriously speeds up authoring work.

#### Boss markers

Place at least one boss marker for any scene group that can spawn a leader, boss, officer, or other high-value actor. Boss markers are passed to the spawn system through the group's `LinkRefKeywordForBossSpawnPoints`.

#### Minion markers

Place at least two minion markers for any scene group that can spawn normal enemies. More markers give the spawn system room to vary the encounter and reduce the chance that actors stack on top of each other.

#### Chest markers

Place at least one chest marker for any scene group that can spawn a boss chest or other reward container. Chest spawning is wired through the group configuration even if a specific encounter decides not to use it yet.

## Manager Configuration Checklist

Configure the manager script before testing:

- `Mode`: use normal single-spawn mode unless you specifically need waves.
- `Waves`: use `1` for a single wave; use higher values for limited waves; use `0` only when you intentionally want infinite waves.
- `TimerDelay`: use `0` for the default wave delay behavior, or set a specific number of seconds between waves.
- `GlobalChanceToSpawn`: condition form that decides whether the encounter runs.
- `PlayerCompleted`: optional global that is set when the manager successfully starts the encounter.
- `SpawnGroupDefinitions`: at least one spawn group definition is required.

Each spawn group definition should identify:

- the faction keyword to spawn;
- boss and minion chance conditions;
- min and max boss counts;
- min and max minion counts;
- the linked ref keyword for boss spawn points;
- the linked ref keyword for minion spawn points;
- the linked ref keyword for chest spawn points.

Avoid using `0` as a minimum actor count unless you truly want that group to spawn no actors. The spawn definition comments note that `0` can force zero NPCs because of random number behavior.

## Quick Test Pass

Before building out a large POI, test a small setup:

1. Place one manager.
2. Place one center marker and one map marker.
3. Place one Scene A boss marker, two Scene A minion markers, and one Scene A chest marker.
4. Link all markers to the manager with the correct Scene A keywords.
5. Configure one spawn group with low actor counts.
6. Enter, load, open, read, or otherwise trigger the manager based on the manager variant you selected.

If no encounter starts, check the linked refs first. Most DSE setup failures come from markers not being linked to the manager with the exact keyword that the spawn group definition expects.
