![ScrN Balance](https://www.dropbox.com/s/bm0g36djloco3dc/ScrNBalanceLogo256.jpg?dl=1 "ScrN Balance")

# KF-ScrnBalance

ScrN Total Game Balance mutator for Killing Floor 1.

*Copyright (c) 2012-2020 PU Developing IK, All Rights Reserved.*

-------------------------------------------------------------------------------

# Version History

*   _In this document all references to config file ScrnBalance.ini should be
    treated as ScrnBalanceSrv.ini, if you're using server version of
    ScrnBalance (ScrnBalanceSrv.ScrnBalance)._


-------------------------------------------------------------------------------
## VERSION 9

-------------------------------------------------------------------------------
### v9.63.07
- Machete Boost capped at 150 (down from 250)
- Machete damage scales exponentially according to the boost and player's velocity.
- At the beginning of the wave, weapons on the ground are not destroyed immediately, but in 3 seconds.

### v9.63.06
- Added a safety check to restore weapons in case player gets stuck in `QuickMelee`.
  It should trigger automatically. If not, there is a console command: `FixQuickMelee`
  Now using QuickMelee should be safe.
- QuickMelee is now performed slightly faster
- Machete-sprint speed boost now gets halved every second instead of instantly dropping down to 0, in case of cooldown.

### v9.63.05
- Fixed reloading of the regular Shotgun
- Added more ScrN key bindings to Settings/Controls

### v9.63.04
- Fixed Shotgun headshot detection bug at point-blank range

### v9.63.03
- Fixed **Boomstick** network replication bug (some of many)
- Lowered Boomstick total ammo count from 48 down to 42 (62 -> 54 @ L6)
- Ammo box gives 6 Boomstick shells (down from 10)

## ScrN Voting Handler v4.06
- Fixed a potential player crash issue
- Fixed an alignment issue when vote value contains color tags


### v9.63.02
#### Weapons
- Reworked **Boomstick** reload. No the reload has 3 phases: open barrels; insert shells; close barrels. Player can
  skip the reload by switching to another gun, throwing nades or Quick Melee in the first and the last phase.
  Reload cannot be skipped in the middle of inserting shells.
  Skipping reload in the phase 1 leaves the weapon unloaded. Next time Boomstick is equipped, the reload gets restarted
  from the beginning.
- Fixed the **Shotgun point-blank penetration bug** that existed from both in ScrN Balance and Vanilla since the very
  beginning. When shooting a zed at point-blank range, pellets did not penetrate the target.
  **This is not the distant spawn bug** where pellets spawn behind the target (and that's why you have to crouch or
  jump when shooting SC, for instance). The latter is still in the game. I can easily fix that but it will break all
  known combos, so I leave it as is.
- **Chainsaw** is now a cross-perk weapon (Berserker + Support Spec.)
- Raised Chainsaw alt fire headshot multiplier to x1.3 (up from x1.2)
- New achievement: *Evil Dead Combo* - Solo-kill 15 Scrakes with Chainsaw + Boomstick without taking damage.

#### Heavy MachineGunner v5.10
From now on, HMG is considered long-range Support.
- Removed ~Heavy AK47~. *Heavy Tommy Gun* is now starting Tier 1 weapon for HMG.
- Significantly raised bullet over-penetration for **RPK47**, **PKM**, and **M249**.
- Added Semi-auto mode for M249 with even higher penetration.
- Lowered M249 DPS and magazine size by ~20% to compensate increased penetration
- Lowered total ammo for RPK47, PKM, and M249.
- Increased M249 weight to 13 (up from 12)
- Lowered **Pat Chaingun** total ammo to 1500 (down from 1800)
- Raised **XMV850** damage from 39 to 45 (62 -> 72 @ L6)

#### ScrN Weapon Pack
- Fixed *Shotgun point-blank penetration bug* for **Saiga-12** and **SPAS-12**

#### Weapon Blame
Some weapons are considered overpowered, but nerfing them would make them useless. That's why you players can still buy
such weapons, but they get automatically blamed for doing that.
In addition to blame, *Hardcore Level* gets lowered, which, in turn, can prevent players to gain some achievements.
Blaming is done only when buying weapon from The Trader. Picking up those weapons from the ground doesn't blame the
player, neither lowers HL.

The current blame weapon list (applied only on the Boss wave - you can safely buy then in early waves):
- M99 (-1 HL)
- RPG (-4 HL)
- M41A a.k.a. Alien Rifle (-2 HL)

#### Code Changes
- Fixed an issue where spawned `ScrnGameRulesMod` didn't automatically add itself to the mod list.

### v9.63
#### Console Commands
- `WeaponSlot X` / `GunSlot X` moves weapon to slot X, where X is in [1..9] (thanks to *Scuddles*)

  Players can bind extra slots like this:
```
set input 6 SwitchWeapon 6
set input NumPad6 WeaponSlot 6
```
  For example, select Boomstick and press NumPad6. Boomstick gets moved from default slot 4 to slot 6.
  Now pressing 6 selects Boostick while leaving slot 4 exclusively for AA12.

#### Ridiculous Stuff
- When player is out of nades, he/she throws toilet paper
- Player drops toilet paper on death
- When blamed, the player farts and "craps out" some toilet paper
- Zeds try to avoid farts for 15 seconds
- Farting limited to once per minute to avoid cheating

#### ScrN Weapon Pack
- Removed the old RPG-7. Renamed the new RPG-7 from `ScrnRPG` to `RPG`.
  Make sure to update *ScrnBalanceServ.ini* and *ServerPerks.ini* to ensure that there is `RPG` and `RPGPickup`
  instead of ~ScrnRPG~ and ~ScrnRPGPickup~ respectively.
- Fixed RPG scope. Now crosshair in the scope matches the iron sights.
- Added Lidar sensor to **RPG**, calculating the distance of the target.
  Currently, the distance is displayed only on the Texture scope.

#### ScrN Zed Pack
- Fixed an issue when **Shiver** could teleport if he did not see the player.
- Added slight randomness in Shiver's teleport cooldown preventing 4-pack squad to teleport at the same time

#### Heavy MachineGunner v5.03
- Rebuilt to comply with the ScrN Balance v9.63

#### Horzine Technician v4.03
- Rebuilt to comply with the ScrN Balance v9.63

#### Code Changes
- Introduced `ScrnGameRulesMod` to allow customization of `ScrnGameRules`
- Introduced `ScrnAchHandlerBase.ApplyGameRules()` to execute once the game rules are found and set
- `ScrnAchCtrl.FindAchievement()` and therefore `ProgressAchievementByID()`, `GetAchievementByID()`, and
  `IsAchievementUnlocked()` are no longer looking for *map* achievements.
  This gives significant performance boost due to excluding 200+ map achievements from the lookup list.
  Use `ScrnMapAchievements.UnlockMapAchievement()` to unlock map achievements.

-------------------------------------------------------------------------------

### v9.62.07
#### Social Isolation
- The Virus cannot instantly kill a player with 100hp anymore

### v9.62.06
#### Social Isolation
- Fixed a bug where Asymptomatic players sometimes were considered healthy
- The period of sickness raised to 20-60 minutes (up from 15-45)
- Virus damage slightly scales according to player count


### v9.62.05
#### Social Isolation
- Minimum player count for *Covidiot Party* achievement lowered to 3 (down from 4)
- Fixed an issue where Covidiot achievements were not given if the last infected player was asymptomatic.

#### UI/UX
- *Cool HUD* is disabled by default. New players start with the classic HUD. Cool HUD is still available for selection
  in *ScrN Features* or via console command: `ToggleHudStyle`
- Perked weapon category gets automatically selected and opened on entering shop menu

#### Balance
- Fixed an issue at zed's enemy selection where the zed could see a player behind.
- `bSpawn0` enabled by default (spawn weapons cost nothing, drop all purchased guns on death)

#### Config
- `bUseDLCLocks` disabled by default (all weapons available)
- `DLCLocks` moved to a separate config file: **ScrnLock.ini**
- All default configs converted from UTF-16 to ANSI. Any unicode characters removed.
  Keep in mind that **KF1 engine does NOT support UTF-8**.
  If you put any unicode character in the config, save it in *UTF-16 LE* encoding.
  Saving config in UTF-8 makes it unreadable by the engine.

#### Code Changes
- Removed broken achievement lookup cache
- Added `ScrnVeterancyTypes.RelatedPerkIndex` to identify related perks (e.g., Field and Combat medics)
- Fixed an incorrect player count value at `ScrnPlayerInfo.WaveStarted()`
- Fixed a warning on accessing null `KFGRI` in `ScrnBalance.PostBeginPlay()`


### v9.62.01
#### Social Isolation Mod
[Steam Webpage](https://steamcommunity.com/groups/ScrNBalance/discussions/2/4666237625653274273/)

#### ScrN Waves
- New game **60 - Social Isolation**
- New game **61 - Triple Invasion** (Social Isolation + Doom3)
- Fixed an issue when event boss could spawn in non-event games
- Raised Hardcore Level for *Mystery Game*, *Welding Floor*, and *Ammo Hunt*

#### Balance Changes
- Lowered base price of **MP7M** to 350 and removed perk discount
- Lowered low-health speed reduction -15% max (from -30%). Players with low health aren't *that* slow anymore.

#### Achievements
- Optimized achievement lookup speed.
- Lowered requirement for *TeamWork: Grilled Shiver Brains* to 50 (down from 250)

#### Code Changes
- Refactored achievement progress handling. All related functions moved to `ScrnAchCtrl` class.
  From now on, custom mutators should use `class'ScrnAchCtrl'.static.RegisterAchievements()` for custom achievement
  registration.
  Legacy functions left in `ScrnAchievements` class but marked deprecated. They will be removed in future.
- Added `ScrnAchHandlerBase.GameEnded()`
- Added `ScrnHumanPawn.bServerShopping` flag that is set during shopping. For example, this flag can be used to
  distinguish weapon purchase from pickup.
- Deprecated `ScrnPlayerInfo.CustomReplicationInfo`


### v9.62.00
#### Features
- Added a proper support for headshot multiplier below 1.
  For instance, if `HeadShotDamageMult=0.3`, then 30% damage goes to the head, the remaining 70% damage the body.

#### ScrN Waves
- `Doom3DisableSuperMonsters` for *ScrnGameLength*. if true, prevents Doom3Mutator from randomly spawning mid-game
  bosses. Use this, if bosses are controlled via ScrnWaves.ini. Requires **ScrnDoom3KF v9.62+**

#### Bug Fix
- Fixed a rare crash due to missing ambient sound for **xbow** and **M99**.

#### Console Commands
- `MUTATE ZED <alias> <index> SPAWN <count>` spawns zed(-s). Requires admin rights.
  Only zeds that are enabled for the current game can be spawned.
  Example: `MUTATE ZED FP 1 SPAWN 5` - spawns 5 Fleshpounds.
- `MUTATE ZED <alias> <index> SUMMON` - similar to spawn, but instead of spawning zed in a *ZombieVolume*, summons it
  in front of the player. Player needs to look at the ground where he wants to summon a zed.  
  **WARNING!** Be extremely cautious when summoning a zed. If you miss the ground, you can summon it outside of the
  map and screw up the entire game. Use summon for debug/test purpose only. `SPAWN` is much safer than `SUMMON`.

#### Code Changes
- Added `MaxHeadHealth` to `ScrnGameRules.MonsterInfo`
- `ScrnFire` base class for instant fire with bullet penetration
- `ScrnHighROFFire` base class for super-fast shooting weapons

#### Heavy MachineGunner v5.00
- Fixed Stinger fire sounds
- Adjusted Stinger 1st person muzzle flash
- Fixed Pat Chaingun bullet tracer
- AUG A1 weight lowered to 8 (down from 9)
- AUG A1 faster reload: 3.5s -> 2.8s
- SA80 weight lowered to 7 (down from 11)
- SA80 can slightly damage heads (HS mult. x0.3)
- SA80 reduced magazine size down to 45 (90 @ L6) and total ammo
- RPK47 weight raised to 9 (up from 8)
- Added bullet penetration for RPK47, PKM, and M249

-------------------------------------------------------------------------------

### v9.61.05
- Changed requirement for getting Suicidal Map achievements. Now those can be obtained by surviving TurboGame,
  Nightmare Mode (GameLength=9) or any non-Doom non-FTG custom game modes (GameLength in [72..99])
- Fixed bug where MVOTE DIFF sometimes did not work
- Restored `bOtherPlayerLasersBlue` feature. It is not available in GUI yet, but it can be set in *User.ini*
- Added `HardcoreLevel` to ScrN Waves. Allows forcing HL for each game length and for each difficulty.
    ```
    HardcoreLevel=(HL=10)
    HardcoreLevel=(Difficulty=5,HL=15)
    HardcoreLevel=(Difficulty=7,HL=20)
    ```
- New config file: **ScrnInternal.ini**. Created by ScrN Balance, used internally by ScrN Balance.
  Users should not touch it.


### v9.61.04
- New game mode: **FTG: Fight The Patriarchs** (by *nmm*)
- **Mystery Mode v2** - remake by *nmm*. Now it is pure mystery.
- Fixed yet another bug that prevented teleporting the Guarding from a shop.


### v9.61.03
- **Combat Shotgun** got laser sight and improved reload(by *Scuddles*)
- Flares now always ignite zeds, even if damage < 10
- `ColoredServerName` temporary removed due to bugs
- "Team Budget" renamed to **Team Wallet** in UI
- Fixed a potential bug where going spectator could break Team Wallet
- While own weapons are locked, player cannot pickup even starting weapons of other players anymore.
  Made this way to allow players to avoid picking up garbage while looking for own guns.

#### FTG
- Fixed bug where base was not set if the Guardian was in a shop at wave begin
- Fixed bug where at wave end the Guarding was not moved to the Trader if carried by a player


### v9.61.02
- Fixed ammo count display for LAW, HRL and RPG.


### v9.61.01
#### Weapons (by *Scuddles*)
- Tactical reloads added for Incendinary Thompson, Steampunk Sniper, M14 EBR, KSG Shotgun.
- Fixed Dual MK23 pistol firing order.
- Fixed recoil not applying to M4 M203 and Seeker Six alternate fire modes.
- Added a backblast particle emitter to LAW.
- Fixed MAC10 and Thompson SMGs bolt locking mechanics on full auto.
- Slightly reduced opacity of medic grenade cloud.

##### Weapon Balance
- Increased FN FAL ACOG headshot multiplier 1.2 -> 1.3
- Increased Thompson Drum SMG firerate 700rpm -> 845rpm, increased base cost 1500 -> 2000
- Decreased Thompson base reload speed 1.0 -> 0.9
- Commando does not get extra reload bonus with Tommy guns: 100% -> 35%
- Increased M7A3 fire rate 360 -> 400
- Decreased MP5M base reload speed 1.35 > 1.3
- Decreased MP5M max ammo 512 -> 480, magazine 32 -> 30
- Increased KrissM max ammo 350 -> 400
- Medic does not get reload speed bonus by default, unless weapon is marked as special (\*) via *PerkedWeapons*
- Increased LAW rocket blunt damage 200 -> 350
- Lowered M14 headshot multiplier 2.30 -> 2.15. Still 10 headshots to kill 6p HoE FP but requires two headshots
  to kill 5p Husk or Siren. Introduced to compensate tactical reload buff.

#### ScrN Waves
- From now on, *KFMapVote.ini* is distributed with ScrN Balance package (same config as in bundle)
- Short Game is removed. GameLength=0 replaced with ScrN + Event Zeds Long Game.
- Difficulty voting removed from *KFMapVote.ini*. Use `mvote DIFF` to change difficulty.
- GameLength numbers reordered. See *KFMapVote.ini* and *ScrnWaves.ini* for details.
- Added `bRandomSpawnLoc` - spawns zeds randomly on the entire map instead of spawning them close to players.
  Does not work in FTG.
- Added `DOOR_Randomize` - randomly welds, unwelds, respawns or blows doors (thanks to *nmmblez*)
- Fixed bug when DoorControl was incorrectly applied during door opening / closing (thanks to *nmmblez*)
- Fixed bug when sometimes players respawned event if `bRespawnDeadPlayers=false`

##### New Game Modes (From the Contest)
- **Ammo Hunt v3**  - by *nmm*
- **On The Doom Clock**  - by *nmm*
- **Fight the Patriarchs**  - by *nmm*
- **Short & Dramatic**  - by *nmm*
- **On The Clock**  - by *nmm*
- **FTG: On The Clock**  - by *nmm*
- **Late Pure Doom**  - by *nmm*
- **Fight the Doom Bosses**  - by *nmm*
- **Welding Floor**  - by *PooSH*

##### Welding Floor
- Enabled `bRandomSpawnLoc` for all Outbreak waves
- Lowered zed count for Outbreak waves to be 4 zeds per player (32 max)
##### Short & Dramatic
- Disabled bleeding by default. Uncomment the mutator to restore it.

#### Console Commands
- `mvote DIFF OFF|NORMAL|HARD|SUI|SUI+|HOE|HOE+` - Allows players to change game difficulty (map restart needed)
  Also, allows voting for Hardcore Mode (SUI+ and HOE+)
  Voted difficulty has higher priority that Server or KFMapVote settings.

#### ScrnBalance.ini
- `MinVoteDifficulty` - Minimum game difficulty that can be voted via `mvote DIFF`:
  * 0 - DEFAULT. Restores server/config setting.
  * 2 - NORMAL
  * 4 - HARD
  * 5 - SUICIDAL
  * 6 - SUICIDAL+ (Hardcore Mode)
  * 7 - HOE
  * 8 - HOE+  (Hardcore Mode)

#### Other changes
- Fixed bug where `GunSkin` was applied for gun with no skins (thanks to *{ST}Chris*)
- Disabled achievement popup on low texture detail modes
- Adjusted weights in zed spawn volume pickup function

#### ScrN Weapon Pack (by *Scuddles*)
- **AK12**: Slightly tweaked firing animation, added ironsight idle animation.
- **AK74**: Tweaked textures and resized firstperson model, now shares magazine model with AK12. Also tweaked firing
  animations.
- **SPAS12**:
  - Flipped model and tweaked textures.
  - Fixed recoil not applying to semiauto fire mode.
  - New fire animation for semiauto fire and added shell ejection.
  - Increased max ammo: 48 -> 56 (base); 62 -> 72 (lv6)
- **SVD**:
  - Slightly tweaked model, new aimed fire animation, added illuminated reticle
  - Increased recoil
  - Increased max ammo 70 -> 80
- **SVDS**: Added illuminated reticle, increased recoil
- **Protecta**: New firing animations, increased recoil
- **CZ805M**:
  - New firing animations, new select and putdown animations, new ironsight idle animation
  - Added medic dart attachment
  - Magazines are now translucent.
  - Muzzle flash and shell eject tweaked.
  - Increased base damage from 35 -> 41
  - Increased rate of fire from 625rpm -> 666rpm
  - Decreased headshot multiplier from 1.5 -> 1.2
- **VAL**: Texture adjusted
- **VSS**: Texture adjusted, tweaked size of scope eyecup on model, new zoomed fire animation, added illuminated reticle
- **HRL**: Increased blunt rocket damage 200 -> 275
- **RPG**:
  - Replaced with ScrN RPG which features a removable scope (toggle with altfire).
  - Make sure to replace RPG with `ScrnRPG` and `ScrnRPGPickup` in .ini files.
  - Rockets now travel slightly faster but also drop over distance.
  - Increased max ammo 10 -> 12 (base); 16 -> 19 (lv6)
  - Added 20% damage resistance to Patriarch


-------------------------------------------------------------------------------
### v9.60.27
#### ScrN Waves
- Added `MaxZombiesOnce` to ScrnWaveInfo
- Added `DoorControl2` - same behavior as `DoorControl`, but the former is triggered AFTER the Trader Time (or Cooldown)
- `DOOR_WeldRandom` now welds at least to 1% (lower values made door bugged) and cannot lower existing weld strength.
- Trader is not changed anymore when `bOpenTrader=false`. Set `bTraderArrow=false` to avoid revealing trader too early.

### v9.60.26
#### ScrN Waves
- `bRespawnDeadPlayers` - allows controlling if dead players are allowed to respawn at the beginning of the wave
- `XP_Bonus` and `XP_BonusAlive` - Allows granting XP bonus for completing the wave (and not dying respectively)
    Overrides `ScrnBalance.EndGameStatBonus`


### v9.60.25
- Fixed slide lock for all pistols, including dualies and KF2 Medic Pistol

### v9.60.23
- Fixed netcode of slide lock on empty magazine for HC and MK23

### v9.60.22
- Hotfix for animations

### v9.60.20
- New animation package: **ScrnAnims.ukx**
- Added bolt behavior for AA12, MKb42 and RS Tommy Gun
- Added tactical reload for dual pistols (by *Scuddles*)
- Added new animation for MP5M tactical reload (by *Scuddles*)
- Added new animation for Boomstick single shell reload (by *Scuddles*)


### v9.60.19
- Fixed bug where Stinky Clot was moving to a wrong trader if in the previous wave doors were closed


### v9.60.18
#### ScrN Waves
- Added random waves, e.g., `Waves=Wave2a|Wave2b|Wave2c`
- Added `Mutators` to ScrnGameLength.

#### Mutators
From now on, in most cases there is no need to specify any mutators in server command line or KFMapVote.ini.
Any ScrN game type automatically loads ScrnBalance mutator, which in turn loads ServerPerksMut.
Then ScrnBalance loads all mutators listed in `AutoLoadMutators` array (ScrnBalance.ini).
And finally `ScrnGameLength.Mutators` are loaded.

###### Mutator load order (if ScrnBalance is NOT in the server command line):
1. Mutators from the command line (KFMapVote.ini)
2. ServerPerks (`ScrnBalance.ServerPerksPkgName`, default `ScrnSP.ServerPerksMutSE`)
3. `ScrnBalance.AutoLoadMutators`
4. ScrnBalance itself
5. `ScrnGameLength.Mutators`

###### Mutator load order (if ScrnBalance is in the server command line):
1. Mutators from the command line prior to ScrnBalance.
2. ServerPerks (`ScrnBalance.ServerPerksPkgName`, default `ScrnSP.ServerPerksMutSE`)
3. `ScrnBalance.AutoLoadMutators`
4. ScrnBalance itself
5. Mutators from the command line after ScrnBalance
6. `ScrnGameLength.Mutators`


#### Weapon Fixes and QoL Improvements (by Scuddles)
- Attempted fix for AA12 tactical reload faked shell display for golden skins
- Added faked gas can to Chainsaw reload to highlight gas explosion mechanic
- Added tactical reload to 9mm, Handcannon and MK23
- Visual improvements to handcannon's slide, and 9mm and handcannon's hammer
- Bullet in old mag for FN FAL tactical reload now visible
- New flare explosion effect
- New flare cloud effect
- Added headshot damage display checkbox to weapon buy info panel
- Fixed M4 M203's sight fix to work at all angles
- Updated M4 and M4 M203 fire animation rate to match actual firerates
- Added tactical reload to MAC10, Thompson Drum SMG and MP5M Medic Gun
- Added 3d scope sensitivity adjust slider in ScrN User Settings tab (Adjustable from 1 to 75, default KF value is 24)
- Tweaked Seeker Six SE rocket to seek target's head instead of body
- SCAR MK17's charging handle locks back on last round fired
- Winchester and Trenchgun firing animation doesn't show another round getting chambered when firing last round


### v9.60.17
#### ScrN Waves
- `bTraderArrow` - allows hiding trader arrow. This property is ignored during the Trader Time
  if trader doors are open.
- `Header` - text to replace "NEXT WAVE INBOUND" message. If empty, then default text is used.


### v9.60.16
- Medic nade is now properly falling on ground instead of getting stuck inside a floor
- Fixed rare bug where medic nades could get though walls


### v9.60.15
- Players will be blamed for buying an RPG-7 before the Boss wave. However, it is fine
  to buy an RPG earlier (e.g., before wave 10) and keep it for Boss.
- Fixed "teleporting" effect of medic nade due to lag
- Fixed M32 thirdperson reload always playing one more time than it should  (by *Scuddles*)
- Fixed winchester select animation  (by *Scuddles*)
- Fixed idle delay after finishing full reload for single shell reload weapons  (by *Scuddles*)
- Tweaked M79M projectile initial rotation  (by *Scuddles*)

### v9.60.14
- Fixed (again) medic nade replication
- Fixed AA12 reloading animation (by *Duckbuster*)
- `MyFakedShotgunShell` renamed to `ScrnFakedShell` and extends from `ScrnFakedProjectile`.
  From now on, the latter is the base class for all faked projectiles that are in use in weapon animations.

### v9.60.13
- Fixed bug in M79M reloading animation

### v9.60.12
- Gray and Gold perk icons made prettier
- **KF-NightAngkor-SE** added to map achievements

### v9.60.11
- Fixed (I hope) medic nade replication issues
- Medic nade healing now lasts 10 seconds (up from 8)
- Medic nade also bounces when shooting at your feet. It is a feature not a bug :)

### v9.60.10
- Reworked **Medic nades**. They now do damage on impact and less bounce.
- Net code of medic nades should be more reliable (unless introduced new bugs)
- Lowered cost of medic nades to $30 (down from $40)
- Set base price of **Medic Grenade Launcher** to $500. Removed perk discount.
- Fixed Tesla Bomber achievement
- Fixed bug where player start event is not triggered when spawning at trader.
  For example, this event is triggering chopper on West London to fly away.

### v9.60.9
- Fixed DoorControl (again)

### v9.60.8
- Broke DoorControl

### v9.60.7
- DoorControl: Doors are closed before being welded (thanks to *nmmblez*)
- Fixed bug when Husk Gun charge was not applied on point-blank shots (thanks to *Scuddles*)
- Reduced grenade trails (by *Scuddles*)
- M32 thirdperson reload animation fix (by *Scuddles*)
- AA-12 tactical reload faked shell fix (by *Scuddles*)
- Fixed Benelli thirdperson weapon model (by *Scuddles*)
- Added LAW rocket lights (by *Scuddles*)
- Reload animation sync for single shell loading weapons like winchester, shotgun, trenchgun etc. (by *Scuddles*)


### v9.60.6
- Berserker gained additional 20% damage reduction from Doom Monsters (60% in total)
- Fixed bug where headshots from MAC10, TommyGunInc and Trenchgun didn't use ScrN Burn Mechanism
- When picking up small vests (e.g. armor on KF-TheGreatPyramid-Arena) the armor type doesn't change to
  Combat Armor anymore.

### v9.60.5
#### ScrN Waves
- `bStartAtTrader` - new or dead players spawn next to the Trader
- `DoorControl` - respawn, blow up or weld doors at the beginning of the wave
- Fixed Boss healing level scaling respective to health

#### FTG
- Stinky Clot spawns on wave 1 if trader doors were open
- Stinky Clot continues to carry the Guardian between waves if the trader doors stay closed

#### Other changes
- Fixed bug where HuskGun consumed double ammo per charged shot
- Cannot buy ammo in trader for weapons with negative ammo cost


### v9.60.4
- `FirstStatBonusMult` now is used for winning custom maps too

### v9.60.3
- Added tactical reload for AA12 (by *Scuddles*)
- Enhanced M32 reload (by *Scuddles*)
- Fixed tactical reload for SCAR (by *Scuddles*)
- Adjusted iron sights for MP5, M4, M4-203 and M4-203M (by *Scuddles*)
- Buffed Combat Shotgun's penetration vs big zeds
- Lowered spread Combat Shotgun's spread while aiming down the sights
- Raised spread of Nailgun multi fire (1250 -> 1750)
- Added Nailgun single fire sound (thanks to *Scuddles* for idea)
- Fixed issue in Support Spec. perk that prevented penetration damage reduction lowering below x0.60
- Significantly nerfed nail over penetration (damage reduction: x0.75 -> x0.33)
- Nails cannot penetrate big or medium zeds anymore (Bloat, Husk, SC, FP, etc.)

### v9.60.2
- Fixed bug when `ZombieVolume.bVolumeIsEnabled` flag was ignored when choosing spawn volume.
- Lowered falling damage. Traded realism for fun.

### v9.60.1
- Fixed bug when respawned players ignored `bAntiBlocker` setting.
- `bAntiBlocker` is set to true by default
- Fixed LAR fire animation rate to properly apply perk bonus
- Fixed yet another Tripwire's bug in end-wave dosh calculation

### v9.60.0
#### Version Numbering Change
Version numbering changed to **MAJOR.MINOR.PATCH**. No more special BETA releases.
From now on every version is a potential release candidate.

#### Burning Mechanism
- Now flares do not explode. They burn the victim from inside.
- Since regular fire damage burn zeds from outside, both can co-exist, dealing two damages at once:
  burn and flare (iDoT)
- Flares cannot crispify zeds.
- Headshots with flares do increased burn damage (iDoT) comparing to body shots.
- *Flare Revolvers* do x1.5 headshot burn damage; *Protecta* - x3.0.
- Husk Gun's headshot multiplier raised to x2.4 (up from x2.2)
- Optimized and enhanced Flare Cloud replication.
- Added `ScrnDamTypeFlare` with options to adjust flare burning behavior.

#### Gunslinger
- Added *LAR* and *Flare Revolvers* to Gunslinger's arsenal. They are cross-perk weapons now.
- LAR and Flare Revolvers kills added to Gunslinger perk progress, but only when played as Gunslinger.
- LAR headshots are still added to Sharpshooter progress no matter of perk played.
- Flare Revolver fire damage is still added to Firebug progress no matter of perk played.

#### Other changes
- `mvote FAKEDCOUNT` and `mvote FAKEDHEALTH` - allow voting to change respectively zed count and zed health.
- `mvote FAKED` is still valid and change both count and health at once.
- Fixed bug when sometimes players got negative dosh at the end of a wave
- Fixed bug in `KillRemainingZeds()` that sometimes didn't kill the remaining zeds.
- Completely removed `CustomEvents`
- `bAntiBlocker` can be configured for `ScrnGameType` (moved upper in class tree from `TscGame`)
- AntiBlocker is automatically disabled on test maps (e.g., *ScrnTestGrounds*)


### v9.56
- Fixed medic nades (i.e., restored frag nades)
- Fixed keeping the melee weapon on double-clicking QuickMelee button

### v9.55
- Reverted changes in v9.54 regarding QuickMelee bug fix (that fix brought more bugs that fixes)
- Yet another attempt to fix QuickMelee bug when the player ends up with empty hands.
  If that doesn't help, then try `FixQuickMelee` console command.

### v9.54
- Another attempt to fix QuickMelee bug when the player ends up with empty hands
- Modified ScrnWaves.ini to match *ScrN Brutal KF Bundle*
- Fixed `ColoredServerName`
- `ColorTags` are not configurable anymore (due to various issues)
- Added more color tags. The complete list of color tags:
  * `^p` - *(player specific)* Perk Color
  * `^t` - *(player specific)* Team Color
  * `^0` - Black
  * `^1` - Red
  * `^2` - Green
  * `^3` - Yellow
  * `^4` - Blue
  * `^5` - Cyan
  * `^6` - Pink
  * `^7` - White
  * `^8` - Orange
  * `^9` - Gray
  * `^w$` - White
  * `^r$` - Pure Red
  * `^g$` - Pure Green (Lime)
  * `^b$` - Pure Blue
  * `^y$` - Yellow
  * `^c$` - Cyan
  * `^o$` - Orange
  * `^u$` - Purple
  * `^s$` - Deep Sky Blue
  * `^n`  - Brown
  * `^W$` - Gray
  * `^R$` - Dark Red
  * `^G$` - Natural Green
  * `^B$` - Dark Blue
  * `^Y$` - Gold Yellow
  * `^C$` - Dark Cyan (Turquoise)
  * `^O$` - Dark Orange
  * `^U$` - Dark Purple
  * `^S$` - Royal Sky Blue
  * `^N$` - Dark Brown


### v9.53
#### Code Remarks
v9.53 code is the same as v9.52's. The only change it does is **change whitespace from tabs to 4 spaces** to apply
the same standard for the entire source code.

Those who forked the *KF-ScrnBalance* repository should do the following procedure to avoid merge conflicts:
1. Merge `v9.52` **tag** into your branch.
2. Replace tabs with 4 spaces within your code ("\t" -> "    ") and commit changes to your branch.
3. Merge `v9.53` **tag** into your branch. Resolve any conflicts.
4. Merge `master` into your branch.


### v9.52
#### ScrN Waves
###### Ammo Grab Waves
Set `EndRule=RULE_GrabAmmo` to force players looking for ammo boxes. Wave ends when the given amount of ammo boxes are
picked up. Useful to make players replenish their ammo pools without opening the trader.

###### Dosh Grab Waves
Dead zeds drop dosh on the ground instead of adding it to player/team wallet. It is like using _ScrnDoshGrab_ mutator
but those could be only a few waves instead of the entire game. Wave ends when the given amount of dosh is collected.
There are two wave kinds: `RULE_DoshGrab` and `RULE_GrabDoshZed`. The difference between those two is that in
`RULE_GrabDoshZed` **zeds can pick dosh** to heal or boost their health (up to x5 of the original hp).

Dosh drop kind depends from the kill shot:
- Dosh is tossed toward player if killed by a headshot;
- Dosh is thrown up if killed by fire, explosive and other damages that can't do headshots;
- Dosh is "farted out" if killed by bodyshot.

###### Squad Scale
Added "Scale squad members by player count" feature (*Squad Scale*) to squad definition in `ScrnWaveInfo`.
For example, `SpecialSquads=~6: BOSS` means an extra boss will be added for each 6 players starting with 7th (6+1);
health of the **entire squad** will be matched to player count instead of every zed:
* 1 player : 1 boss, 1p hp
* 2 players: 1 boss, 2p hp
* 6 players: 1 boss, 6p hp
* 7 players: 2 bosses, 3.5p hp each
* 8 players: 2 bosses, 4p hp each
* 9 players: 2 bosses, 4.5p hp each
* 10 players: 2 bosses, 5p hp each
* 11 players: 2 bosses, 5.5p hp each
* 12 players: 2 bosses, 6p hp each
* 13 players: 3 bosses, 4.33p hp each (13/3)
* 18 players: 3 bosses, 6p hp each
* 20 players: 4 bosses, 3.33p hp each

*Squad Scale* can be applied for regular squads as well, e.g. `Squad=~3: SC` spawns an extra Scrake
per each 3 players in the team (every Scrake in this case won't have more than 3p health).

###### Other changes
- `BountyScale` now is applied on both player reward and team budget (previously it was applied only on team budget)
- `BountyScale`, in addition, can be set for each wave (overrides game's value)
- Inverted `SpawnRateMod`setting to avoid further confusion. From now on `SpawnRateMod=2.0` means twice *faster* spawns
  while `SpawnRateMod=0.5` - twice *slower*. **Make sure to update ScrnWaves.ini !**
- `bRandomSquads` and `bRandomSpecialSquads` - allows turning off a random component for more predictable game.
- `GameTitle` - games (ScrnGameLength) can have a name now (shown on the scoreboard)

#### TSC: Team Survival Competition
- Killing members of the other team gives $+100
- Killing teammates charges $-100

#### FTG: Follow The Guardian
- The Stinky Clot got raped by a Shiver and now gained an ability to teleport... when stuck

#### Mystery Game
- Wave2, Earn Dosh, split on three: Earn Dosh, Grab Dosh and Zed Grab Dosh.
- Added Ammo Grab wave between Wave 9 and Wave 10.
- Now there are 13 waves in the Mystery Game.
- Balance improvements.

#### (**New**) Half-Long Game
Five-wave game containing 4 latest waves from the Long game and new brand-new introduction wave (Dosh Grab)

#### (**New**) Small Big Zeds
Six-wave game where Big zeds (Husk+) have less health, but there are bigger in numbers. For example, in 6-player
Small Big Zeds game there will be 3 Scrake spawning (each having 2p health) instead of one with 6p health, unlike
in regular game.

#### Bug Fixes
- Yet another attempt to fix client crash while opening ScrN Features tab...
- Fixed Dual Flare Revolver ammo price
- Fixed an issue when Machete was falling though some objects
- Fixed bonus ammo calculation bug when sometimes bonus ammo was not seen on the client side
- Player death penalty now is calculated proportionally to team budget, not player dosh

#### Gameplay changes
- Sirens can't be nailed anymore
- Lowered Chainsaw fuel consumption rate while in idle
- Chainsaw fuel capacity slightly raised to 105 to add some reserve for idle consumption
- Raised Chainsaw Alt Fire Headshot multiplier to x1.20 (up from x1.05).
  Now 6p HoE Scrake can be killed with 4 head-hits instead of 5.

#### Configuration
###### ScrnBalance.ini
- `ColoredServerName` - color server name with ColorTags
- `ColorTags` made configurable but NOT replicated
- Removed Vanilla Tourney option `?tourney=2`
- `bWeaponFix` and `bSpawnBalance`are removed (were considered deprecated since v9.50)
- `bGunslinger` is removed (forced to true)
- `CustomEvents` are marked *deprecated* (will be deleted in future versions)

###### KillingFloor.ini
- `FakedPlayers` moved from ScrnBalance to ScrnGameType (configurable in KillingFloor.ini)
- `FakedAlivePlayers` - adjust minimum zed health

#### Console Commands
- `mvote FAKEDPLAYERS X` - vote to instantly change `FakedPlayers` and `FakedAlivePlayers`
- **CHEAT** `DebugZedHealth TRUE` - shows zed body & head healths (only in Solo Mode!)

#### Code Remarks
- Reward for killing zed now is calculated from `Monster.ScoringValue` instead of `Monster.default.ScoringValue`.
  This allows customizing rewards per individual zed instead of zed type.
- Added `ScrnGameType.bZedTimeEnabled` flag. This allows custom mutators to disable Zed Time in the game.
- Class `Doom3MonstersCollection` is deleted. `CustomEvents` are no longer supported.
  Migrate to ScrnWaves instead.

-------------------------------------------------------------------------------
### v9.51
- Fixed bug when broken Zombie Volumes on a map dropped down zed spawn rate.
- Fixed Berserker damage bonus vs humans (TSC)
- Fixed Support's requirement saying welding points instead of damage

-------------------------------------------------------------------------------
### v9.50
#### Normal Difficulty
Normal difficulty made newcomers-friendly. Now it is much easier to allow new players to start their
first games without instantly getting wiped again and again until rage-quit. From now on Normal
difficulty is considered easy, Hard - Normal, Suicidal - Hard, Hell on Earth - the game it meant to
be played. Experienced players shouldn't be playing on Normal difficulty.

##### Changes to Normal Difficulty only:
- Much slower spawn rate (use `MVOTE BORING` if it is too slow).
- Zeds spawn more randomly on the map, not only close to players.
- Players can't be grabbed by Clots no matter of the chosen perk.
- Low-level perks made stronger by applying passive skills and 30% base bonus.

#### Money Balance
-   Fixed dual pistol ammo cost.
-   Lowering weapon discount at Lv6 to 60% (down from 70%)
-   Raised weapon discount at Lv0 to 30% (up from 10%).
-   Each perk level gives +5% weapon discount (down from 10% <= lv6, same form lv7+)

#### Perk and Weapon Balance
-   Reworked DLC Locks
-   Demolitions spawns with M4-203 by default no matter of difficulty
-   Lv0 perks made stronger; per-level bonuses lowered to match the same values at Lv6.
-   Common perk bonus formula changed to `(30% + level * 5%)`, was `(level * 10%)` for perk levels 0..6
    and `(60% + (level-6) * 5%)` for levels 7+.
-   Perks gained passive abilities (skills) which doesn't change though perk levels.
-   Removed welding requirement for Support Spec.
-   Flamethrower weight lowered to 9 (down from 10) to allow carrying together with Tommy Gun Inc.
-   Flares make zeds burn longer: more flares - longer burn.
-   HMG perk can earn Shotgun-related Teamwork achievements, such as "When Size Matters".

#### Follow The Guardian
-   Fixed bug when MaxZombiesOnce couldn't be set below 48 in FTG.
-   Default OvertimeTeamMoneyPenalty set to 0 (no penalty)
-   All players now see the Trader Arrow during the Trader Time

#### Heavy MachineGunner v4.00
-   Perk bonuses adjusted to ScrN Balance v9.50 rules
-   Recoil bonus raised to 75% (up from 50%)
-   Pat Chaingun price lowered to $8000 (down from 10999)
-   PKM price lowered to $4000 (down from 6000)
-   PKM ammo price raised to $50 (up from 30)
-   M249 price lowered to $5000 (down from 7700)
-   RPK47 price lowered to $2000 (down from 2500)

#### Horzine Technician v4.00
-   Perk bonuses adjusted to ScrN Balance v9.50 rules
-   Scream damage of Cryo Sirens lowered to 6 per wave (down from 7, originally - 8) to compensate
    bugfixed pull effect.

#### Configuration
-   `bCloserZedSpawns` setting removed. Now the game automatically adjusts zed spawns locations.
-   `bWeaponFix` and `bSpawnBalance` deprecated and are always considered true.

-------------------------------------------------------------------------------
### v9.48
#### Follow The Guardian
-   Stinky Clot learned to take Base Guarding out from glitch spots
-   Added more variations to Stinky paths
-   Team kill counter raised to 25s when nobody at base
-   Stinky Clot moves slower when nobody at base
-   MVOTE BORING counter is reset when Stinky Clot picks up a Guardian

-------------------------------------------------------------------------------
### v9.47
- [FTG] Zeds spawns made slower when the Guardian is carried
- When buying ammo pickup's BuyClipSize is used instead of MagCapacity
- HMG and HTec perks need to be updated to v3.50 to fix BuyClipSize

-------------------------------------------------------------------------------
### v9.45
- [FTG] Fixed bug when two special squads were spawned


-------------------------------------------------------------------------------
### v9.44
- Fixed bugs in zed spawning system
 (for example, it was the reason why some zeds didn't spawned on Hell Ride)

#### Configuration (_ScrnBalance.ini_):
- `MinZedSpawnPeriod` - added to prevent insane spawn rates when bSpawnRateFix=True


-------------------------------------------------------------------------------
### v9.43
#### TSC:
- bScrnWaves=True hard-coded in TSC
- Fixed Overtime and Sudden Death waves
- New server line option: NWaves to force number of regular wave in TSC game
  example: ?NWaves=7?OTWaves=2?SDWaves=1

#### Configuration (_ScrnBalance.ini_):
- bSpawnRateFix - fixes bug from the very first day of KF that was limiting
  zed spawn rate to 1 squad per second (was controlled by bBeta in v9.40)

#### Configuration (_ScrnWaves.ini_):
- Fixed bug when SpawnRateMod wasn't applied correctly.
- PerPlayerMult is now applied on RULE_KillEmAll and RULE_SpawnEmAll waves too.
  If PerPlayerMult=0, then default zed count scaling is used.
- Added MaxCounter to prevent too long waves.
- Added SpecialSquadHealthMod (default=1.0) to modify health of special zeds (bosses).


-------------------------------------------------------------------------------
### v9.42
- Fixed wave end when bScrnWaves=False.

-------------------------------------------------------------------------------
### v9.41
- Fixed bug when disabled zeds didn't show in voting (mvote ZED)

-------------------------------------------------------------------------------
### v9.40
- ScrnVotingHandlerMut updated to version 4.05
- Custom Game Length (ScrnWaves.ini)
- Completely rewrote zed spawning mechanism (ZombieVolume.SpawnInHere())
- Fixed Boss death in non-boss wave
- Fixed "Accessed None 'M'" warning in KillZeds
- [FTG]: StinkyClot is glowing when invulnerable
- [BETA]: Fixed bug from the very first day of KF that was limiting zed spawn
  rate to 1 squad per second. But I'm not sure that this should be fixed...
- Made just-spawned players less attracting to zeds:
-- zeds ignore players who spawned less than 10 seconds ago
-- zeds are less-likely to choose for their target a player who spawned 10-30s ago

#### Console Commands:
- `MVOTE MAP RESTART`
- `MVOTE ZED <alias> ON|OFF` - turns on or off zeds defined in ScrnZedInfo (ScrnWaves.ini)
- `MUTATE ZED LIST` - prints all zed aliases defined in ScrnWaves.ini
##### ADMIN COMMANDS:
-   `MUTATE ZED <alias>` - prints all zed infos assigned to the given alias from ScrnWaves.ini
-   `MUTATE ZED <alias> <index> ON|OFF` - turns on off any zed defined by alias and index.
    - use `MUTATE ZED LIST` to get aliases.
    - Use `MUTATE ZED <alias>` to get zed indexes.
-   `MUTATE ZED <alias> <index> PCT <chance>` - alters spawn chance of given zed:
    Enabling/Disabling zeds REQUIRE MAP RESTART!

#### CONFIG VARIABLES (ScrnBalance.ini):
- `bScrnWaves` - use ScrnWaves.ini instead of KFMonstersCollection.
#### NEW CONFIG FILE - ***ScrnWaves.ini***.
Configures games/waves/squads/zeds. A replacement for Zed Manager.


-------------------------------------------------------------------------------
### v9.33
- HoE map achievements are given for FTG mode too (even without Doom3 mode)
- Sui map achievements are given in Turbo mode too
- Changed some achievement requirements
- ScrnGameRules.MapAliases made configurable (ScrnBalance.ini).
  Now server admins can link custom maps to existing map achievements.


-------------------------------------------------------------------------------
### v9.32
- Yet another attempt to fix crash when opening ScrN Features tab

-------------------------------------------------------------------------------
### v9.31
- Fixed a few warnings in client log
- Another attempt to fix crash when opening ScrN Features tab
- Admins can do MVOTE BORING even if it is disabled on the server

#### Weapon Balance
- Bullpup's damage raised to 28 (up from 26).
- Added 1 bullet over-penetration to Bullpup vs small zeds.

-------------------------------------------------------------------------------
### v9.30
- TSC and ScrnBonusGames packages incorporated into ScrnBalanceSrv
- Fixed bug in quick melee
- Optimized perk change / level up procedure
- Fixed bug when dead player sometimes dropped one pistol instead of two
- MACHETE-SPRINTING IS TEMPORARY DISABLED due to network replication.
- [OBJ] Fixed Trader Time detection in Objective Mode
- Fixed "TeamSay" in regular modes (%H,%W etc.)
- Fixed "mvote BORING" was kept between waves
- Fixed perk switching bug while dead
- Player health limited to 250hp (in case of overcharge)

#### HUMAN DAMAGE (HDMG):
- Perk damage bonus now is applied on HDMG too
- Restored Medic's armor bonus against HDMG damage to compensate perk damage bonus.
- Medic's armor bonus capped at 40% against HDMG (standard - 60%).
- Berserker's HDMG bonus capped at 50% (down from 100%)
- Sharpshooter's headshot HDMG bonus capped at 2.0 (down from 2.4)
- Players now have 30% HDMG resistance from any explosives but hand nades
- Explosion radius for dealing Human Damage is limited to 4m.
- Players now have 20% HDMG resistance from Buzzsaw blades
- HDMG minimal headshot multiplier set to 2.0 for all weapons but shotguns.
  For example,
  Crossbow does 30 base damage, 60 off-perk headshot damage and 120 perked damage.
  Previosuly Crossbow did 90 hs dmg no matter of perk.
- Damage amount after applying HDMG now is rounded instead of floored
  (e.g. 6.3 -> 6, 6.7 -> 7)

#### TSC:
- Base Guardian can be stunned by hand-nading or dealing 700 cumulative damage points
- Cumulative stun damage points fade out at rate 50dmg/s
- Stunned Guardian does not protect from FF neither it does damage to enemy players
- Base Guardian automatically wakes up from stun after 25 seconds

#### FTG:
- Fixeg bug when players joined from spectators didn't get a proper team

#### USER.INI:
- bTSCAutoDetectKeys (true by default): automatically enables bTSCAdvancedKeyBindings
  if there is a key bound to "SetupBase" command.


-------------------------------------------------------------------------------
### v9.25
- Fixed bTSCAdvancedKeyBindings behavior for ThrowWeapon
- Wave size calculation moved from ScrnGameRules to ScrnGameType

-------------------------------------------------------------------------------
### v9.22
- "Switch perked weapons first" now respects multi-perked weapons.
- Spectators put on the scoreboard.
- Fixed "Join" button was not available in some cases.
- Removed "Switch Team" button for non-team games (FTG)
- Yet another attempt to fix crash on ScrN Features tab.
- Fixed "promoted" sound
#### BONUS GAMES:
- New Game Mode: FTG-SC - Follow The Guardian - Survival Competition (FTG+TSC combo)
- [FTG] Stinky Clot now can be killed when zed count < 10
- [FTG] Stinky Clot always can be killed in boss wave

-------------------------------------------------------------------------------
### v9.21
####CONFIG VARIABLES (ScrnBalance.ini):
- HardcoreGames - allows configuring HL for each game mode (TSC, FTG etc.)

-------------------------------------------------------------------------------
### v9.20
#### NEW PERK: COMBAT MEDIC
- Combat Medic gains damage bonus with Medic Guns and faster attacks with light
  melee weapons (knife, machete, katana - up to 75% faster).
- Combat Medic retains full movement speed during ZED Time
- Both medic perks share the same xp which can be gained by healing people or killing
  zeds with medic guns.
- Medics gain 20xp per each 1000 damage dealt with medic guns.
- Medics gain xp immediately after reaching 1000 damage, not at the end of the wave.
- No more Medic XP penalty for teammates' deaths.
- Field Medic's perk requiremends adjusted to be exactly 1/50 or standard damage req.
- ReqBalanceMode marked as deprecated and is not in use anymore.
- Short Reloads for MP7M, KrissM and M7A3M.
- Removed Medic's reload speed bonus for MP7M and MP5M.
- Base reload speed for MP7M made 40% faster, MP5M - 50% faster.

#### Weapon Balance
- SE version of MKb42 included (made by Duckbuster)
- Fixed exploit when the same Buzzsaw Blade could be picked up multiple times.
- Fixed point-blank hit detection for Crossbow, M99 and VSS (last requires latest version of ScrnWeaponPack)

#### MULTI-PERK WEAPON SUPPORT:
- Weapon is considered "perked" if it is added to PerkedWeapons with W or $ switch;
- bBuyPerkedWeaponsOnly and bPickPerkedWeaponsOnly now properly handle multi-perked weapons;
- Weapon's icon in the trader menu automatically changes to the current perk, if weapon
  is multi-perked and it is assigned to the current perk.
- Field Medic and Combat Medic share the same inventory, i.e. all medic weapons
  are treated multi-perked by default.

#### FEATURES AND IMPROVEMENTS:
- Level 0-5 perks now have gray icons (instead of red)
- Game name placed on a scoreboard
- Max name length is limited to default 20 characters but now excluding color tags
- MVOTE FF - Friendly Fire voting. Disabled by default.
- Admins now allowed to MVOTE SPEC | MVOTE KICK even if such option is disabled on the server.
- Death- and blame-counters do not reset anymore when switching to spectator mode.
- Removed blame-counter's cap (now player can be blamed more than 5 times)
- Changed HUD settings from globalconfig to config, i.e. each players can use individual
  HUD configuration settings in each game type.
- Each kill adds +3s to Machete Reset Time
- Allowed dead players to spectate zeds (not available in Tourney Mode)
- Fixed bug when weapon icon was drawn while spectating zeds

#### BUGFIXES:
- Fixed some Tripwire's nonsense in Boss's spawn code which sometimes prevented HardPat
  from spawing.
- Fixed duplicates in favorite weapon list
- Added log debug output to help identify crash problem on opening ScrN Settings menu.
  When your game crashes on ScrN Features tab please submit client's KillingFloor.log.
- Fixed bServerInfoVeterancy for ServerPerks v7.50
- Fixed a few minor memory leaks.
- [TSC] Restored door respawn in TSC
- [TSC] Fixed crash on map end (error related to RespawnDoors)
- [Story Game] Fixed Remaining Time in Trader Menu
- fixed Binary Search algorithm
- Fixed pickup message for Crossbow arrow [thanks to NikC-]
- Life span of Crossbow arrows raised to 60s (up from 10)
- Fixed (maybe) weird hand nade behavior after picking up an ammo box [NikC-]
- Fixed Husk Gun's charge update after getting hit by an enemy
- Fixed M99 Bullet's sticking to doors / movers

#### ScrnSP:
- SP WebAdmin is disabled by default (it doesn't work well with ScrnBalance anyway)
- Removed duplicate info from Server Browser

#### Console Commands:
- "SetName #" sets your PlayerName from user.ini ("#" in this case is a literal not a placeholder)
  * if bForceSteamNames=false, allows setting any custom player name;
  * if bForceSteamNames=true, allows only applying different color.
  For example, if player's Steam name is "FreshMeat", then he can execute:
      SetName ^1Fresh^2Meat
  without violating bForceSteamNames.
- SoundVolume, MusicVolume: get/set sound/music volume
- Fixed TogglePathToTrader not working on server
- [TSC] TSC TogglePathToTrader switches between PathToTrader|PathToBase|Off

#### CONFIG VARIABLES (ScrnBalance.ini):
- bForceSteamNames - controls custom player names via SetName command
- MinVoteFF, MaxVoteFF (see MVOTE FF)
- bLogObjectsAtMapStart, bLogObjectsAtMapEnd - prints all loaded objects into log file.
  Useful to find memory leaks.
- [ScrnGameRules] Fixed bug in config read
- [ScrnGameRules] bBroadcastHL - allows to disable broadcasts of Hardcore Level changes

-------------------------------------------------------------------------------
### v9.15
- Removed player auto-joining the game and bypassing team lock
- Fixed player inventory in Trader Menu, when all guns are sold
- Removed player damage from spectators,
  i.e. Shoot missile -> Spectate -> Missile damages teammate(-s)
- Removed damage from non-zombie KF damage dealt by unknown sources,
  e.g. Shoot missile -> Disconnect -> Missile damages teammate(-s).
  Environmental damage still works, unless it is a child of KFWeaponDamageType.


-------------------------------------------------------------------------------
### v9.14
- Fixed weird rotation of stunned zeds
- Fixed MVOTE INVITE <player>
- Max ammo is now recalculating at perk change
- Boosted M99 death velocity
- Now game doesn't end when all players left the lobby.


-------------------------------------------------------------------------------
### v9.11
- MVOTE LOCKTEAM / UNLOCKTEAM / INVITE <player> - moved from TSC into regular game
- New config options: LockTeamMinWave and LockTeamAutoWave. Former sets when players
  can start to MVOTE LOCKTEAM (prevent newcomers to join the game unless invited).
  Latter can do it automatically (by default newcomers can't join the game starting from wave 9/10)
- Machete-sprinting disabled in Tourney Mode.
- Machete-sprint's cooldown raised to 5 seconds (up from 3s)
- Fixed bug when 1st-person-spectators didn't see ammo count in magazine
- Team number is saved on disconnect/crash (for TSC)
#### Weapon Balance
- Stunned zeds do not rotate anymore
- [BETA] Every perk has at least 1 ZED time extension


-------------------------------------------------------------------------------
### v9.10
- MACHETE-SPRINTING. Dropping/Picking up machete while running boosts player's
  movement speed and machete's damage.
- 3 new Machete-related achievements
- Added 5 Community-made Maps:
    - The Great Pyramid - Arena
    - Pandora's Box (Janitor's fix)
    - Scrap Heap (by arramus)
    - Train (Janitor's fix)
    - Wicked City (by =Z.E.D= dextronaut
- Winning KF-HellFreezesOver1-2 unlocks KF-Hell achievements
- [BETA] Players can push Crawlers.
- MapInfo moved into separate config: ScrnMapInfo.ini. Now you can use commands
  such as "MUTATE MAPZEDS 64" without worrying about messing up ScrnBalance.ini
- MUTATE MAPZEDS automatically forces new max-zeds-at-once value.
  No need to enter two commands anymore (MUTATE FORCEZEDS command removed).
- Fixed QuickMelee bug when it hid current weapon
- Added TestQuickMelee console command to print weapon state into both console and log
- Fixed reload animation bug after weapon's bring up, i.e. when weapon was
  reloading without animation play.
- Fixed FreeCamera exploit (thanks to prototype22)
- MUTATE LOCKPERK / UNLOCKPERK allows perk now allow passing perk indexes instead of names,
  e.g. MUTATE LOCKPERK 1 locks first perk in the perk list (usually Medic).
- Fixed level earn message popping up after locking perk.
- Admins can't use locked perks anymore.
- New Ammo Box spawn rules:
  Fixed "Trolling" ammo boxes.
  Ammo box count during the wave on Sui/HoE raised up to 33%.
  During the trader time and when last 10-20 zeds left, ammo box count drops
  down to 10% on all difficulties.
  Ammo box can't disappear when seen by player.
  When ammo box is picked up, another one spawns somewhere on the map in 5..30s
  (cooldown depends from player count)
  MUTATE DEBUGPICKUPS shows information about currently spawned ammo boxes
- [ScrnSP] - fixed downloading "None.txt" from FTP on map change.

#### Console Commands:
- `MUTATE HELP` - prints all MUTATE commands supported by ScrN Balance
- `MUTATE MAPZEDS` - changed behavior. When entered command without value, it just prints current
    value. Entering value (e.g. MUTATE MAPZEDS 64) sets value, stores it in ScrnMapInfo.ini
    and applies it on-the-fly.
- `TestQuickMelee` - prints weapon states for debug purposes (in case QuickMelee bugs out again).

#### CONFIG VARIABLES (ScrnBalance.ini):
`bRespawnDoors` - controls door respawning at the end of the wave. By default it
    is false, i.e. if door breaks, then it's gone forever.

-------------------------------------------------------------------------------
### v9.02
- Fixed money drop exploit
- Fixed minor issues with QuickMelee
- Adjusted ScrnHUD.PlayerInfoVersionNumber.
    - 70: Classic Bars (vanilla)
    - 80: Modern Bars (scalabale over distance, green bar for 100% HP), avatar during trader time only
    - 81: Modern Bars with avatars
    - 83: Modern Bars with avatars and weapon info
    - 90: Cool Bars
- GUI still supports only 3 settings: Classic bars(70), Modern Bars (83) and Cool Bars (90).
  Other values can be set via config or "PlayerInfoVersion" console command.
- All bars now support Chat Icon.


-------------------------------------------------------------------------------
### v9.01
- Blood-colored perk icons for level 31+ (RED/GOLD/GREEN/BLUE/PURPLE/ORANGE/BLOOD)
- New HUD, aka "Cool HUD"
- New Player Health Bars, aka "Cool Bars"
- User-defined music (check MyMusic in User.ini and PlayMyMusic command)
- If player has more health than max (overcharged), then it ticks down 2hp / 1.5s
- Fixed laser beams going out from player heads.
- Completely rewritten network code for laser sights. Vanilla verstion was eating too much network traffic.
- Thrown dosh now stays for 2 minutes. This doesn't affect Frozen Dosh or DoshGrab mutator.
- Medic Gun damage gives Medic XP (3%, i.e. 1000 damage gives +30XP).
  Medic damage XP is adding only once per wave - at the end of each wave.
  If any player gets killed by a zed, then medic damage xp for that wave is halved for all players.
- Fixed Medic XP gain for server listener and solo mode.
- Server-defined Hardcore Levels (see ScrnBalance.ini)

#### ScrnGameType (ScrN Floor):
- ScrnGameType (ScrN Floor): Last two Medium waves replaced with last two Long waves (MW6=LW9, MW7=LW10)
  Now you can play Medium Games while keeping diffulty from Long Games.
- Stats of disconnected/crashed players are saved and restored on reconnect.
  Dosh is restored only if bLeaveCashOnDisconnect=False. Otherwise it goes into team budget.

#### ScrnSP:
- Added config options to ServerPerks.ini: bBroadcastFTPErrors, bBroadcastToAdminsOnly
  to stop spamming regular players with FTP codes while continue debugging.

#### Quick Melee Bash:
- Vanilla Knife replaced with SE version (ScrnKnife)
- Don't forget to replace "KFMod.KnifePickup" with "ScrnBalanceSrv.ScrnKnifePickup" in
  spawn invetory (ScrnBalance.ini). Otherwise Quick Melee won't work.
- Currently Quick Melee Bash is working with Knife SE and Machete SE only
- Assign the following command to a key for melee bash: "Button bAltFire | QuickMelee"
- Console command to assign thumb mouse button for melee bash:
    SET INPUT Mouse4 Button bAltFire | QuickMelee
  or via user.ini:
    Mouse4=Button bAltFire | QuickMelee

#### Weapon Balance
- Nailgun now fires 7 nails per shot and holds 42 nails in clip
- MP5 damage raised to 32 (+2)
- Restored "auto-fire" for Katana's primary attack
- Tactical Reload (when round in chamber) implemented for AK-47, M4, M4-203, M4-203M, FNFAL, SCARMK17.
- Commando's reload speed bonus lowered down to 35% (-15) due to tactical reload.
- Raised total ammo count for both drum Tommy guns to compensate lack of tactical reload.
- Commando's reload speed bonus for Tommy Guns set to 60% to compensate lack of tactical reload.
- Lowered HuskGun's and single Flare Revolver's spread.
  Now headshoting zeds from moderate-to-far distance depends not only from luck.
- Fixed loss of bonus ammo when dropping Boomstick or Husk Gun

#### SCRNBALANCE[SRV].INI
- `bPerkChangeDead` - Allows dead players to change perks despite bNoPerkChanges=True
- `bTraderSpeedBoost`  - Allows players to move significantly faster during trader time

#### USER.INI:
[ScrnPlayerController]
MusicPlaylistNames - list of user-friendly music playlist names. First record always should be <DEFAULT>
MyMusic - list of user-defined music.

##### [ScrnHUD]
-   `bCoolHud` - True: new, ScrN ### v8.50 Cool HUD  /  False Classic HUD.
    Classic HUD is forced when Scoreboard is open.
-   `CoolHudScale` - scales Cool HUD, including ammo counter. Default = 2.0
-   `bCoolHudLeftAlign` - True: draws Cool HUD in left corner  /  False: in the middle
-   `CoolHudAmmoScale` - allows independently change ammo counter size.
    Keep in mind that ammo counter size depends from both: CoolHudScale and CoolHudAmmoScale
-   `CoolHudAmmoOffsetX`/`CoolHudAmmoOffsetY` - adjust Bottom/Right position of ammo counter
    1.0 - right/bottom of the screen, 0.5 - middle of the screen
-   `CoolHealthFadeOutTime` - amount of time (in seconds) for health and armor digits stay on the screen
    after last change (heal or hurt). 0 - never fade out (always stay on the screen).
-   `PlayerInfoVersionNumber` (can be set via `PlayerInfoVersion` console command):
    - 70: Classic Bars (vanilla)
    - 80: Modern Bars (scalabale over distance, green bar for 100% HP)
    - 81: Modern Bars with chat icon / weapon info
    - 85: Cool Bars
-   `PlayerInfoScale` - allows to zoom both Modern and Cool player info bars (not Classic!)
    0.5 - half size, 1.0 - full size, 2.0 - double size etc.
-   `CowboyTileY` is not configurable anymore

##### [Engine.HUD]
-   `bShowPoints` (can be set via in-game HUD Settings: "Show Score" checkbox)
    - If true, dosh will be always drawn on cool HUD
    - If false, dhos will be drawn only during the Trader Time.

#### Console Commands:
-   `PlayMyMusic <PL>` - activates user-defined music playlist (see MyMusic in User.ini)
    Built-in playlists:
    - `PlayMyMusic 1` - KF1 classic soundtrack
    - `PlayMyMusic 2` - DooM Metal Soundtrack (requires subscription to KF-Doom2-SE map: http://steamcommunity.com/sharedfiles/filedetails/?id=414181000)
                        ToggleDoomMusic is deprecated.
-   `StopMyMusic` - stops user-defined music and restores map-specific music next wave.
-   `PlayerInfoVersion` - sets and applies ScrnHUD.PlayerInfoVersionNumber
-   `ToggleHudStyle` - switches between Classic HUD / Cool HUD (Middle) / Cool HUD (Left)
-   `CoolHudSize` - sets `CoolHudScale`
-   `CoolHudAmmoSize` - sets `CoolHudAmmoScale`
-   `CoolHudAmmoX`/`CoolHudAmmoY` - set `CoolHudAmmoOffsetX`/`CoolHudAmmoOffsetY`

#### Code-breaking changes:
- ScrnHUD.DrawSpeed() migrated to GetSpeedStr()
- Non-ScrN perks are not supported anymore (i.e. those which are not extended from ScrnVeterancyTypes)
- Optimized HUD drawing code
- From now on ScrnHumanPawn ignores bLockWeaponSelection (not sure if it was in use at all)
- ScrnPlayerController.FindScrnCustomPRI() removed. Use ScrnPlayerController.ScrnCustomPRI instead.


-------------------------------------------------------------------------------
## VERSION 8

-------------------------------------------------------------------------------
### v8.21
- Fixed map achievements

-------------------------------------------------------------------------------
### v8.20
- ScrnSP.ServerPerksMutSE - ScrN version of ServerPerksMut (server-side only)
- Fixed boss battle music selection when bFixMusic=True
- ToggleDoomMusic - allows to force EGT Doom Metal Soundtrack for all maps
  Requires subscription to Doom2-SE map:
  http://steamcommunity.com/sharedfiles/filedetails/?id=414181000
- DooM boss battle song on any map changed to EGT-SingOfEvil if bFixMusic=True
- Removed 15 perk star limit (except scoreboard)
- Fixed 'OnlyHealer' achievement
- Circus Zed names
- Fixed bug which prevented setting normal zeds after event zeds


-------------------------------------------------------------------------------
### v8.17
- bFixMusic (see ScrnBalance.ini for details)

-------------------------------------------------------------------------------
### v8.15
- Fixed SpawnInventory being stacked from each map played
- bBuyPerkedWeaponsOnly allows buying ZED guns, if there is no HTec perk

-------------------------------------------------------------------------------
### v8.14
- Fixed bug in forcing event, when EventNum=254 or 255
- Fixed custom events
- New config variable: FirstStatBonusMult - additional end game stat bonus for
  winning the map for the first time

#### Code-breaking changes
  ScrnGameRules.GiveBonusStats() in incorporated into GiveMapAchievements()

-------------------------------------------------------------------------------
### v8.13
- `bBuyPerkedWeaponsOnly` allows buying off-perk items now

-------------------------------------------------------------------------------
### v8.12
- `bResetSquadsAtStart` automatically set to True if EvenNum=254
- Fixed Steampunk Sniper achievement
- Fixed empty perk list in solo mode or listen server
- Minor bugfixes

-------------------------------------------------------------------------------
### v8.11
- Fixed missing RepLink ("perk bug")

-------------------------------------------------------------------------------
### v8.10
- ScrnBalance.ini renamed to ScrnBalanceSrv.ini
- Custom DLC Locks introduced
- DLC Locks are automatically disabled in TSC or Tourney mode
- Chat icon
- bScrnClientPerkRepLink is forced to True and no longer configurable
- Optimized weapon replication code in ScrnClientPerkRepLink
- Fixed bug that prevented Sirens from destroying pipebombs
- Fixed Manual Reload for IJC Cryo Mass Driver 14 (Freezer Gun)
- A few new achievements
- SpawnInventory suppors achievement requirement and inventory check (see ScrnBalance.ini for details)
- SpawnInventory supports ammo pickups to give extra ammo for unlocking achievements (see ammo.txt)
- Setting EventNum=255 doesn't ignore MapInfo anymore.
- EventNum=254 - picks up random monster collection between regular, summer, halloween and xmas.

#### MONEY AND Weapon Balance
- ScrnCrossbow - last KFMod weapon ported to ScrnBalance :)
- Crossbow's price raised up to $1600
- M4-203 price lowered down to $1600
- Faster M203 fire rate

#### CONFIG VARIABLES (ScrnBalance.ini):
- bDoubleDoT - doubles zed burn rate (twice per second) dealing half a damage per tick
- MySteamID64 - for solo and listen servers
- bBuyPerkedWeaponsOnly - limits trader inventory to perked weapons only
- bPickPerkedWeaponsOnly - prohibits picking up off-perk weapons
- [ScrnBalanceSrv.ScrnClientPerkRepLink] category, allowing advanced admins to control
  network replication parameters.

#### USER CONFIG VARIABLES (User.ini, ScrnPlayerController section):
- bDebugRepLink - outputs every weapon, DLCLock etc. received from the server
- bWaveGarbageCollection - turns on/off automatic garbage collection at the start of each wave.
  Clients can do manual garbage collection by executing console command OBJ GARBAGE.
  But I see no reasons to do that, unless you are playing on toaster or want a crash.

#### Console Commands:
- LogAch - prints all achievements into KillingFloor.log
- AchReset - resets player's achievements (all but maps) and gives special achevement for doing that.
- ResetMyAchievements <Group> - resets all achievements in the given group, i.e. "ResetMyAchievements MASTER"
- ResetMapAch <MapName> - resets all 4 map achievements, e.g. "ResetMapAch KF-Manor"
- RepLinkMessages TRUE|FALSE - turns on/off client debug output of received shop inventory items
- RestartRepLink - use it if you get stuck with "Waiting for shop items from server" message on the screen

#### Code-breaking changes
- Achievement group is now of type "Name" instead of "String"
- ScrnAchievements.SetDefaultAchievementData() - removed index and is called only once now
- ScrnClientPerkRepLink - changed almost everything

-------------------------------------------------------------------------------
### v8.05
- In TSC Tourney mode free camera unlocks after team gets wiped.
- Fixed camera shift while switching between chase and free modes.
- Fixed several bugs in SteamID conversions.
- Added MVOTE R_KILL command for Tournament Referees

-------------------------------------------------------------------------------
### v8.01
- Beta finished
- Minor bugfixes

#### BETA 50:
- Players now are dropping both pistols upon death (if bSpawn0=True)
- New config variable: AutoLoadMutators
- Thrills Chills map achievements
- HuskGun and Flare impact damage bonuses are restored when setting bWeaponFix=False
- Fixed network replication of some config variables

#### BETA 33:
- Fixed GunSkin for custom weapons with SleeveNum=0
- Fixed bNoTeamSkins
- Minor bugfixes

#### CONFIG VARIABLES:
bPlayerZEDTime - Player death triggers ZED Time
bPerkChangeBoss - allows changing perk before Pat wave despite bNoPerkChanges=True


#### BETA 25:
- Fixed Country Tags
- Changed HL values of SuperZombies
- A few minor bug fixes

#### BETA 22:
- bugfix in PreloadFireModeAssets()
- All HUD messages support color tags now (e.g. Kill Messages)

#### BETA 11:
- Laser 44 Magnum reload speed set the same as non-laser version
- Cowboy's Reload bonus lowered down to 35%
- 20% M99 damage resistance given to Patriarch
- Fixed Medic's HP Bar scaling
- Added ScrN setting: "Old Style HP Bars"

#### BETA 10 - GOLDEN/CAMO/NEON WEAPON SUPPORT:
- GUNSKIN console command - allows changing weapon skins on-the-fly (normal/gold/camo/neon).
- Weapon skins are saved in user.ini and restored every time player equips that weapon.
- Players now can spawn with skinned weapon (e.g. Golden AK47)
- DLC checks is in place: you can't use skinned weapons without buying DLC(-s)

#### GUNSLINGER:
- Reload speed bonus in Cowboy Mode lowered to 45% (down from 75%)
- No fire rate bonus, except dual-9mm pistols in Cowboy Mode.
- 44 Magnum's headshot multiplier raised to x1.2 (up from x1.1).
  Now it is possible to flinch-lock Scrakes with headshots.
- Single pistol kills now are counted toward perk progress too.
- Perk requirements raised x1.5 (configurable by ReqBalanceMode)
- Max weight set to 15

#### MONEY BALANCE:
- Buzzsaw Bow's price raised to $4000 (up from 2500)
- Buzzsaw Blades's price raised to $80 (up from 60). 30% discount still is in place.
- M99 ammo price raised to $99. 42% discount still is in place.
- Seeker6 price lowered to $2500 (down from 4000).
- M32 price raised to $4000 (up from 2500).

#### Weapon Balance
- Seeker 6 damage raised to 130 and blast radius to 4m (up from 100 and 3m)
- Removed Seeker's damage bonus to FP
- Fixed missing sound in Seeker 6 projectile
- Boomstick is switching before AA12 (configurable)
- Fixed "Perked Weapons Switching First"
- Dead players won't be dropping Knifes, Syringes and Welders anymore (except Story Mode)
- M4-203 now allows prematurely stopping burst (shoot 1 or 2 bullets instead of 3)
- Removed auto-swings from all melee weapons
- Slightly lowered Axe's radial attack angle (~49 -> ~41 degrees)
- Removed HRL

#### TOURNEY MODE:
- TSC Tournament Playoff Members hard-coded into ScrN Balance with a special icon,
  achievement and perk xp boost
- MUTATE GIMMECOOKIES - gives perk xp boost, if caller is TSC Tournament Playoff Member
- TSC's Hardcore Level lowered from +8 down to +6
- Dead player can't do free roam in Tourney Mode
- Tourney now has different modes, which should be passed in command line: "?Tourney=X,
  where X is sum of the following values:
    - 0 - no tourney. Passing "?Tourney" without value now TURNS OFF tourney mode!
    - 1 - Tourney Mode On.
    - 2 - Vanilla Tourney.
    - 4 - Disable Starting Cash
Example:
- 1 - normal ScrN tourney like it was in TSC Community Tournament
- 2 - Vanilla Tournament. Weapon balance is disabled.
- 5 - ScrN Balance + No Staring Cash
- 6 - Vanilla Tournament + No Staring Cash

#### OTHER CHANGES:
- Redesigned ScrN Settings GUI page
- Fixed player HP bar transparency and scaling over distance
- [TSC] Shortened distance cap on drawing enemy health bars to prevent spotting
  enemies in the darkness
- [TSC] bNoTeamSkins config option (forced false in tourney mode)
- Added European Union flag for [EU] coutnry tag
- Slightly adjusted perk lv7+ requirements for headhots, stalkers and welding points
- [CONFIG] bNoPerkChanges - disables perk change during the game
- ^p and ^t color tag support (perk color and team color)
- Changed HL values for SuperZombies

#### CODE CHANGES:
- ScrnScoreBoard: DrawCountryNameSE(), DrawNamePrefixIcons(), DrawNamePostfixIcons()
  changed arguments
- Several functions in ScrnVeterancyTypes marked as final
- TeamColors[] and TextColors[] moved from TSCHUD to ScrnHUD
- ScrnPlayerController.PostLogin() and ClientPostLogin()
- ScrnCustomPRI now replicated SteamID64 and have functions to convert
  it to SteamID32 and vice-versa
- ScrnBalance.ParseColorTags(): added 2nd optional parameter: PRI
- Fixed ScrnBalance.LongMessage()
- BugFix: ScrnPlayerController.PreloadFireModeAssets() now correctly is passing
  WeaponFire argument


-------------------------------------------------------------------------------
## VERSION 7

-------------------------------------------------------------------------------
### v7.60:
- Compatible with KF 1062
- Fixes broken zed mutators
- If EventNum=0, then ScrnBalance autodetects current event
- Forcing event works for Normal, Halloween and XMas zeds.
- Added Clandestine Map Achievement

-------------------------------------------------------------------------------
### v7.57:
- Scrakes have damage resistance from off-perk M99 too
- Throwing nades while reloading Boomstick now is allowed
- Removed point-blank projectile fix

-------------------------------------------------------------------------------
### v7.56:
- Fixed bugs made in 7.55
- Pressing USE in spectator mode starts chasing player or zed that we are looking at

-------------------------------------------------------------------------------
### v7.55:
- Enhanced First Person Spectator mode
- Shows Damages in spectator mode (only while chasing a player)
- `MUTATE ACCURACY`

-------------------------------------------------------------------------------
### v7.54:
- Fixed "ScrnAchHandler.PlayerDamaged" warning
- Fixed Spectator HUD when joining as spectator in mid-game
- Adjusted Hardcore Level values for custom specimens:
    - Ghost +0.5 HL (new)
    - Tesla Husk +1.5 HL (up from 1)
    - Jason +1.5 HL  (up from 1)
    - Female FP +2.5 HL  (up from 2)
    - Super Stalker +0.5 HL (new)
    - Super Gorefast +0.3 HL (new)
    - Super Crawler + 0.4 HL (new)
    - Super Husk +1.8 HL (down from 2)
    - Super Scrake +1.4 HL (up from 1)
- Game's Hardcore Level is rounded down to nearest integer value.
  For example adding Jason or Tesla Husk still adds only 1HL,
  but adding both of them together adds 3HL.

#### New hotkeys Spectator Mode:
-   4 - assign favorite view target (up to 2)
-   5 - switch between favorites (assigned by pressing 4)
-   6 - cycle between big zeds (need to bind key to "Switchweapon 6")
-   7 - cycle between Fleshpounds or switch to Patriarch (need to bind key to "Switchweapon 7")


-------------------------------------------------------------------------------
### v7.53:
- Fixed "half-door" bug
- Fixed exploit that allowed perk changing twice in wave (bScrnClientPerkRepLink-only)
- Firebug now spawning with half amount of fuel
- Adjusted ZED enemy selection: now players on the same floor have higher priority

#### Weapon Balance
- Fleshpound requires 3.75s to become zapped (up from 1.75) with ZedGun
  or 3 ZedGunMKII shots (up from 2)
- Scrake requires 1.75s  to become zapped (up from 1.25) with ZedGun
  or 2 ZedGunMKII shots (up from 1)
- Players are not allowed to place more pipebombs than their perks allows to carry.
  All extra pipebombs are automatically destroyed at the start of a wave.

##### ZED MKIISE:
- Price raised to $1500 (up from 750)
- Ammo cost raised to $30 (up from 15)
- Fixed point-blank exploit
- Minimal detonation distance set to 2m

-------------------------------------------------------------------------------
### v7.51
- Adjusted bScrnClientPerkRepLink behavior - but not sure if that helps
- ZED Special Squads are properly cleared at the map end.
- Fixed but where monster collection wasn't reset after executing ADMIN MAP
- MVOTE READY, MVOTE UNREADY - allows to start game faster with afk players
- [ScrnGameType] LobbyTimeout is paused when nobody pressed READY

-------------------------------------------------------------------------------
### v7.47:
- Fixed player's burning, when ignited by other player.
- Fixed exploit, when dead players could see enemy healthbars in TSC.
- Added death counter to scoreboard.
- Added special HUD for spectators-only

-------------------------------------------------------------------------------
### v7.46:
- Berserker's and Medic's damage resistance against player-to-player damaged
  reduced to 30% (down from 40%)

-------------------------------------------------------------------------------
### v7.45:
- New config option: bScrnClientPerkRepLink - enhanced way for server to send
  trader inventory to clients.
- Fixed font scaling of damage popups for screen resolutions below 1080p
- Fixed perk level bug in Tourney Mode

-------------------------------------------------------------------------------
### v7.41:
- Fixed Breaker Boxes on KF-Steamland and KF-Transit. Those maps are TSC-friendly now.

-------------------------------------------------------------------------------
### v7.40:
- Compatible with KF v1059
- Added new map achievements
- Disabling ShowDamages on client side also disables client acknowledgment of
  damage done. This may reduce ping a little bit.
- Fixed double-shot bug with almost all Commando's weapons

-------------------------------------------------------------------------------
### v7.36:
- Fixed Color Tags parsing
- Reduced server info by removing irrelevant lines (e.g. Translocator)
- bServerInfoVeterancy - set to false to remove Veterancy lines from server info
- Commando's ZED time extensions capped at 10 (for servers with insane levels)

#### Weapon Balance
- 15% faster reload rate with LDS and RS Tommy Guns

-------------------------------------------------------------------------------
### v7.32:
- bNoRequiredEquipment - disables spawning with 9mm/knife/etc.
- Fixed a bug which made health restoring slightly faster than it should.
- Probably fixed "empty trader" bug

-------------------------------------------------------------------------------
### v7.30:
- Probably fixed bug when ResetSquads() didn't always work.
- If friendly fire is disabled, it doesn't take away healing anymore.
- Added DEBUGCROSSHAIR command. Available only in Solo Mode.
  This should be used only for learning where you should aim, not for actual
  gameplay (unless you want to become lamer).

#### New CONFIG Variables:
- bLeaveCashOnDisconnect - disconnected players leave their money in Team's Budget.
- BlameVoteCoolDown - prevents shit spam.

##### ScrnGameType and TSCGame ONLY:
- Fixed zed spawn system that sometimes did not spawned big zeds (e.g. FP)
- Adjusted zombie volume rating (picking up volume where to spawn zeds)
  Configurable by bCloserZedSpawns
- Added Tourney mode (activates by adding "?Tourney" in command line or KFMapVote.ini)

#### Code changes:
- Added ScrnVeterancyTypes.HUDOverlay
- ScrnHumanPawn.ClientVeterancyChanged(): new argument and bug fixes
- ScrnBalance.BroadcastMessage(): new optional argument to write message to the log on both sides

-------------------------------------------------------------------------------
### v7.25:
- fixed Show Damages and Show Speed checkboxes in ScrN Settings
- Price of single 9mm pistol is set to $75 to prevent buy/sell exploits

-------------------------------------------------------------------------------
### v7.24:
- Applied code modifications required by TSC v0.2.003
- Changed the way how blame icons are drawn
- Removed Gunslinger kills progress with a single MK23

-------------------------------------------------------------------------------
### v7.23:
- Made possible to extend ScrnBalance class, i.e:
  class MyBalance extends ScrnBalance;

-------------------------------------------------------------------------------
### v7.21:
- Fixed KILLZEDS console command
- Fixed Berserker's and armored Medic's invulnerability against tiny damages
- New config option: b10Stars for servers with high perk level setting
- Support of Quake3-style color codes. e.g. "^1Red^4Blue"
- Country Flags now are fully supported

-------------------------------------------------------------------------------
### v7.20:
- Compatibility changes to support TSC mod
- ShowDamage shows player-to-player damage now
- Modified player-to-player damage rules
- Reduced Medic armor's protection from damage made by other players (60%->40% @ L6)
- MVOTE SPEC - forces moving player to spectator mode (if available).
- MVOTE BORING locked if WaveSpawnPeriod drops below 0.5s
- New config option: bResetSquadsAtStart
- Fixed weight requirement for picking up second 9mm pistol
- Fixed Laser Magnum .44 ammo exploit
- Changed color of Laser pistol pickups making them differ from regular pistols
- Made impossible carrying laser and regular pistols together
- Fixed kill counter in ScrnGameType.Killed()
- Fixed Hell on Earth difficulty string in Lobby Menu
- Fixed crashing with error message:
  "Assertion failed: inst->KPhysRootIndex != INDEX_NONE && inst->KPhysLastIndex != INDEX_NONE [File:.\KSkeletal.cpp] [Line: 595]"

-------------------------------------------------------------------------------
### v7.14:
- Fixed bReplacePickups

-------------------------------------------------------------------------------
### v7.12:
#### ScrnGameType a.k.a. *ScrN Floor*
Extended KFGameType (normal KF game type)
- Fixed KFStoryGameInfo loading for KFO maps: ScrnStoryGameInfo is loading instead
- Removed 6 player limit (MaxPlayers can be set up to 32 directly from the command line)
- Removed checks for steam achievements that aren't used anyway
- Added GameLength voting option (server command line or KFMapVote.ini):
    -   GameLength=0 - Short game (4 waves)
    -   GameLength=1 - Medium game (7 waves)
    -   GameLength=2 - Long game (10 waves)
    -   GameLength=3 - Custom game (Sandbox mode)
Example (KFMapVote.ini):
-   `GameConfig=(GameClass="ScrnBalanceSrv.ScrnGameType",Prefix="KF",Acronym="HoE Short",GameName="ScrN Hell on Earth Short",Mutators="ServerPerksMut.ServerPerksMut,ScrnBalanceSrv.ScrnBalance",Options="Difficulty=7?GameLength=0")`
-   `GameConfig=(GameClass="ScrnBalanceSrv.ScrnGameType",Prefix="KF",Acronym="HoE Long",GameName="ScrN Hell on Earth Long",Mutators="ServerPerksMut.ServerPerksMut,ScrnBalanceSrv.ScrnBalance",Options="Difficulty=7?GameLength=2")`

#### Other Changes
- 5 new achievements related to Ghosts and Tesla Husks
- Fixed support of AchievementFlags (see ScrnBalance.ini)
  Now admins can remove unsupported achievements (e.g. doom3) from the list
- Buzzsaw blades are destroyed at the start of the wave - exploit fix
- Another attempt to fix annoying sound of stuck buzzsaw blade
- 3x lowered amount of zed time extentions Commando gets above level 6 (i.e. +1 ext. per 3 levels)

#### Console Commands
-   `MUTATE DEGUGGAME` - shows current event number and monster collection
-   `MUTATE RESETBOSS` - [admins only] - resets end game boss to default (Patriarch)

-------------------------------------------------------------------------------
### v7.09:
- Fixed double stat saving bug at the end of the game,
  which could prevent of saving end-game perk xp bonus.
- Lv7+ Commandos gains +1m to Stalker visibility per level.
  This doesn't affect HP bars, which stays at 16m max.
- [Hardcore] 25% reduction of Stalker, Ghost and HP bar visibility (12m @ L6)
- [Hardcore] Commando receives x3.5 more damage from Stalkers
  and Ghosts (up from x2.5)

-------------------------------------------------------------------------------
### v7.06:
#### Hardcode Mode
-   Hardcore Mode adds 2 points to Hardcore Level
-   Reduced fire DoT
-   Removed Commando's extra 15% reload bonus (all weapons have 35%)
-   Commando receives x2.5 more damage from Stalkers
-   Gunslinger receives double damage from Crawlers
-   Support Spec. shoots 20% slower with all weapons
-   Rockets and grenades collide with teammates (except hand nades)

-------------------------------------------------------------------------------
### v7.05:
- Fixed ScrnNade.ExplodeSounds error

-------------------------------------------------------------------------------
### v7.04:
- Unlocked ZEDGun and DwarfAxe
- Rebuilt for v1058
- Decapitations with dual pistols now count towards Gunslinger progress.
  Previously only direct kills were counted, ignoring bleeding out.

-------------------------------------------------------------------------------
### v7.02:
- Some bug fixes
- [Hardcore] Limits Medic's armor blocking to 50% of damage received
  (Vanilla: 75%, ScrN default: 60%)
- [Hardcore] Limits Firebug's fire damage resistance up to 90%
- [Hardcore] Sharpshooter looses 50% damage on body hits

-------------------------------------------------------------------------------
### v7.00:
- ServerPerks v7 Support
- Trader menu colors can be configured in User.ini (ScrnHUD section)
- Removed Berserker's fire damage resistance in Hardcore Mode (bHardcore=True)


-------------------------------------------------------------------------------
## VERSION 6

-------------------------------------------------------------------------------
### v6.26:
- Uses ScrnVotingHandler v3
- Added map achievements for KF-Forgotten
- Tesla Husk gives +1 Hardcore Point

-------------------------------------------------------------------------------
### v6.23:
- Added story map achievements for Steamland and Fright Yard
- Fixed player respawn in Story Mode
- Fixed perk changing in Story Mode
- Proper hand nade icon is displayed in trader menu (supports custom perks now)
- Fixed achievements, which are depending on melee damage

#### Weapon Balance
- LAR's price raised to $300
- Dual 9mm's weight lowered to 1 block
- [BETA] Removed Berserker's damage resistance from Husk Fireballs.
  This feature automatically turns off in Doom3 Monster mode.
- Changed Crossbuzzsaw Blade's mechanics: If blade kills or decapitates a specimen,
  then slightly lowered damage and speed reductions now are applied.
  If not - blade looses significant amount of damage and speed.
  This makes "meatshields" relevant to buzzsaw blades too.

-------------------------------------------------------------------------------
### v6.22:
- Fixed Stats tab in the Main Menu
- Fixed Picking up of the same weapon

#### Weapon Balance
- Each weapon now has own flashlight battery

-------------------------------------------------------------------------------
### v6.21:
Compatible to KF v1056

#### SPAWN AND MONEY BALANCE:
- Configurable starting cash and trader time for each difficulty
- bMedicRewardFromTeam - config option to prevent money raising exploit by
  hurting themselves and healing each other
- Healing projectiles do not shake screens of nearby players anymore
- Configurable spawn inventory

#### Weapon Balance
- Fixed pickup of second pistol.
  This allows again holding golden/camo+normal guns at the same time too.
- **ScrnThompsonInc** - incendiary verion of Tommy Gun
- FNFAL:
    - Fixed recoil bug in burst fire
    - Slightly increased headshot multiplier

#### TRADER MENU:
- Updates trader list only when necessary (not every 0.05 seconds)
- Real weapon stats are shown in trader menu, not mysterious speed/power/range
- First click on autofill buttons buy everything but nades and pipebombs
- To auto-buy nades and pipes too, plyer has to make double-click on autofill button
- Weapon price can be configurable via PerkedWeapons
- New trader hotkeys:
    - F1 - switch to player's inventory list
    - F2 - swtich to sale list
    - F5 - refresh trader menu
    - F8 - Auto fill ammo

#### Other changes:
- Fixed map achievements for Kf-HellFinal1-5
- Fixed some Doom3 achievements
- Playing Objective Mode gives extra +3 to Hardcore Level

#### Config Variables
- bUseExpLevelForSpawnInventory
- SpawnInventory
- bNoStartCashToss, bMedicRewardFromTeam
- StartCashNormal, StartCashHard, StartCashSui, StartCashHoE
- MinRespawnCashNormal, MinRespawnCashHard, MinRespawnCashSui, MinRespawnCashHoE
- TraderTimeNormal, TraderTimeHard, TraderTimeSui, TraderTimeHoE

-------------------------------------------------------------------------------
### v6.09:
- Added Quick Buy buttons next to items in trader inventory list
- Fixed minor bugs in trader GUI
- Pressing 0..9 keys buys X clips for the selected gun
- Fixed current player highlighting in ScoreBoard

-------------------------------------------------------------------------------
### v6.08:
- ScrnStoryGameInfo prevents game type overriding for KFO maps
  (fix of the "fix" of KF v1055)

-------------------------------------------------------------------------------
### v6.07:
- Gunslinger now has perk index 8 (because KF uses 7 as off-perk index)
  Weapon bonuses are backward compatible: both PerkedWeapons=7: and PerkedWeapons=8:
  will add Gunslinger's bonuses, but it is recommended to use new (8) index
- Fixed mode switching for Nailgun and FNFAL
- MVOTE PAUSE doesn't broadcast error messages anymore
- Added Achievements for winning Fright Yard
- Fixed minor bugs in ScoreBoard

#### TRADER INVENTORY LIST:
- Fixed Favorite Weapon Group
- Redesigned Trader's inventory list
- Added keyboard shortcuts to inventory list:
  ENTER/BACKPACE: buy/sell item;
  PAGE UP/DOWN: Select previous/next group;
  UP/DOWN: select previous/next item in the same group;
  0-9: Quick group selection

#### Weapon Balance
-   M32's price set back to $750
##### ScrnSeekerSixRocketLauncher:
-   Can lock on target only when aiming down the sights
-   Shooting doesn't break target lock
-   Magazine capacity raised to 24 (up from 6)
-   Total ammo raised to 192 (up from 96)
-   Full-auto mode for primary fire
-   Alt. fire rate lowered to 1s (down from 0.33s)
-   Impact damage lowered to 32 (down from 75)
-   Rockets can be detonated by other damage
-   Price raised to $4000 (up from 2250)

-------------------------------------------------------------------------------
### v6.05:
- Compatible with ServerPerks v6.75 and KF v1054
- Added perk bonuses for new weapons
- Enhanced Scoreboard - displays kill assists, story icons, and
  solves WebAdmin appearing in Objective Mode
- Some adjustments for Objective Mode (ObjMode)
- mvote spawn is working in ObjMode, if bBeta=True
- Default trader inventory now has perks as categories
- Config variable bReplacePickupsStory - allows to replace pickup and initial
  inventory with ScrN Editions (SE)
- Changed the way how pickup items is replaced with SE - it is save now
  to use this feature in Story Mode
- Single 9mm pistol can be dropped
- Syringe can be dropped in Story Mode
- When dying in Story Mode, players will always drop all their weapons,
  no matter of bSpawn0 setting
- mvote END WAVE - vote to kill stuck zeds
- Fixed DLC and LOCKED weapons
- Applied proper arm texture when cooking nades

#### WARNING!!!
Do not forget to set EventNum=2 in ScrnBalance.ini for Halloween zeds or you
can encounter invisible zeds after map change!

#### Weapon Balance
- All your pipeboms explode on perk change - prevents quick perk-switch exploit
- Pipebombs immune against fire damage, unless instigated by zeds
##### Flare Revolvers:
- Impact damage lowered to 85 (down from 100)
- Removed impact damage bonus from Firebug
- Burn damage raised to 30 (up from 25)
- iDoT made stronger.

#### Config Variables
- MaxVoteKillMonsters
- MaxVoteKillHP
- bVoteKillCheckVisibility
- VoteKillPenaltyMult

-------------------------------------------------------------------------------
### v6.01:
- Compatible with ServerPerks 6.50
- Compatible with Objective Mode
- [TEST] Added GUI setting to switch perked weapons first
- Fixed Buzzsaw's ammo HUD


-------------------------------------------------------------------------------
## VERSION 5

-------------------------------------------------------------------------------
### v5.55:
- Ability to force KF event: global or for specific maps.
- Ability to make own event with custom monsters collection
- Created Doom3 Event with EventNum=100
- Custom squads can be defined in config and spawned via "mvote spawn" command.
  See VoteSquad config var for details.

#### Config Variables
-   EventNum
-   bForceEvent
-   CustomEvents
-   MapInfo
-   VoteSquad
-   StatBonusMinHL - hardcore level to subtract from end game bonus calculation
-   MapZeds renamed to MapInfo and added Difficulty setting.
    Now server admins can set how difficult this map is, which will affect end game bonus

#### REMARKS:
If bForceEvent=True, ScrnBalance mutator must be loaded before any custom zed
mutators (e.g. ScrnMonstersMut)!

-------------------------------------------------------------------------------
### v5.53:
- Option to lock dropped weapon, i.e. prevent other players to pick them up.
- Broadcast weapon pickups - every time player takes a weapon, which belongs
  to other player, a message will be broadcasted.
- Added separate button "View Map" to Lobby menu.
- Reworked AssessThreatTo() function, which is used for selecting zed's enemy
- Regular game (KFGameType) now uses AssessThreatTo() too.
- Reskinned models for both medic grenade launchers
- Fixed bug when player reloads M203 after last nade fired
- Achievements now can be used with non-scrn perks too
- 5 new achievements
- ScrnAchHandlerBase class enhanced with new event functions.

#### Console Commands
`READY`, `UNREADY`, `SPECTATE`

#### Config Variables
-   bBroadcastPickups
-   bAllowWeaponLock
-   EventNum - set event number KF is currently running
-   bAutoKickOffPerkPlayers - auto-kicks players, who have the "Perk Bug"
-   SharpProgMinDmg - allows to progress SS perk on every heavy headshot made
    (not only decapitation)

-------------------------------------------------------------------------------
### v5.50:
- New achievement system
- 45 new achievements added
- AchievementFlags changed! Set value to 255 to enable all achievements. See config for details.
- Monsters can be blamed, e.g. MVB "CLOT"
- Faked Players (increase wave size).
- Players can receive perk progression bonus, if the game was won (see config for details)
- Waves size now can be increase too (not only lowered).
- Changed Voice msg spam protection rules. Now players are allowed to say
  5 times in 10s and Zed time is included in calculations.
  Voice messages during zed time are still bugged
- If bSpawn0=true, player drops all his weapons upon death, except initial inventory
- New console command DropAllWeapons -

#### Console Commands
MUTATE PERKSTATS - displays perk data and progress during the game
DROPALLWEAPONS - drop every dropable weapon in player's inventory, e.g:
  set input U DropAllWeapons | tosscash 100000 | say Seeya

#### Bug fixes
- Fixed HuskGun's damage and blast radius
- ScrnBalance doesn't delete previous voting interactions (messages) at the game start anymore.
  This solves the issues, when player, who joined the game during the voting, din't can't see
  voting status. Voting message can be deleting manualy from the HUD by typing "RemoveVotingMsg"
  in the console.
- Fixed syringe double-heal bug
- Fixed (again!) enemy threat calculation

#### Weapon Balance
- FP resistance against SP Musket set back to 25%
- Firebug's max reload speed bonus limited 60%
- Slightly increased HuskGun's headshot multiplier, so 6p HoE SC can be killed with 2 full-charged headshots
- Medic gets fire rate bonus with syringe up to 60% @ L6 (primary fire only)

#### Code-breaking changes
ScrnGameRules class had been heavily modified to introduce new achievement system.

-------------------------------------------------------------------------------
### v5.31:
- Made compatible with Summer'2013 event
- Added map achievements for KF-Steamland
- Ash's Chaisaw now has golden skin
- Removed pistol damage requirement from Gunslinger
- New perk icons for level 11+ (green, blue, purple and orange).
- Ability to revert back to old-style perk icon from GUI ScrN Settings page.
- "mutate forcezeds" - force apply mapzeds to the current game. Example:
  mutate mapzeds 64
  mutate forcezeds

#### Weapon Balance
##### SP Musket:
- Base damage lowered to 90 (down from 180)
- Headshot mult. raised to x4 (up from x2)
- FP has 50% damage resistance
##### SP Tommy Gun (LDS):
- Price raised to $1500
- Removed semi-auto fire
- Weight raised to 6
##### RS Tommy Gun:
- Price raised to $1500
- Removed semi-auto fire
- Weight raised to 7
- Removed magazine bonus (stays 50 for all levels)
- Increased total ammo count up to 400 (500 @ L6)

-------------------------------------------------------------------------------
### v5.24:
- `MVOTE BLAME ME` - blames yourself
- `MVOTE BLAME TEAM` - blames everybody
- Added ScrN key bindings in Controls GUI
- New config variable - `MaxZombiesOnce`
- `MaxZombiesOnce` can be set individually for each map by typing in the console:
  `mutate mapzeds X`
  , where X is max number of specimens that could be on the map at once, e.g.:
  `mutate mapzeds 64`
  Command is avaliable for admins only!

-------------------------------------------------------------------------------
### v5.20:
- Fixed error of accessing "none" variables, when players take environmental damage
- Fixed bug, when level 7+ support didn't received extra weight bonus with dynamic
  level cap enabled
- New ini settings: bAlterWaveSize, Post6ZedsPerPlayer, MaxWaveSize
- Bonus ammunition is saved for last dropped gun (player won't loose bonus
  ammunition after picking it up again)
- New ini settings: bAllowPauseVote, bAllowLockPerkVote, bAllowBoringVote
- Additional 7+ player game settings:
  Post6ZedSpawnInc - increases zed spawn rate per each player above 6
  Post6AmmoSpawnInc - spawns additional ammo boxes on the map, if players > 6
  mvote BORING - doubles zed spawn rate untill the wave ends or one of the players dies
- Fixed xbow/m99 ammo price bug
- Fixed Hidden Zero achievement
- Fixed bug with permament voting message, if map is switched or disconnected
  during voting
- Added "MVB" console command - alias to MUTATE VOTE BLAME

#### LEVEL 7+ BALANCE:
- Raised HuskGun's headshot multiplier to x2 (from x1.5).
- Lowered pistol headshot mult. bonus for 7+ level SS down to 7.5% per level
- Xbow/M99 ammo discount now can be raised up to level 10 (70% discount)
- Berserker continues to receive Chaisaw's fuel tank bonuses above level 6
- Fixed bug, when level 7+ Berserker gained extra 6% speed of melee attacks
- Berserker gains +2% melee attack speed per 7+ level (up from 1%)
- Firebug receives +5% for Huskgun impact damage (only starting with level 7)
- Level 7+ firebugs do not receive additional reload speed bonus / husk gun charging.
- Custom weapon P and S bonus switches now can be applied on Firebug too (even if it is not a burning damage)
- Extra 2 M79Inc nades per level for L7+ Firebug
- L7+ Demolitions receives +2 M79 nades and +3 M32 nades (instead of dumb +5%)
+ LAW receives +10% rockets per level, i.e. +1.6 rocket instead of +1.

-------------------------------------------------------------------------------
### v5.18:
- Added new ini settings: StalkerRequirementScaling, bAllowKickVote, bAllowBlameVote
- Fixed "TeamWork: Stunning Shot, Mate!" achievement, which previously didn't
  track xbow/lar/m14 stuns made to Husk.
- Fixed "TeamWork: Sniper Blow" achievement
- Fixed BerserkerT perk description [hegyeri]
- Adding W bonus for medic weapons gives reload speed bonus

#### CODE BREAKING CHANGE
- Removed ScrnAchInfo class due to performance issues

-------------------------------------------------------------------------------
### v5.15:
- Fixed Sharpshooter's reload speed bonus [Aze]

-------------------------------------------------------------------------------
### v5.14:
- Ownership of this product moved to "PU Developing IK", which from now on are
  holding Copyrights on "ScrN Balance".
  Don't worry, it'll still be avaliable for free ;)
- ScrnBalance automatically loads ServerPerksMut, if it isn't loaded yet.
- ScrnBalance can be used together with Aliens mod. HUD replacement is optional.
- Firebug default no-bonus damage type changed to MAC10. That means, if you
  override weapon's damage type to firebug by specifying D bonus without P,
  MAC10Inc damage type will be used (no FB damage bonus, no x1.5 multiplier)
- Changes map achievement requirements:
    - Hard: custom end game boss doesn't count as custom specimen for Hard ach.
    - Suicidal: custom end game boss required: HardPat, Super Pat or ScrnDoom3 boss.
        Doom3 monsters aren't required anymore for getting Suicidal ach.
    - HoE: Doom3 monsters required only. You can play without custom monsters, if
    - hardcode level is 15+.
- Modified map achievement list:
    - Country Jail added
    - Big Sunrise changed to Beta1-6 version

-------------------------------------------------------------------------------
### v5.12:
- Kenny is allowed to survive one of the early waves
- Now it is possible to specify D bonus without P
  (change weapon's perk without adding damage bonus)
- [config] Dynamic Level Cap - automatically raises max bonus level,
  if more >6 players are in the game. Dynamic Level Cap doesn't affect
  Hardcore Level
- Sharpshooter level 7+
  headshot damage increase raised to +15% per level (up from 7.5%)
  removed additional reload bonus (capped @ 60%)
  10% total ammo bonus per level
- 5% total ammo bonus per level for level 7+ Commandos and Medics
- 5% more M79 and M32 nades per level for level 7+ demolitions

-------------------------------------------------------------------------------
### v5.09:
- Kriss Medic gun syringe restore rate lowered to be half between MP7 and MP5
- Nailgun's fire rate increased by 25%
- Level 5 spawn inventory for most perks now costs $200, discount removed
- M79 removed from map spawn list. Instead of this ammo boxes always give a nade.
- HoE gives +4 hardcore points (up from 3)
- Setting max level cap below 6 gives extra 2 harcore points per each level
- Added voting options:
  mvote PAUSE X - pause the game for X seconds
   (by default enabled only during trader time, configured by "bPauseTraderOnly")
  mvote END TRADE - instantly ends trader time
  Skipped trader time can be added to the next one. This behaviour is
  controlled by "SkippedTradeTimeMult" config variable.

-------------------------------------------------------------------------------
### v5.05:
- M99 weight changed back to 13 blocks
- ZED Disco added to map achievements
- Harbour map ach. can be earned on both Harbor and HarbourV3 maps
- Fixed health restoring bug that limited health restore rate to 10hp/s
- Healing rate lowered down to 7 hp/s (12 hp/s @ L6)
- Player health bars now showing healing value too
- Balanced Berserker's fire speed bonus for levels 7+
- Fixed shotguns' bug, when pellets won't spawn if teammates standing too close
- Fixed a bug, when fired projectiles won't spawn if player is too close to
  blocking volume or another player's or zed's collision cylinder.
- Players can now vote by saying "!yes", "!no" or using voice commands.
- From now on ScrnBalance requires ScrnVotingHandlerMut.u to run
  (already included in release package)
- Voting to lock perk. Locked perks can't be chosen (except admins).
  Players that currently use locked perk, will be required to change it
  at the end of the wave
- Fixed Boomstick's bug

-------------------------------------------------------------------------------
### v5.03:
- New squad system (MonstersCollection) now resets to default after the game end
  Fix fixes messed up zeds

-------------------------------------------------------------------------------
### v5.02:
- Added GUI checkbox for bAlwaysDisplayAchProgression on ScrN Settings page
- Map achievement "Sunny Land Sanitarium" changed from v1-3 to v1-5
- Game's end boss now is reset to default after the game end

-------------------------------------------------------------------------------
### v5.01:
- Final version released. No changes since Beta 80

#### 5.00 Beta 79:
- Sligtly increases Chainsaw's melee distance
- Pistol achievements now can be earned with dualies too
- [TEST] Cowboy Mode works with laser pistols too

#### 5.00 Beta 76:
- Reworked "Combat Medic" and "Touch of Savior" achievements
- Added ScrN Edition of Kriss (Schneidzekk) Medic Gun:
  Weight raised to 5 (up from 3)
  Price lowered to 8000 (down from 10k)
  Ammo cost raised to 20 (up from 10)
  Now it can be used in earning medic achievements
- MP5M price lowered to 4000 (down from 5000)
- M79M prices lowered to 3000 (down from 4000)
- Added "mvote" console command for voting in ScrnMonsters mutator

#### 5.00 Beta 72:
##### CHAINSAW:
- Added reload sound
- Disabled ambient sound, when it runs out of fuel
- Consumes fuel on idle (20 fuel units per minute)
- Updated HUD ammo icons for new weapons
- Kung Fu achievements can't be earned with buzzsaw anymore
- Buzzsaw now can be used to gain some sniper achievements related to xbow & m99
- Fixed armor absorb rules - now high level Medic isn't invulnerable against bloat
  bile anymore

#### 5.00 Beta 63:
- Fixed "Ain't looking for easy ways" and "Combat Medic" achievements

#### 5.00 Beta 62:
- Raised Chainsaw's damage. It uses fuel now.

#### 5.00 Beta 61:
- Enhanced Achievement List, so players can find achievements easier
- 12 new achievements, mostly for zerker, medic and firebug
- 8 new map achievements for surviving Swamp and Long Dark Road
- Some bug fixes

#### 5.00 Beta 51:
- Nail damage raised from 30 to 40. Push force now depends from damage.
- Fixed Grilled Shiver Brains ach (again)

#### 5.00 Beta 50:
- Fixed Merry Men and Merry Men .50 achievements
- Fixed Grilled Shiver Brains ach.
- Brute is no longer required to get HoE map achievements. You can earn it without Brute,
  if you can raise Hardcore Level to 15 without it.
- Game-end achievements now are properly displayed

#### 5.00 Beta 35:
- Removed radial attack from Machete, Axe and Katana' primary attack
- Adjusted melee weapons:
* Machete: $100 (no discount), removed radial attack from both fire modes
* Axe: $200 (no discount), level 5 spawn inventory, marked as tier 1 weapon
    Removed radial attack from secondary attack
* Chainsaw: $1000, level 6 spawn inventory
* Katana: $1250, removed radial attack from primary attack
* Scythe: $1500, weight 5, no alternate fire
* Claymore: $2500, marked as tier 3 weapon
* Crossbuzz: $2500, weight 9, ammo raised to 24,
  damage lowered to 400, headshot mult. raised to 2.5

#### 5.00 Beta 33:
[v5 Announcement](http://forums.tripwireinteractive.com/showpost.php?p=1165537&postcount=272)


-------------------------------------------------------------------------------
## VERSION 4

-------------------------------------------------------------------------------
### v4.59:
- Made compatible with new Custom Monster Balance version
- Fixed a bug, when player couldn't partially repair armor
- Fixed some perk descriptions

-------------------------------------------------------------------------------
### v4.58:
- new console command "TogglePlayerInfo" hides player names and health/armor
  bars while keeping other HUD elements displayed
- Perk icon colors extended to level 25 (added purple and orange)
- Fixed some bugs in trader menu.
- Now perked weapons in the shop list appears in the right order. Previously
  they were added in reverse order (last perked weapon was in the top of the list).
- Fixed a tiny exploit, when player after changing the perk was keeping speed bonus
  until changing a weapon
#### GUNSLINGER:
- Automatic fire with Dual-9mm in Gunzerker Mode (Machine Pistols)
#### Weapon Balance
- Armored Jacket (25%) made avaliable for purchase
- You still can't sell an armor, but you can replace it by buying another.
  No refunds, however ;)
- Reworked damage absorption rules for armor
- Level 6 Medic's armor bonus lowered to 60% (down from 75%).
- Magnum .44 price lowered to $150. Perk discounts removed too.
- Price of Laser Dual Magnums .44 lowered down to $2000
- Firebug reload bonus with MAC10 set same as flamer's (up to 60%)

-------------------------------------------------------------------------------
### v4.51:
- M7A3 didn't show successful heal messages
- HRL sometimes didn't shoot and required manual reload
- While reloading Pump Shotgun, Combat shotgun, LAR and M32 couldn't shoot last
  ammo from magazine and required at least 2 ammo in magazine to be able
  to shoot
- [optional] Vest has 1 block weight instead of nades. If player doesn't wear
  armor, he can carry more. This feature is disabled by default.
- Bullpup's weight set to 4. Total ammo reverted to default, penetration removed.

-------------------------------------------------------------------------------
### v4.50:
- After nade-healing is over, instigator receives a message how many players
  healed and how much health is restored
- Fixed a bug, when you sometimes couldn't shoot with M4-203 without reloading
- [Possibly] fixed a healing bug with medic gun, when green healing cloud was
  drawn, but no healing was made

-------------------------------------------------------------------------------
### v4.40:
#### Weapon Balance
- Fixed M4-203M ammo cost bugs
- Another attempt to fix medic nades
- M4-203 bullet fire rate slowered down by 25% to compensate damage buff
- M4-203 headshot multiplier lowered back to x1.1, so both M4 and M4-203 do the
  same headshot damage (45 off-perk) while M4-203 deals more body damage, but
  shoots slower. Off perk M4's body-shot DPS now is 466, M4-203's - 410.

-------------------------------------------------------------------------------
### v4.39:
- [optional] SHOW SPEED. Draws players current/max speed on the HUD.
  Can be enabled on the ScrN Balance Settings GUI menu page.
  In user.ini you can change position and font size.
- [Test] Berserker gets full speed bonus while holding a Chainsaw
#### Weapon Balance
- You can't skip M99 reload, but you can switch to other weapon during
  aiming part after realod, that is last 20% of reload animation (after ~2.85s).
- Removed burst fire from M4 (only from Scoped version)
- M4-203 bullet fire damage raised to 41 to body-kill HoE Crawlers with 1 burst
- [Test] Added Medic magazine capacity bonus for M4-203M
- [Possibly] Fixed network synchonization bug in medic nades
  (4-th or 5-th bug fix attempt? lol)

-------------------------------------------------------------------------------
### v4.38:
- SHOW DAMAGE [configurable] - now you can see how much damage you deal to the
  zeds on your HUD.
- M99 ammo cost raised to $50 (up from 40). SS still gets as discount in it.
- Slowered M99 fire rate from 3.03s down to 3.6s. Now M99 and xbow DPS are the
  same: M99 deals double damage, but shoots twice slower.
- HandCannon's penetration damage reduction lowered down to 35% (from 50%)
- [Probably] Fixed broken Pipebomb bug
- Fixed Pipebomb sell exploit, when players could sell 1 pipe by a price of 2
  Now pipebombs' sell value is scaling by numbers of pipes player has.
- Pipebombs now are selling by 1. So if you have $750, you can buy 1 pipe.
- Medic nade made slower (again), and fixed [probably] [again ;)] bug, when it
  didn't detonate. Explosion timer set to 3s (down from 5)

-------------------------------------------------------------------------------
### v4.37:
- Fixed a bug, when any incediary explosion could make enormous amount a damage
#### Weapon Balance
- Scythe's primary attack headshot damage mult. lowered to x1.1 (down from x1.25)
  Not it requires 11 headshots to kill FP in 6p HoE game (up from 10).
- Claymore's primary radial attack angle narrowed to ~30 degrees
  (from ~63 degrees)
##### Trenchgun:
- Base damage lowered x1.5 (now it is 14x12 instead of 14x18), giving Firebug's
  damage bonus instead.
- Applied ScrN Pellet Penetration Rules - Support still has penetration bonus,
  but it isn't so big now.
- Trenchgun levels shotgun damage stat too - it is a shotgun after all
- Applied Alternate Burning Mechanism

-------------------------------------------------------------------------------
### v4.36:
- v1043 support
- Fixed a bug, when Gunzerker @L6 gained x2 reload speed bonus instead of x1.75
- Added discount on buzzsaw blades to Berserker (5% per level)

-------------------------------------------------------------------------------
### v4.35:
- Restored Firebug's damage bonus for Flare Revolver (up to 160dp @ L6).
- Flare Revolver's burn damage set to original 25 (down from 30),
  but incremental DoT still persists.
- Removed secondary attack from Scythe, weight lowered down to 5.
- Added 40% buzzsaw damage resistance to Scrake's body on Sui-HoE
  Scrake can't be body-stunned anymore with buzzsaw,
  but it still requires only 2 headshots to kill him

-------------------------------------------------------------------------------
### v4.20:
#### Alternate Burning Mechanism:
- Flares do incremental DoT (more flares hit = more fire damage per tick zed receives)

#### Weapon Balance
- Medic nade's speed reduced
- Fixed M4 fire sound in 3-bullet burst mode
- Explosion timer set to 5s (up from 1s),
  but it explodes immediately when touching a player.
- Magnum 44 weight set back to 2 blocks (down from 3), but single gun ammo
  reduced down to 72, (dual ammo raised to 144 to match MK23)
- Husk Gun's weight raised to 9 blocks to disable holding it with M79 + Flare
- Flare pistol's headshot multiplier lowered to x1.1 (down from x1.5)
- Single Flare pistol's max ammo lowered down to 60, dual - 120

-------------------------------------------------------------------------------
### v4.10:
#### Weapon Balance
- Restored regular hand nades for Medic. He needs to buy medic GL to launch healing nades.
##### M79M:
-   Medic nades are only healing now - no damage to the enemies.
-   Zeds stopped fear them.
-   Increased medic nade throwing speed - now can be thrown at greater distance
-   Medic nade immediately explodes when touching a player (except instigator)
-   Reduced healing value: 6 healings every second, 8hp each (down from 9x10)
-   Level 6 Medic with one nade can restore up to 84hp for each player. In original game - 157.
-   Since zeds aren't afraid of medic nades anymore, Siren can easily destroy
    them with her scream, immediately stopping healing process.
##### New weapon - M4-203M Medic Gun.

-------------------------------------------------------------------------------
### v4.00:
Added support for new weapons.
Balance job hasn't made yet. Just added as they are, except the following:
- Removed Impact damage bonus from Firebug (Husk Gun and Flare Pistol)
- Added new weapon: **M79M** (shoots healing nades)


-------------------------------------------------------------------------------
##  VERSION 3

-------------------------------------------------------------------------------
### v3.76:
-   Fixed a bug when Syringe couldn't heal Berserker above 100hp.

-------------------------------------------------------------------------------
### v3.70:
-   Added test versions of berserker and firebug.
-   Berserker receives health boost instead of damage resistance (200hp @L6),
-   but has no more speed penalty while using Syringe.
-   Firebug's fire resistance limited to 90% max.
-   To activate them add the following lines to ServerPerks.ini:
    ```
    Perks=ScrnBalanceSrv.ScrnVetBerserkerTest
    Perks=ScrnBalanceSrv.ScrnVetFirebugTest
    ```
    You can replace original one, or use both versions together on your server.

-------------------------------------------------------------------------------
### v3.67:
-   Husk Gun's ammo lowered to 200 (320@L6)
-   FP receives additional 50% resistance to Husk Gun's burn damage
-   Added option to disable replacing weapon pickups
-   Added option to disable nade cooking on server side
-   Custom perks can define requirements above level 6 (e.g. Heavy Gunner)

-------------------------------------------------------------------------------
### v3.66:
##### HUSK GUN NERF:
-   Primary Fire's max blast radius lowered from 9m down to 6m
-   Alternate Fire's blast radius lowered from 12m to 10m

-------------------------------------------------------------------------------
### v3.65:
Adding GUI settings page in perk selection menu, allowing user to configure:
- Manual Reloading
- Blue Lasers for Teammates
- Nade Cooking

-------------------------------------------------------------------------------
### v3.62:
-   Bullpup's total ammo raised from 400 to 500 (500 -> 625 @ level 6)
-   Added 1 bullet penetration though small zeds (up to Clot) for Bullpup
-   Changing custom weapon's damage type ("D" switch) will change weapon's perk
    con in the shop too.

-------------------------------------------------------------------------------
### v3.60:
-   Enhanced custom weapon and perk support

-------------------------------------------------------------------------------
### v3.40:
-   *Alternate Burning Mechanism* is controlled directly from mutator
        (no need to override zed classes or make compatibility mutators)
        It can be turned off from the config, if you want so.
-   MAC10s damage lowered by 1p (35 -> 34) to permamently fix
        Infitite Crawler Burning bug.
 -  Fixed weapon spawns on the maps. No more weapon piles,
        but now you can find MAC10 or M79 (very rare) too.
        HC replaced with Magnum 44
-   SZ compatibility mutator is no longer supported.
        Super Zombies v2 can be used together with ScrnBalanceSrv.
-   Husk Gun's price changed back to $4000.

-------------------------------------------------------------------------------
### v3.36:
##### Husk Gun Secondary Fire:
-   Initial damage lowered ~ double (5x100 -> 7x35)
-   Fire Damage over Time lowered by 65%
-   Ammo per shot lowered to 20 (down from 25).
-   Projectile spread increased by 50%
-   Proj. speed lowered by 20-30%

-------------------------------------------------------------------------------
### v3.30:
Overrided Bullpup, AK47 and SCARMK17 weapons to count Shivers' kills

-------------------------------------------------------------------------------
### v3.29:
#### Level 7+ Balance:
- Demolitions: Ammo discount limited to 50% max
- Firebug:
    - Magazine size bonus limited to 60%
    - Total ammo bonus lowered down to 5% per each level above 6

-------------------------------------------------------------------------------
### v3.28:
Revised bonuses for perk levels 7+.

-------------------------------------------------------------------------------
### v3.25:
Manual Reloading (configurable)

-------------------------------------------------------------------------------
### v3.00:
Custom Weapon Support (easy to apply perk bonuses on them, see Readme)

-------------------------------------------------------------------------------
## VERSION 2

-------------------------------------------------------------------------------
### v2.83:
- Fixed a bug, when player was supposed to have 4 free weight blocks to pickup
    second MK23 (instead of 1).

-------------------------------------------------------------------------------
### v2.81:
- New weapon: **HRL-1 Rocket Launcher** - L.A.W. with smaller rockets and faster reload
- M79 Incendiary grenade damage raised to 60 (up from 50) to instant-kill Crawlers
- Removed Dual Pistol aiming bug. More info @
    [Tripwire Forums](http://forums.tripwireinteractive.com/showthread.php?t=82390).
    Thanks to n87 and Benjamin

-------------------------------------------------------------------------------
### v2.73:
Many GUI fixes, including perk bonus descriptions and weapon descrioptions in trader menu
#### Spawn and Money Balance
-   Demo:    Level 5 spawns with +7 nades; Level 6: M79 Only [Aze]
-   Fixed spawn inventory issues for level 5 Support and Gunslinger

-------------------------------------------------------------------------------
### v2.70
+ Fixed an exploit, when players could by unlimited amount of cheap ammunition having $1 left.
+ Modified both Husk Gun's fire modes:
    - Primary fire:
        - Max Impact damage lowered from 750 to 650 (now it can't body-stun SC)
        - Both Initial and Burn damage increased x1.5
            (full charge can deal ~2400 damage over 10s)
        - Damage radius scaling remained the same: 3m single shot, 9m full charge
    - Alternate fire changed to Napalm Launcher:
        - Doesn't deal impact damage at all
        - Burn damage: 5x100 (for comparing: M79: 50, fire nade: 80);
        - Damage radius: 12m
        - Can't be destoyed by Siren's scream
+ LAW rockets can't be detonated by damage < 200
+ LAW rockets detonated by another damage in "point blank" disintegrate, not explode
+ LAW initial rocket count = 16 + 1 rocket per each demo level [Aze]

-------------------------------------------------------------------------------
### v2.60
#### Spawn and Money Balance
-   Demo:    Level 5 spawns with +5 nades; Level 6: +5 nades + M79 [Aze]
-   Firebug: Level 5 spawns with MAC10;    Level 6: Flamer only [Aze]
-   Flamer price raised to 1000 to match spawn value of other perks [Aze]

#### Weapon Balance
- Hand Grenade "Cooking"
- Initial ammo of all 3 Medic Guns lowered down to 1/4 of max ammo [Aze]
- MP7M ammo cost lowered to 6 per magazine (down from 10)
- MP7M 1 bullet penetration [Aze]
- Changed MP5M initial , max  and pickup ammo amount to match magazine size (x32)
    init(200 -> 128), max(400 -> 512), pickup(20 -> 32)
- up to 50% faster reload with MP5/MP7 for Medics
- Firebug receives up to 60% HuskGun charge rate bonus (10% per level)

To be able to cook grenade, each player must change the line in user.ini from:
```
    Aliases[39]=(Command="ThrowGrenade",Alias="ThrowNade")
```
to:
```
    Aliases[39]=(Command="CookGrenade | ThrowGrenade | OnRelease ThrowCookedGrenade",Alias="ThrowNade")
```



-------------------------------------------------------------------------------
### v2.40
#### PERK BALANCE:
-   If perk's bonus level differs from current one, both perks will be drawn on the hud
#### Weapon Balance
-   75% KSG penetration damage reduction after hitting medium-size zeds
    (Bloats and Husks).
    It couldn't penetrate them before (down from 100% reduction).
-   30% reload speed for both M4 rifles (only for bullet magazines, not M203)
-   Commando receives all bonuses for M4-203 too,
    excepting secondary fire (M203).
-   Changed perk descriptions to include IJC weapons and "hidden" bonuses
    [Aze, zy154641833]
-   [TEST] Gived up to 50% reload bonus for Commando's perked weapons
    (other weapons kept at 35%)

-------------------------------------------------------------------------------
### v2.35
- Husk Gun's price dropped down to 3000 (from 4000) [Aze]
- Gunslinger's Cowboy Mode can be activated if Armor drops below 25%
- Gunslinger's weight cap raised by 1 block (11 -> 12)
- Laser MK-23 prices raised from 2000 to 2500 to match Laser-44 price
- M4 3-bullet fixed burst mode (now it has 3 fire modes)
- M4-203 primary fire changed to 3-bullet fixed burst mode
- M203 explosion radius raised to 450 (up from 400)
- KSG shotgun fire rate increased to 0.943s per bullet.
    Now it is a half between original and previous (nerfed) values.
- LOW AMMO WARNING displays if ammo amount in magazine drops below 25% of magazine size
- M79Inc base damage lowered from 80 to 50

-------------------------------------------------------------------------------
### v2.30
- New Firebug's weapon: M79 Incendiary [Aze]
- Husk Gun's weight lowered back to 8
- Shiver kill with FNFAL gives +2 to Commando progress
    (planning to add this feature for all Commando's weapons in the future)
- Healing rate lowered 20% for non-medics (10 -> 8 hp/s)
- Medic now receives healing rate bonus same as healing potency
    (up to 75%, i.e. 14 hp/s for level 6).

-------------------------------------------------------------------------------
### v2.26
50% of Berserker's Melee speed bonus is applied also on Chainsaw,
    but it is scaled from base speed (200) not melee speed (240),
    so Zerker with Chainsaw moves slower than with other melee weapon

-------------------------------------------------------------------------------
### v2.25
Fixed bug, when Sharphooter didn't reveive M14EBR headshot damage bonus

-------------------------------------------------------------------------------
### v2.24
- Lowered CSg recoil [Aze].
    Now it is half between AA12s and old CSG recoil values
- Level 6 demo gets 76% discount on M79/pipes (up from 74%) [Aze]

-------------------------------------------------------------------------------
### v2.23
Disabled skip reload exploit for M99

-------------------------------------------------------------------------------
### v2.20
#### Weapon Balance
- LAW weight changed to 12 (down from 13) to allow carrying Machete
- Totally reworked penetration policy of all shotguns' pellets.
- Raised base penetration count and lowered damage reduction,
    Now shotguns are much better when used off-perk or by low-level supports
- Limited penetration bonus for supports to 60% (down from 90%).
    But together with base penetration increase total damage output
    made by level 6 Support is only slightly lower that it was before.
- Big zeds significantly reduce further penetration damage:
    Bloats and Husks: 25% lower penetration damage (except HSg and CSg);
    SC and FP: 50% lower penetration damage ("double hit bug" is now "x1.5 hit");
    KSG can't penetrate big zeds at all;
    HSg and CSg can penetrate Bloats and Husks without extra damage reduction.
- CSg pellet spread made slightly tighter [Aze], but it's still wider than KSG
- Medic receives magazine size and discount bonuses for KSG shotgun.

-------------------------------------------------------------------------------
### v2.10
##### FN-FAL
- Added 2-bullet fixed burst mode
- Added 1 penetration [Aze]:
    25% damage reduction after hitting small zeds (up to Siren)
    75% damage reduction after hitting big zeds (Bloat, Hust, SC, FP)
- Increased recoil and spread
- Fire rate made slower (0.085700s -> 0.15s);
##### KSG Shotgun
- 30% slower fire rate [DarkFalz]
- 25% penetration damage reduction after hitting big zeds
- weight raised to 7 (up from 6)

-------------------------------------------------------------------------------
### v2.00
#### Global Changes
- Compatible with a new game version (IJC weapons)
- Removed Crossbow & M99 reload speed bonus
#### M99:
- base damage raised to 800 (up from 770) and headshot multiplier to x3 (up from x2.25)
    Now M99 deals exactly double headshot damage comparing to xbow,
    but has significantly higher body damage (to clear the line of small zeds)
- Set SC & FP resistance to M99 to be same as Crossbow:
    -   65% damage resistance for FP
    -   50% damage resistance for SC on Sui+ diff.
        Now SC on Sui+ can't be stunned by M99 bodyshot
- Increased ammo price to $40, giving SS the same discount rate as Crossbow
- Weight increased to 14 (up from 13)

#### GUNSLINGER
-   MK23 added to the perk
-   Removed MK23 penetration
-   Weight increased to 3 blocks (up from 2).
-   Laser-MK23 (simmilar to Laser-44)
-   Both Laser pistols receive 50% spread bonus while laser sights are on


-------------------------------------------------------------------------------
## VERSION 1
-------------------------------------------------------------------------------
### v1.72
#### Spawn and Money Balance
- Chainsaw's price brought back to 1000
- Level 6 Berserker spawns with Chainsaw only (but now it can stun SC)
#### Weapon Balance
-   Berserker looses 25% speed while holding non-melee weapon
-   Berserker looses 50% speed while holding Syringe (up from 30%)
-   Chainsaw's AltFire stuns SC
-   Claymore's swing speed made faster (1.05s -> 0.95s). Now it can chain zed times.
-   Claymore's price raised to 1750.
-   When holding both Claymore and Katana, Katana is switching first.
-   Katana's swing speed made slower (0.67s -> 0.75s).
-   AA12 ammo bonus policy now applied only if bWeaponFix=true

-------------------------------------------------------------------------------
### v1.67
-   Fixed money remainder loosing bug, when pressing full refill in trader menu
    e.g. when you had $100 and needed 3 nades, you received 2 nades, but
    charged $100 instead of $80
-   Changed AA12 ammo bonus policy. Now Support spec. receives +10 bullets per
    each 2 levels (up to 120 total ammo for level 6)

-------------------------------------------------------------------------------
### v1.66
-   Fixed HuskGun's full refill issue in the trader menu, when buying full
    ammo didn't grant bonus ammo for firebug, i.e. Full refil price from 0 to 400
    was shown as $500, but firebug was charged for $800.

-------------------------------------------------------------------------------
### v1.64
-   Magnum's damage lowered to 90 (down froem 105). [Aze]
-   HC's price raised to 750 (up from 500). [Aze]
-   Magnum's price raised to 500 (up from 450). [Aze]
-   Laser-44 can be dropped now. Pickup looks like a single pistol, but who cares? ;)
-   Laser-44 reload rate made faster to compensate damage nerf (now it is the same as Dual-HC)

-------------------------------------------------------------------------------
### v1.62
-   Magnum's ammo cost lowered to 11 (original - 13, previous - 12)
    to make per-bullet price (1.83) slightly lower than HC (1.875)
-   HuskGun's AltFire's blast radius made wider (x5 comparing to single primary shot;
    Full-charged primary shot has x3 wider radius;
    Both impact and burn damages of Alt. and Primary Full-charged fire are the same).
-   Fixed Berserker's damage resistance, if perk level > 6. [zhidd]

-------------------------------------------------------------------------------
### v1.60
-   Support gets a discount on Scrn version of HSg
-   HSg single shell reload reverted back to 1.43s
-   Gunslinger max weight increased from 10 to 11 blocks
-   Dual-HC weight raised from 5 to 6 blocks
-   Fixed Laser-44 dot movement while reloading

-------------------------------------------------------------------------------
### v1.50
-   Fixed bug, when you couldn't pick up 2-nd 44 magnum, if you had only 1 free weight block
-   HSg single shell reload made slower (1.43s -> 1.67s)
-   Flamer finally put back in slot 4 (fixed network replication issue)
-   Dual HC and 44 put in slot 3 for Gunslinger only. Other perks will have them in slot 2.

-------------------------------------------------------------------------------
### v1.40
-   Hunting Shotgun fix

-------------------------------------------------------------------------------
### v1.36
-   Now players can vote config back to whitelisted stuff after playing ScrnBalance
-   Fixed modified prices in trader menu on client side.

-------------------------------------------------------------------------------
### v1.30
-   Fixed Cowboy Mode when using Dual 44 Laser.

-------------------------------------------------------------------------------
### v1.20
-   Fixed the exploit caused by previous fix of "buying/selling dual pistols" exploit
-   Flamer put back to slot 4, M203 -> 3
-   Dual HC/44 are put in Gunslinger's weapon slot 3.

-------------------------------------------------------------------------------
### v1.10
-   Removed melee speed bonus for Support with Welder
-   Max pistol damage bonus nerfed to 50% (down from 60%)
-   Removed HC clip ammo bonus
-   Turning off Dual-44 laser sight doesn't bring back Cowboy Mode immediately.
    Player needs to reload the gun first.
-   Fixed "buying perked duals -> selling offperk" exploit

-------------------------------------------------------------------------------
### v1.00
-   New Perk - **Gunslinger**
-   While holding Welder Support can see door healths at greater distance (up to 30m for level 6)
-   Receives melee speed bonus while holding Welder

-------------------------------------------------------------------------------
### v0.94
Fixed some replication issues.


-------------------------------------------------------------------------------
# Initial Version (v0.90)
-------------------------------------------------------------------------------
## Spawn and Money Balance
### Berserker
-   Level 5 spawns with Axe (instead of Chainsaw)
-   Level 6 spawns with Axe and Chainsaw (instead Armor and Chainsaw on lower diff. or just Chainsaw on sui+)
-   Chainsaw price decreased to 750 (down from 1000) to lower the sell price of lvl6 inventory
-   (and because it is an useless **** anyway)

### Demolitions
-   Level 5 spawns with M79
-   Level 6 spawns with M79 + 3 extra hand grenades
-   Pipebomb discount rate applied on M79 too
-   Fixed ServerPerks LAW rocket and pipebomb price bonuses to match vanilla game
-   M4-203 price lowered to 2k (from 3.5k)
-   M4-203 moved to slot 3.

### Firebug
-   Staring from level 4, firebug can carry 1 more extra flame nade per level
-   So on level 3 he receives flame nades, level 4 - max nades increase to 6, 5 - 7, 6 - 8
-   Level 6 spawn with flamer and 3 extra flame nades (instead of armor)

### Sharpshooter
-   Crossbow's price increased to 1000 (up from 800)
-   Applied standard discount rate on Crossbow (sell value dropped down to 225)

### Support Spec.
-   Hunting Shotgun's price increased to 1000 (up to 750)
-   Combat Shotgun's priced lowered to 1500 (down from 2500)

-------------------------------------------------------------------------------
## Weapon Balance
### Berserker
-   Looses 30% speed while holding the syringe (trying to make him more team-oriented ;))

### Commando
-   Bullpup weight lowered to 5 (down from 6)

### Demolitions
-   Slightly increased LAW damage to kill 6p HoE SC/FP with 2 rockets

### Medic
-   Speed bonus rate changed to 3% per perk level
    up to 18% speed bonus for level 6 (nerfed from 20%)
    speed bonus is the same on all difficulties (no more 25% on Hard-)
-   Medic's Syringe has melee speed bonus now
-   Reset both Medic Guns initial syringe to 0 to remove dropping exploit

### Firebug
-   Flamer moved back to slot 4.

### Support Spec.
-   No more nade damage bonus. However, amount bonus still remains.
-   Movement speed adjusted to default maximum weight, not the current one.
    Now speeds 15/24 = 15/15. Support carrying 24/24 will move slightly slower.
-   While holding Welder Support can see door healths at greater distance
    (up to 30m for level 6)
-   Faster reload for Combat Shotgun (reload time per shell lowered from 0.90s to 0.75s)

-------------------------------------------------------------------------------
## Weapons Balance
_To enable modified weapons you need to add them to the **ServerPerks.ini**._

### M14MBR
-   Slightly increased headshot multiplier (2.25 -> 2.30) to 1-headshot kill 6p HoE Husks and Sirens
-   Green laser dot: AltFire now switches laser modes between RED/GREEN/OFF
-   Last laser state is remembered and restored, when the player next time switches back to M14
-   Laser state can be switched while you are firing or reloading.
-   [CONFIGURABLE] Other player lasers can be always drawn in a blue color.
-   [CONFIGURABLE] Extra laser colors: blue and orange.

### HUSK GUN
-   Added ALT-FIRE mode - instant fires maximum charge, but consumes 25 ammo instead of 10
-   Increased weight from 8 to 10 to match flamer
-   Primary fire consumes ammo while charging (not shooting), so player can follow the charge progress
-   Max ammo count increased from 150 to 250 (240 -> 400 for level 6 firebug)

### Hunting Shotgun
-   Fixed "Auto-Fire" exploit.
-   Fixed "Droppping" exploit.
-   Fixed "Skip Realod" exploit. Now player can't switch weapon until realod ends.
-   Single shell reload now is avaliable


-------------------------------------------------------------------------------
## Gunslinger PERK
New perk supposed to use pistols, especially in Dual mode.
To enable Gunslinger perk you need to add it to the _ServerPerks.ini_.

_"Buying perked duals -> selling offperk"_ exploit fully fixed only in the
ScrN versions of the pistols.

Single pistols are still better in Sharpshooter hands, because he has both base
and perk headshot damage multiplier (up to 140% bonus for level 6).
Gunslinger has only up to 50% damage bonus, but it's applied to the bodyshots
too. Both single and dual 9mm damage bonus is limited to 35%.

Dual pistols are no longer Sharpshooter weapons - he can't level up with them
and doesn't have any damage/reload/recoil bonuses. However, trader discount
bonus is still applied to prohibit potential buying/selling exploits.

Weight modifications were made:
```
Dual-9mm        2 blocks
44 Magnum       3 blocks
Dual 44 Magnum  4 blocks
HandCannon      4 blocks
Dual HC         5 blocks
Laser 44 Magnum 5 blocks (new weapon)
```
Because all Gunslinger perk inventory is light-weight, his max carry weight
is limited to 10.

Magnum44 ammo price lowered from 13 to 12 to match HC per-bullet price.
Magnum44 bullet now is slightly cheaper than HC and that is how it's supposed to be.

Dual HC/44 are put in Gunslinger's weapon slot 3. Other perks still will
have them in slot 2. This is made because usually Gunslinger has too many
pistols in slot 2 and it is compilated to switch between them.

### COWBOY MODE
Starting from level 3 Gunslinger can act in Cowboy mode.
Cowboys use only dual pistols, can't wear armor or use laser sights.
Cowboy mode is switching automatically when all the requirements are met.

Cowboy mode grants Gunslinger following bonuses:
-   25% extra reload bonus for each level (up to 75%)
-   5% speed bonus for each next level (up to 20%)
-   10% fire rate bonus for each next level (up to 30%)
