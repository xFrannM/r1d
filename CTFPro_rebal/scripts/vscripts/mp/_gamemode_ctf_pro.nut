function main()
{
	IncludeFile( "mp/capture_the_flag" )
	SetRoundBased( true )
	SetAttackDefendBased( true )

	Globalize( AnyPlayerHasEnemyFlag )

	level.classicMPDropshipIntroLength = CLASSIC_MP_DROPSHIP_IDLE_ANIM_TIME - 2.0
	level.ctf_pro_evac_started <- false

	switch( GetMapName() )
	{
		case "mp_swampland":
		case "mp_airbase":
		case "mp_angel_city":
		case "mp_harmony_mines":
		case "mp_haven":
		case "mp_o2":
  		case "mp_outpost_207":
		case "mp_smugglers_cove":
			level.nv.attackingTeam = TEAM_IMC
			DisableDropshipSpawnForTeam( TEAM_MILITIA )
			break

		default:
			level.nv.attackingTeam = TEAM_MILITIA
			DisableDropshipSpawnForTeam( TEAM_IMC )
			break
	}

	AddCallback_GameStateEnter( eGameState.SwitchingSides, CTF_Pro_SwitchingSidesEnter )
	AddCallback_GameStateEnter( eGameState.Prematch, CTF_Pro_PrematchEnter )
	AddCallback_GameStateEnter( eGameState.WinnerDetermined, CTF_Pro_PrematchWinnerDetermined )
}

function AnyPlayerHasEnemyFlag()
{
    local players = GetPlayerArray()
    foreach (player in players)
    {
        if (PlayerHasEnemyFlag(player))
        {
            printt("[CTF PRO] Jugador con bandera encontrada: ", player)
            return true
        }
    }
    printt("[CTF PRO] Ningún jugador tiene la bandera enemiga.")
    return false
}

function CTF_Pro_SwitchingSidesEnter()
{
	switch( GetMapName() )
	{
		case "mp_swampland":
		case "mp_airbase":
		case "mp_angel_city":
		case "mp_harmony_mines":
		case "mp_haven":
		case "mp_o2":
		case "mp_outpost_207":
		case "mp_smugglers_cove":
			EnableDropshipSpawnForTeam( TEAM_MILITIA )
			DisableDropshipSpawnForTeam( TEAM_IMC )
			break

		default:
			EnableDropshipSpawnForTeam( TEAM_IMC )
			DisableDropshipSpawnForTeam( TEAM_MILITIA )
			break
	}
}


function EntitiesDidLoad()
{
	FlagClear( "EvacEndsMatch" )
}

function CTF_Pro_PrematchEnter()
{
	SetGlobalForcedDialogueOnly( false ) //Reset from evac from previous round
	foreach( player in GetPlayerArray() )
	{
		SetPlayerForcedDialogueOnly( player, false )
	}

	//HideEvacShipIconOnMinimap()
	ClearTeamActiveObjective( TEAM_IMC )
	ClearTeamActiveObjective( TEAM_MILITIA )
	level.ctf_pro_evac_started = false
	FlagClear( "EvacFinished" )
}

function CTF_Pro_PrematchWinnerDetermined()
{
	FlagSet( "EvacFinished" )
}
