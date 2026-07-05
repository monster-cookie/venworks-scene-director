# Dynamic Scenes Engine: Markers

DSE markers are the contract between the author-built location and the manager or quest that uses it. The marker tells DSE what kind of point it is; the linked ref keyword tells the manager which group should use it.

Most setup problems come from placing the right marker but linking it with the wrong keyword, or not linking it to the manager at all.

## Placement Markers

### `DSE_Marker_Center` (`DSE_LocRefType_Marker_Center`) [REQUIRED]

Marks the center of the usable POI space. The spawn system can use this as a fallback/default point, so place it on clear ground where an actor could safely appear.

It is often useful to add a simple primitive around the intended playable area while authoring so you can see the usable footprint.

### `MapMarker` (`DSE_LocRefType_Marker_Map`) [REQUIRED]

The normal BGS map marker. This is required if the player should be able to discover, fast travel to, or be directed to the POI. You can customize the map marker through alias override naming or the normal map marker scripting path.

### `XMarkerHeading` [RECOMMENDED]

The normal BGS XMarkerHeading used by move-to behavior and authoring conventions. Use it when a quest or scene needs a reliable facing direction or arrival point.

## Scene Markers

Scene markers define reusable encounter groups. A small location might only support Scene A. A larger POI might support Scene A, B, and C so quests or manager configurations can choose different layouts.

Each group has separate markers for bosses, minions, and chests:

- `DSE_Marker_SceneA_Bosses`, `DSE_Marker_SceneA_Minions`, `DSE_Marker_SceneA_Chests`
- `DSE_Marker_SceneB_Bosses`, `DSE_Marker_SceneB_Minions`, `DSE_Marker_SceneB_Chests`
- `DSE_Marker_SceneC_Bosses`, `DSE_Marker_SceneC_Minions`, `DSE_Marker_SceneC_Chests`

Link each one back to the manager with the matching `DSE_LinkedRef_Marker_Scene*_Bosses`, `DSE_LinkedRef_Marker_Scene*_Minions`, or `DSE_LinkedRef_Marker_Scene*_Chests` keyword.

### Boss markers

Use boss markers for leaders, bosses, officers, or other higher-value actors. Place them where the actor can appear cleanly and has a sensible initial position.

### Minion markers

Use minion markers for normal NPCs. Give the group more markers than the minimum when the space allows it; this gives the spawn system better placement options.

### Chest markers

Use chest markers for reward containers or boss chest placement. Keep them reachable and avoid placing them where spawned NPCs will immediately block access.

## Travel Markers

Travel markers are mirrored from the Radiant Engine pattern. They are usually points NPCs can move to after spawning at the center marker or in a scene.

They are not required for basic DSE spawning. Add them only when the quest or custom script needs extra movement targets.

### `DSETravelA1` (`DSETravelA1LocRef`) - `DSETravelA3` (`DSETravelA3LocRef`)

### `DSETravelB1` (`DSETravelB1LocRef`) - `DSETravelB3` (`DSETravelB3LocRef`)

### `DSETravelC1` (`DSETravelC1LocRef`) - `DSETravelC3` (`DSETravelC3LocRef`)

## Important Markers

Important markers are quest-facing points, usually tied to an object the player should find, inspect, loot, or use.

### `DSEMarkerSmallImportant` (`DSEMarkerSmallImportantLocRef`)

Use this for a small key quest item, clue, or object that points the player to another location or next step.

## Spawn Markers

Spawn markers are used by the manager's spawn group definitions. The definition chooses which linked ref keyword to read, and the manager gathers all references linked with that keyword.

### NPCs

#### Bosses/leaders

Boss markers denote where the group's leader should spawn.

#### `DSEMarker_Boss` (`DSEMarkerBossLocRef`)

#### `DSEMarker_Boss_Mini` (`DSEMarkerMiniBossLocRef`)

#### Minions

Minion markers denote where normal group members should spawn. Use enough markers for the largest minion count configured for that scene group.

### Containers

Container markers control where loot containers are spawned.

#### `DSEMarker_Container_Small` (`DSEContainerSmallLocRef`)

#### `DSEMarker_Container_Large` (`DSEContainerLargeLocRef`)

#### `DSEMarker_Container_Boss` (`DSEContainerBossLocRef`)

### Clutter

Clutter markers control placement for random clutter objects, usually pack-ins. Match the marker size to the space you are offering the clutter system.

#### Sizing

A basic chair or file cabinet is roughly 1m x 1m in game. Use that as a practical sanity check when picking marker size.

#### Floor Clutter

- `DSE_Marker_Clutter_Floor_T1` (`DSE_LocRefType_Clutter_Floor_T1`)
  - Size is 1m by 1m
- `DSE_Marker_Clutter_Floor_T2` (`DSE_LocRefType_Clutter_Floor_T2`)
  - Size is 4m by 4m
- `DSE_Marker_Clutter_Floor_T3` (`DSE_LocRefType_Clutter_Floor_T3`)
  - Size is 8m by 8m
- `DSE_Marker_Clutter_Floor_T4` (`DSE_LocRefType_Clutter_Floor_T4`)
  - Size is 16m by 16m

#### Table/Cabinet Surface Clutter

- `DSE_Marker_Clutter_Surface_T1` (`DSE_LocRefType_Clutter_Surface_T1`)
  - Size is 5cm by 5cm
- `DSE_Marker_Clutter_Surface_T2` (`DSE_LocRefType_Clutter_Surface_T2`)
  - Size is 25cm by 25cm
- `DSE_Marker_Clutter_Surface_T3` (`DSE_LocRefType_Clutter_Surface_T3`)
  - Size is 50cm by 50cm
- `DSE_Marker_Clutter_Surface_T4` (`DSE_LocRefType_Clutter_Surface_T4`)
  - Size is 1m by 1m

#### Outdoor Clutter

- `DSE_Marker_Clutter_Outdoor_T1` (`DSE_LocRefType_Clutter_Outdoor_T1`)
  - Size is 1m by 1m
- `DSE_Marker_Clutter_Outdoor_T2` (`DSE_LocRefType_Clutter_Outdoor_T2`)
  - Size is 4m by 4m
- `DSE_Marker_Clutter_Outdoor_T3` (`DSE_LocRefType_Clutter_Outdoor_T3`)
  - Size is 8m by 8m
- `DSE_Marker_Clutter_Outdoor_T4` (`DSE_LocRefType_Clutter_Outdoor_T4`)
  - Size is 16m by 16m
- `DSE_Marker_Clutter_Outdoor_T5` (`DSE_LocRefType_Clutter_Outdoor_T5`)
  - Size is 32m by 32m

## Placement Checks

Before testing, confirm:

- every required marker is linked to the manager;
- each link uses the matching `DSE_LinkedRef_*` keyword;
- actor spawn markers are on navmesh or otherwise safe ground;
- chest markers are reachable by the player;
- clutter markers have enough empty space for their tier;
- the manager's spawn group definition points at the same linked ref keywords you used in the cell.
