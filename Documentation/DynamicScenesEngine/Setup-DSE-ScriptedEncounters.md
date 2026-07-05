# Dynamic Scenes Engine: Scripted Encounters

Scripted encounters are local DSE encounters controlled by Papyrus. They are useful when the scene should react to a simple local event, such as the player entering a trigger, opening a container, reading a note, or loading into a prepared area.

Complete the [POI setup](./Setup-POI.md) first. Scripted encounters still depend on the same manager, linked refs, scene group markers, spawn group definitions, and chance conditions. You will usually need more markers than a simple spawn-only POI, so this is not a good fit for every small clutter pack-in or tight cave.

## When to Use This

Use a scripted encounter when:

- the encounter can be handled entirely inside the local cell or pack-in;
- you need predictable scene dressing or spawning rather than quest-state logic;
- the player only needs to trigger the scene, not be guided through radiant quest objectives;
- the setup is easier to maintain as one custom manager script than as a full quest.

Use a quest-driven approach instead when you need aliases, objectives, quest stages, dialogue scenes, radiant handoff, or behavior that must persist beyond the local encounter.

## Manager Script Pattern

At its core, a scripted encounter uses a custom manager that extends one of the DSE manager patterns. `OnTriggerEnter` is the most common trigger, but `OnOpen`, `OnRead`, `OnClose`, `OnTriggerLeave`, and cell load managers can also make sense depending on the object that starts the encounter.

In the custom manager, override the trigger handling behavior and script the scene work that should happen:

- spawn the needed NPC groups;
- enable, disable, or swap local clutter;
- place key containers, terminals, notes, or objective objects;
- choose which scene group markers the encounter should use;
- update any completion or debug globals the encounter needs.

Scripted encounters are strongest when they reshape the local scene layout. They are not a replacement for a quest when the player needs objectives, aliases, or multi-step quest logic.

## Practical Advice

Build the encounter in layers:

1. Get the base manager firing with logging enabled.
2. Spawn one small group from one scene group.
3. Add chest or clutter behavior.
4. Add any custom scripted scene elements.
5. Expand to extra groups, waves, or alternate layouts.

If an encounter does nothing, verify the trigger event first, then verify linked refs, then verify the spawn group configuration. If the manager fires but actors do not appear, the problem is usually in the marker links, spawn group definition, chance condition, or faction configuration.
