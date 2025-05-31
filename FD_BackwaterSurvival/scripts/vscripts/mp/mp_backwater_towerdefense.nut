// NOTE this gets run on both client and server!
function main()
{
	Assert( GAMETYPE == COOPERATIVE )
	Backwater_SetupRoutesAndPositions()

	Backwater_SetupWaveSpawns()
	//TestWaves()

  if ( IsServer() )
    SetCustomWaveSpawn_SideView( Vector( 91, -934, 300 ), Vector( 0, 45, 0 ) )

	//set the custom wave spawn anim
	//if ( IsServer() )
    //	SetCustomWaveSpawn_SideView( optionalOrigin, optionalAngles )
}

function Backwater_SetupRoutesAndPositions()
{
	if ( !IsServer() )
		return

    	SetCustomPlayerDropshipSpawn( TEAM_MILITIA, Vector( 1373.989746, -2004.885376, 1472.339722 ), Vector( 0, -88, 0 ))

		local oneRoute = [ Vector( 5044, -2999, 120 ) ]
		TowerDefense_AddRoute( oneRoute )

		//left side from hill, down center
		local twoRoute = [ Vector(3029.368408, -1234.211670, -14.351871) ]
		TowerDefense_AddRoute( twoRoute, "twoRoute" )

		//right side
		local threeRoute = [ Vector( 3029.368408, -1234.211670, -14.351871 ), Vector ( -315, -119, -147 ), Vector ( 1052, 55, -91 ) ]
		TowerDefense_AddRoute( threeRoute )

		//right side through town, down center
		local fourRoute = [ Vector( -1592, -5499, -182 ), Vector ( -1561, -3388, 70 ),  Vector( -1100, -2091, 140 ),  Vector( 252, -2097, 118 ),  Vector( 1399, -1478, 256 ),  Vector( 1389, -1042, 122 ) ]
		TowerDefense_AddRoute( fourRoute, "fourRoute" )

		local fiveRoute = [ Vector( 3029.368408, -1234.211670, -14.351871 ) ]
		TowerDefense_AddRoute( fiveRoute, "fiveRoute" )

		local sixRoute = [ Vector ( 1411.738037, 69.604996, -68.774902 ) ]
		TowerDefense_AddRoute( sixRoute, "sixRoute" )

		local sevenRoute = [ Vector( -379.660614, -1366.129150, 93.077972 ) ]
		TowerDefense_AddRoute( sevenRoute, "sevenRoute" )

		TowerDefense_AddGeneratorLocation( Vector( 1381, -3049, 527 ), Vector( 0, -180, 0 ) )

	AddLoadoutCrate( level.nv.attackingTeam, Vector(2310.772461, -3210.330322, 344.635864), Vector( 0, 72, 0 ) )
	AddLoadoutCrate( level.nv.attackingTeam, Vector( 1553, -1902, 552 ), Vector( 0, 180, 0 ) )

	AddStationaryTitanPosition( Vector( 3837, -4119, 87 ) )
	AddStationaryTitanPosition( Vector( 4836, -3284, 98 ) )
	//AddStationaryTitanPosition( Vector( -360, -3486, 59 ) )
	AddStationaryTitanPosition( Vector( -2629, -1508, 314 ) )
	AddStationaryTitanPosition( Vector( 4715, -3807, 171 ) )
	AddStationaryTitanPosition( Vector( 4928, -2320, 97 ) )
	AddStationaryTitanPosition( Vector( 5136, -4087, 250 ) )
	AddStationaryTitanPosition( Vector( -418, -5301, -128 ) )
	AddStationaryTitanPosition( Vector( -905, -4801, -113 ) )
	AddStationaryTitanPosition( Vector( -38, -6120, 103 ) )



/*	TowerDefense_AddSniperLocation( Vector( -2740, 2109, 1040 ), 	-90 		)
	TowerDefense_AddSniperLocation( Vector( -2065, 987, 704 ), 		-112 		)
	TowerDefense_AddSniperLocation( Vector( -384, -208, 528 ), 	180 			)
	TowerDefense_AddSniperLocation( Vector( -383, -37, 528 ), 		180 		)
	TowerDefense_AddSniperLocation( Vector( -530, 328, 704 ), 	-174 			)
	TowerDefense_AddSniperLocation( Vector( 1150, 1608, 1195 ), 		-140	)
	TowerDefense_AddSniperLocation( Vector( 1204, 1162, 740 ), 	-140 			)
	TowerDefense_AddSniperLocation( Vector( 425, 1458, 776 ), 		-177	 	)
	TowerDefense_AddSniperLocation( Vector( -3252, 2186, 1040 ), 		-77 	)
	TowerDefense_AddSniperLocation( Vector( -2109, 2346, 1200 ), 	-104 		)
	TowerDefense_AddSniperLocation( Vector( -743, -44, 256 ), 	178 			)
*/
}


