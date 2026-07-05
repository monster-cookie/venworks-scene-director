# Dynamic Scenes Engine: Triggers

Like the BGS Radiant Engine, Dynamic Scenes Engine uses triggers and markers in a POI to decide what story or encounter content should run there.

A DSE trigger is the Story Manager entry point. It gathers context from the current reference and sends a script event using the configured encounter keyword. Story Manager conditions can then choose a quest based on the keyword, location, trigger reference, location subtype, and event subtype.

## Story Manager Data Packet

`DSETriggerOverlay` sends the following data:

- `Location`: current location of the trigger activator.
- `Ref1`: the trigger activator itself.
- `Ref2`: currently unused.
- `Int1`: the selected location subtype global value.
- `Int2`: the selected event subtype global value.

The trigger can run on cell load or when the player enters the trigger volume, depending on the `TriggerType` property.

## Trigger Variants [REQUIRED]

One trigger variant is required for any Story Manager-managed POI. Place it where it represents the encounter cleanly, usually near the center marker or the natural player entry point.

The important setup fields are:

- `TriggerType`: `0` for cell load, `1` for player trigger enter.
- `StoryEventKeyword`: the encounter type keyword to send.
- `LocationType`: global variable sent as `Int1`.
- `EventSubType`: global variable sent as `Int2`.

### DSETriggerStoryPOI

Requests a radiant quest for a normal POI using the `DSE_EncounterType_Story_POI` event keyword.

### DSETriggerStoryClutter

Requests a radiant quest for a man-made clutter pack-in using the `DSE_EncounterType_Story_ManMadeClutter` event keyword.

### DSETriggerStoryCaves

Requests a radiant quest for a cave using the `DSE_EncounterType_Story_Cave` event keyword.

### DSETriggerStoryShip

Requests a radiant quest for a ship using the `DSE_EncounterType_Story_Ship` event keyword.

### DSETriggerStorySpace

Requests a radiant quest for a space encounter using the `DSE_EncounterType_Story_Space` event keyword.

## Authoring Notes

Use the encounter keyword for the broad content family, then use location and event subtypes only when a quest needs more specific matching. If a quest should accept any location subtype or event subtype, do not add a Story Manager condition for that value.

When debugging, check logs for the `DSETriggerOverlay` `StartEncounter()` message. It reports the keyword, location, references, and integer values sent to Story Manager.
