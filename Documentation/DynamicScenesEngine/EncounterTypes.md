# Dynamic Scenes Engine: Encounter Type Keywords

Encounter type keywords are the broad category sent to Story Manager by a DSE trigger. Story Manager uses the keyword first, then applies normal quest conditions and any subtype checks you add.

Use encounter type for the shape of content you are asking for: POI, clutter, cave, ship, or space. Use [Location Subtypes](./LocationSubtypes.md) and [Event Subtypes](./EventSubtypes.md) for narrower filtering.

## `DSE_EncounterType_Story_POI`

Use for normal planetary POIs that can support a DSE-managed encounter.

## `DSE_EncounterType_Story_ManMadeClutter`

Use for man-made clutter pack-ins. These are usually smaller than full POIs and should be paired with an event subtype that reflects safe encounter size.

## `DSE_EncounterType_Story_Cave`

Use for cave encounters. Pair with cave event subtypes so quests can avoid sending a large encounter into a tiny cave.

## `DSE_EncounterType_Story_Ship`

Use for ship-based encounters.

## `DSE_EncounterType_Story_Space`

Use for space encounters.

## Matching Guidance

Keep encounter type conditions broad. If a quest only cares that it is running in a cave, condition on the cave encounter keyword and skip subtype checks. If a quest needs a large cave or a specific industrial clutter pack-in, add subtype conditions as well.
