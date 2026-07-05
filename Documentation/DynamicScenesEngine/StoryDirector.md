# Dynamic Scenes Engine: Story Director

**Current status:** Story Director has not been reimplemented for the current Free Lanes radiant setup. Free Lanes changed the Radiant Engine heavily enough that this path should be treated as experimental design documentation, not a working creator workflow.

Story Director is intended to be the bridge between DSE spawners and the Radiant Quest Engine. The goal is to let a prepared DSE location be selected and configured by quest logic rather than only by a local manager script.

Because it depends on the radiant quest engine, Story Director inherits the same restrictions. The biggest practical restriction is that radiant selection can only deal with PCM world spaces, not instanced dungeons, clutter pack-ins, or caves.

## Intended Pieces

The core pieces are:

- `DSEController`: quest-side or controller-side logic for coordinating a DSE-backed radiant scene.
- `DSETriggerOverlay`: the trigger object that sends Story Manager events.
- Story Manager script events: the matching layer that selects a quest based on encounter type, location subtype, event subtype, and normal quest conditions.
- DSE manager and markers: the local POI setup that the selected quest or controller would reconfigure.

## Difference from Scripted Encounters

Story Director should not be confused with [DSE Scripted Encounters](./Setup-DSE-ScriptedEncounters.md).

Scripted encounters are local Papyrus-driven scenes. They can spawn groups, dress the cell, and react to local triggers, but they do not get the full power of quest aliases, quest stages, objectives, or radiant selection.

Story Director is the quest-driven version of that idea. Once it is working again, it should be the better choice for encounters where the player needs objectives, quest state, dialogue, or other systems that belong in a quest.
