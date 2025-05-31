
self.s.damageValue <- self.GetWeaponInfoFileKeyField( "damage_near_value" )
SmartAmmo_SetAllowUnlockedFiring( self, true )
SmartAmmo_SetUnlockAfterBurst( self, (SMART_AMMO_PLAYER_MAX_LOCKS > 1) )
//SmartAmmo_SetWarningIndicatorDelay( self, (SMART_AMMO_PLAYER_MAX_LOCKS - 1) * 0.25 )

// things that
function InitForAllClients()
{
	SmartAmmo_SetWarningIndicatorDelay( self, 9999.0 )
}

function OnWeaponActivate( activateParams )
{
	//SmartAmmo_Start( self )
}

function OnWeaponDeactivate( deactivateParams )
{
	//SmartAmmo_Stop( self )
}
function OnWeaponPrimaryAttack( attackParams )
{
	SmartWeaponFireSound(self)
	self.FireWeaponBullet( attackParams.pos, attackParams.dir, 1, damageTypes.Instant | damageTypes.Bullet | DF_MAX_RANGE )
	return true
}

function OnWeaponStartZoomIn()
{
	HandleWeaponSoundZoomIn( self, "Weapon_P2011.ADS_In" )
}


function OnWeaponStartZoomOut()
{
	HandleWeaponSoundZoomOut( self, "Weapon_P2011.ADS_Out" )
}

function SmartWeaponFireSound( weapon )
{
	if ( weapon.HasMod( "silencer" ) )
	{
		EmitSoundOnEntity( weapon, "Weapon_SmartPistol.SuppressedFire_Layer1" )
	}
	else
	{
		EmitSoundOnEntity( weapon, "Weapon_SmartPistol.Fire" )
	}
}

InitForAllClients()
