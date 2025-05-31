# CTFPro Rebalance Addon

You can launch this gamemode through Console only (set the keybind on in-game keyboard settings if not assigned yet)

There are two ways to launch:
ON RECOMMENDED MAPS: launchplaylist ctf; mp_gamemode ctfp
ON YOUR DESIRED MAP: launchplaylist ctf; mp_gamemode ctfp; map mp_MAP
(being mp_MAP the map you want to play)
you can see all the maps if you write in console "map mp" and take a look at the autocomplete (you can move through the options with arrow keys)

## Description

This addon aims to balance Capture the Flag PRO cut gamemode, to make it less defender-sided and fix a few issues & bugs:

# 

More chances to evac!
- **Flag return disabled** // it was pretty easy to return and pretty hard to comeback from attacker's perspective
- **Extra time to evacuate** // it wasn't enough time before, and also creates more scenarios in which the attacker team has to defend the evac point until the dropship is there
- **Indestructible dropship to prevent defenders team abuse** // it was pretty easy to just coordinate and start spamming the dropship to win each round

Some balances on gameplay! // WARNING: changing match setting on the private match will replace these three!
- **Players have 1 grenade instead of 2** // because fuck grenade spam
- **Respawn timer set to 6 seconds (instead of 2/3 secs)** // I mean why killing if defenders can insta-spawn
- **Titans disabled** // because fuck titans on CTF

Some logic changes!
- **FIXED: Now the round does not end when you pull the flag** // now round time limit won't end the round during an evac
- **Round timer is updated to display 50secs when you pull the flag**
- **If no flag is pulled, defenders win** // it was a draw before, that does not make sense

Some map changes!
- **Flag positions reverted on some maps for better gameplay** // some evacs were ugly the other way
- **Some less enjoyable maps have been excluded** // maps that do not have cool evac points -- this feature is for dedicated servers only

---

### Known Impacts when using this mod

For server hosts in general:
- **The CTF playlist has titans disabled by default** // you can still enable them in private match settings

For dedicated server hosts:
- **This addon removes several maps from normal CTF mode so your CTF rotation might feel limited**

---

Known bugs (this is on the actual game, not due to the bug)
- After you die you won´t have any visual feedback on the UI on the dropship evac point nor timing (it is only visible through the minimap evac icon and the timer I edited on the bottom left)
- If for some reason all the attackers die at the same time during evac process, the evac will be canceled and it will stay with the time on 00:00 forever (you have to force the win through console or just reload the map)

Enjoy!
