# Dynamic Scenes Engine: Location Subtypes

Location subtypes are integer global values sent to Story Manager as `Int1`. They are meant to describe the theme or layout family of the trigger location.

Do not use location subtypes as a replacement for the encounter type keyword. The encounter type says what broad kind of content is being requested; the location subtype says what flavor of location it is.

## Story Manager Data Packet

`DSETriggerOverlay` sends:

- `Location`: current location of the trigger activator.
- `Ref1`: the trigger activator itself.
- `Ref2`: currently unused.
- `Int1`: the location subtype.
- `Int2`: the event subtype.

## Location Subtype

These are defined as global variables and are assigned on `DSETriggerOverlay`.

### `DSE_LocationType_Disabled` (-1)

Use when you do not want to send a meaningful location subtype.

### `DSE_LocationType_Any` (0)

This is mostly a placeholder. If any subtype should be valid, do not add a Story Manager condition looking for `Int1`.

### `DSE_LocationType_StorageGeneral` (1)

General storage-themed man-made clutter.

### `DSE_LocationType_StorageFluid` (2)

Fluid storage-themed man-made clutter.

### `DSE_LocationType_Solar` (3)

Solar power-themed man-made clutter.

### `DSE_LocationType_Industrial` (4)

Industrial-themed man-made clutter.

## Matching Guidance

Only condition on location subtype when the quest content actually depends on the setting. For example, a quest about sabotaging solar equipment should require `DSE_LocationType_Solar`; a generic pirate ambush probably should not care.
