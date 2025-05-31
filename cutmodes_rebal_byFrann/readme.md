# Cutmodes Rebalance Addon 

## Description

This addon aims to balance Capture the Flag PRO, Scavenger and Titan Tag, all three cut gamemodes:

## How to run these gamemodes?

You can launch these gamemodes through Console only (set the keybind on in-game keyboard settings if not assigned yet)

To know the list of maps available you can write "map mp" and see all the autocomplete suggestions

Capture the Flag PRO:
launchplaylist ctf; mp_gamemode ctfp (this is to launch on our recommended maps only)
launchplaylist ctf; mp_gamemode ctfp; map mp_MAP (being mp_MAP the map you want to play) 

Scavenger:
launchplaylist at; mp_gamemode scv (this is to launch on our recommended maps only)
launchplaylist at; mp_gamemode scv; map mp_MAP (being mp_MAP the map you want to play) 

Titan Tag:
launchplaylist ps; mp_gamemode tt (this is to launch on our recommended maps only)
launchplaylist ps; mp_gamemode tt; map mp_MAP (being mp_MAP the map you want to play) 

## Changes on CTF PRO
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
- **Some less enjoyable maps have been excluded** // maps that do not have cool evac points

---

## Changes on Scavenger

- **Amount of minerals lowered** // there were a lot so this will make the game more tactical
- **Slow down mineral spawn speed**
- **Exclude some unplayable maps** // on some maps the minerals spawn is fucked up

---

## Changes on Titan Tag

- **Change pilot kill score from 4 to 1** // shit was ending too fast and was too proplayer-sided
- **No AI on the game** // you were able to win points when killing AI before

---

# Known Impacts when using this mod

For server hosts in general:
- **The CTF playlist has titans disabled by default** // you can still enable them in private match settings

For dedicated server hosts:
- **This addon removes several maps from normal CTF mode so your CTF rotation might feel limited**
