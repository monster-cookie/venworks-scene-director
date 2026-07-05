# Dynamic Scenes Engine: Overview

Dynamic Scenes Engine (DSE) is a smaller, POI-focused version of Bethesda's radiant encounter pattern. It gives a mod author a way to prepare a location, clutter pack-in, cave, ship, or space encounter with markers and then let either a local manager script or Story Manager-driven quest decide what actually appears there.

DSE is intended for mod creators. The player should only experience the result: a POI that can be repopulated, dressed, renamed, or used as a quest scene without requiring every variant to be hand-built as a separate location.

## What DSE Provides

- A scene manager script that owns the local encounter setup.
- Linked marker groups for bosses, minions, chests, map markers, and center markers.
- Spawn group configuration for faction-based NPC encounters.
- Trigger overlays that send Story Manager events with encounter type, location subtype, and event subtype data.
- A marker vocabulary for clutter placement, scene areas, and reusable POI layout points.

## Typical Workflows

### Local scripted encounter

Use this when the POI itself should spawn NPCs, chests, clutter, or scripted objects without starting a full quest. The manager is placed in the cell, markers are linked to it, and the chosen manager script decides when to run.

Start with [Setting up a POI](./Setup-POI.md), then read [Scripted Encounters](./Setup-DSE-ScriptedEncounters.md).

### Story Manager encounter

Use this when the POI should ask the Story Manager for a matching quest. The trigger overlay sends a Story Manager script event with:

- an encounter keyword, such as `DSE_EncounterType_Story_POI`;
- the trigger's current location;
- the trigger reference as `Ref1`;
- a location subtype global value as `Int1`;
- an event subtype global value as `Int2`.

Start with [Triggers](./Triggers.md), [Encounter Types](./EncounterTypes.md), [Location Subtypes](./LocationSubtypes.md), and [Event Subtypes](./EventSubtypes.md).

### Story Director

Story Director is the planned bridge between DSE spawners and quest-driven radiant behavior. At the moment it is not reimplemented for the current Free Lanes radiant setup, so treat [Story Director](./StoryDirector.md) as design and status documentation rather than a ready-to-use workflow.

## Authoring Order

1. Decide whether the encounter is local scripted behavior, Story Manager behavior, or both.
2. Place the manager or trigger object that owns the encounter.
3. Place the required center and map markers.
4. Place scene group markers for bosses, minions, and chests.
5. Link all markers back to the manager or trigger with the matching `DSE_LinkedRef_*` keyword.
6. Configure spawn groups, faction data, chance conditions, and subtype globals.
7. Test with a small encounter first, then expand to additional scene groups or waves.

## Reference Pages

- [Setting up a POI](./Setup-POI.md)
- [Markers](./Markers.md)
- [Triggers](./Triggers.md)
- [Encounter Types](./EncounterTypes.md)
- [Location Subtypes](./LocationSubtypes.md)
- [Event Subtypes](./EventSubtypes.md)
- [Scripted Encounters](./Setup-DSE-ScriptedEncounters.md)
- [Story Director](./StoryDirector.md)