/***************************************************\

	TowerDefense_AddWave 	// creates the wave you will fill with events (spawns, pauses)
	Wave_AddSpawn 			// adds a spawn event to the wave (see spawner legend below)
	Wave_AddPause 			// adds a timed pause to the wave (secs)
	Wave_SetBreakTime 		// sets a custom break time between this wave and the next

					WAVE SPAWNER LEGEND

		TD_SpawnGruntSquad						-> 4 grunts
		TD_SpawnSpectreSquad					-> 4 spectres
		TD_SpawnSuicideSpectreSquad				-> 4 suicide spectres
		TD_SpawnSpectreSquadWithSingleSuicide	-> 3 spectres, 1 suicide spectre ( better option than 4 suicide spectres because they won't clump up )
		TD_SpawnGruntSquadDroppod
		TD_SpawnGruntSquadDropship
		TD_SpawnSpectreSquadDroppod
		TD_SpawnSpectreSquadDropship
		TD_SpawnSuicideSpectreSquadDroppod
		TD_SpawnSuicideSpectreSquadDropship
		TD_SpawnSpectreSquadWithSingleSuicideDroppod
		TD_SpawnSpectreSquadWithSingleSuicideDropship
		TD_SpawnSniper1x						-> 1 sniper spectre ( droppod )
		TD_SpawnSniper2x						-> 2 sniper spectres ( droppod )
		TD_SpawnSniper3x						-> 3 sniper spectres ( droppod )
		TD_SpawnSniper4x						-> 4 sniper spectres ( droppod )
		TD_SpawnTitan							-> 1 random regular titan
		TD_SpawnNukeTitan						-> 1 nuke titan
		TD_SpawnMortarTitan						-> 1 mortar titan
		TD_SpawnCloakedDrone							-> 1 cloak drone

\***************************************************/
function TestWaves()
{
	if ( IsClient() )
		return

	local wave = TowerDefense_AddWave()
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )

	local wave = TowerDefense_AddWave()
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )

	local wave = TowerDefense_AddWave()
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )

	local wave = TowerDefense_AddWave()
	Wave_AddSpawn( wave, TD_SpawnNukeTitan )
	Wave_AddSpawn( wave, TD_SpawnNukeTitan )
}

