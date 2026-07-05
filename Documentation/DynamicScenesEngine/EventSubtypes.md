# Dynamic Scenes Engine: Event Subtypes

Event subtypes are integer global values sent to Story Manager as `Int2`. They describe the encounter size or event-specific category after the broad encounter keyword has already been chosen.

## Story Manager Data Packet

`DSETriggerOverlay` sends:

- `Location`: current location of the trigger activator.
- `Ref1`: the trigger activator itself.
- `Ref2`: currently unused.
- `Int1`: the location subtype.
- `Int2`: the event subtype.

## Event Subtypes

These are defined as global variables and are assigned on `DSETriggerOverlay`.

### `DSE_EventType_Disabled` (-1)

Use when you do not want to send a meaningful event subtype.

### `DSE_EventType_Any` (0)

This is mostly a placeholder. If any subtype should be valid, do not add a Story Manager condition looking for `Int2`.

### Man-made clutter pack-ins

#### `DSE_EventType_Clutter_Small` (1)

Small man-made clutter pack-in. Plan for one NPC group.

#### `DSE_EventType_Clutter_Medium` (2)

Medium man-made clutter pack-in. Plan for up to two NPC groups.

#### `DSE_EventType_Clutter_Large` (3)

Large man-made clutter pack-in. Plan for up to three NPC groups if the space supports it.

### Caves

#### `DSE_EventType_Cave_Small` (4)

Small cave cell. Plan for one NPC group.

#### `DSE_EventType_Cave_Medium` (5)

Medium cave cell. Plan for up to two NPC groups.

#### `DSE_EventType_Cave_Large` (6)

Large cave cell. Plan for up to three NPC groups if the layout has enough room.

## Matching Guidance

Use event subtype to protect encounter scale. A large combat quest should condition on a large event subtype, while a small ambush should accept small spaces. If the quest scales its own spawn counts safely, skip the subtype condition and let it run in more places.