function Backwater_SetupWaveSpawns()
{
	if ( IsClient() )
		return

	//Survival mode
	local wave = TowerDefense_AddWave()
	// Wave 1: Easy - Only level 1 AI
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddPause( wave, 6 )

	// Wave 2: Slightly harder - More level 1 AI
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnEmpTitan )
	Wave_AddPause( wave, 6)

	// Wave 7: Higher difficulty, all levels mixed
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSuicideSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSuicideSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSniper3x )
	Wave_AddSpawn( wave, TD_SpawnGruntSquadDroppod )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnEmpTitan)
	Wave_AddPause( wave, 6 )

	// Wave 8: Hardest, all types, short pause
	Wave_AddSpawn( wave, TD_SpawnGruntSquadDropship )
	Wave_AddSpawn( wave, TD_SpawnGruntSquadDropship )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquadDropship )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquadDropship )
	Wave_AddSpawn( wave, TD_SpawnSuicideSpectreSquadDropship )
	Wave_AddSpawn( wave, TD_SpawnSniper4x )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquadWithSingleSuicideDropship )
	Wave_AddPause( wave, 6 )

	// Wave 9: Introduce first Titan, longer pause for players to adapt
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddPause( wave, 10 )

	// Wave 11: Two Titans, more AI
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnSuicideSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSuicideSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSniper2x )
	Wave_AddPause( wave, 8 )

	// Wave 12: Add Nuke Titan, mix with other AI
	Wave_AddSpawn( wave, TD_SpawnNukeTitan )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquadWithSingleSuicide )
	Wave_AddSpawn( wave, TD_SpawnGruntSquadDroppod )
	Wave_AddPause( wave, 8 )

	// Wave 13: Two Titans, one is Nuke, more AI
	Wave_AddSpawn( wave, TD_SpawnNukeTitan )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnSniper3x )
	Wave_AddSpawn( wave, TD_SpawnSuicideSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSuicideSpectreSquad )
	Wave_AddPause( wave, 7 )

	// Wave 14: Introduce Mortar Titan, mix with others
	Wave_AddSpawn( wave, TD_SpawnMortarTitan )
	Wave_AddSpawn( wave, TD_SpawnMortarTitan )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquadDropship )
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddPause( wave, 7 )

	// Wave 15: Two Mortar Titans, Nuke Titan, heavy AI
	Wave_AddSpawn( wave, TD_SpawnMortarTitan )
	Wave_AddSpawn( wave, TD_SpawnMortarTitan )
	Wave_AddSpawn( wave, TD_SpawnNukeTitan )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnSniper4x )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquadWithSingleSuicideDropship )
	Wave_AddPause( wave, 6 )

	// Wave 16: All Titan types, heavy AI, short pause
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnNukeTitan )
	Wave_AddSpawn( wave, TD_SpawnMortarTitan )
	Wave_AddSpawn( wave, TD_SpawnGruntSquadDropship )
	Wave_AddSpawn( wave, TD_SpawnSuicideSpectreSquadDropship )
	Wave_AddSpawn( wave, TD_SpawnSniper4x )
	Wave_AddPause( wave, 5 )

	// Wave 17: Mostly regular AI, one Titan
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnGruntSquadDroppod )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquadWithSingleSuicide )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddPause( wave, 6 )

	// Wave 18: Mix of AI, two Titans, no mortar
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSuicideSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSniper2x )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnNukeTitan )
	Wave_AddPause( wave, 6 )

	// Wave 19: Heavy AI, one Mortar Titan
	Wave_AddSpawn( wave, TD_SpawnGruntSquadDropship )
	Wave_AddSpawn( wave, TD_SpawnGruntSquadDropship )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquadDropship )
	Wave_AddSpawn( wave, TD_SpawnSuicideSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnMortarTitan )
	Wave_AddSpawn( wave, TD_SpawnMortarTitan )
	Wave_AddPause( wave, 7 )

	// Wave 20: Mostly AI, two Titans, no mortar
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquadWithSingleSuicide )
	Wave_AddSpawn( wave, TD_SpawnSniper3x )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnNukeTitan )
	Wave_AddPause( wave, 6 )

	// Wave 21: AI focus, one Mortar Titan, one regular Titan
	Wave_AddSpawn( wave, TD_SpawnGruntSquadDroppod )
	Wave_AddSpawn( wave, TD_SpawnGruntSquadDroppod )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSuicideSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnMortarTitan )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddPause( wave, 7 )

	// Wave 22: Heavy AI, one Nuke Titan
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquadWithSingleSuicide )
	Wave_AddSpawn( wave, TD_SpawnEmpTitan)
	Wave_AddSpawn( wave, TD_SpawnEmpTitan)
	Wave_AddSpawn( wave, TD_SpawnSniper4x )
	Wave_AddSpawn( wave, TD_SpawnNukeTitan )
	Wave_AddPause( wave, 6 )

	// Wave 23: AI and two Titans, no mortar
	Wave_AddSpawn( wave, TD_SpawnGruntSquadDropship )
	Wave_AddSpawn( wave, TD_SpawnGruntSquadDropship )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquadDropship )
	Wave_AddSpawn( wave, TD_SpawnSuicideSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnEmpTitan )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnNukeTitan )
	Wave_AddPause( wave, 6 )

	// Wave 24: AI focus, one Mortar Titan, one Nuke Titan
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnGruntSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquad )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquadWithSingleSuicide )
	Wave_AddSpawn( wave, TD_SpawnNukeTitan )
	Wave_AddSpawn( wave, TD_SpawnNukeTitan )
	Wave_AddSpawn( wave, TD_SpawnNukeTitan )
	Wave_AddSpawn( wave, TD_SpawnMortarTitan )
	Wave_AddSpawn( wave, TD_SpawnNukeTitan )
	Wave_AddPause( wave, 7 )

	// Wave 25: Final wave, heavy AI, all Titan types
	Wave_AddSpawn( wave, TD_SpawnGruntSquadDropship )
	Wave_AddSpawn( wave, TD_SpawnGruntSquadDropship )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquadDropship )
	Wave_AddSpawn( wave, TD_SpawnSpectreSquadDropship )
	Wave_AddSpawn( wave, TD_SpawnSuicideSpectreSquadDropship )
	Wave_AddSpawn( wave, TD_SpawnSniper4x )
	Wave_AddSpawn( wave, TD_SpawnNukeTitan )
	Wave_AddSpawn( wave, TD_SpawnNukeTitan )
	Wave_AddSpawn( wave, TD_SpawnEmpTitan )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnTitan )
	Wave_AddSpawn( wave, TD_SpawnNukeTitan )
	Wave_AddSpawn( wave, TD_SpawnMortarTitan )
	Wave_AddPause( wave, 10 )
}