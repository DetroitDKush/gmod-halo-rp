--REAL sg552
--sorry for no comments to show what everything does im too lazy to do it LOL!

if (SERVER) then

	AddCSLuaFile( "shared.lua" )
	SWEP.Weight				= 5
	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false

end

if ( CLIENT ) then
	SWEP.PrintName			= "MA5B"	
	SWEP.Author				= "dog"
	SWEP.DrawAmmo			= true
	SWEP.DrawCrosshair		= false
	SWEP.ViewModelFOV		= 82
	SWEP.CSMuzzleFlashes	= true
	SWEP.SlotPos			= 1
	SWEP.NameOfSWEP			= "rcs_ma5b" 
end

SWEP.Category				= "Halo"
SWEP.Base					= "rcs_base_1scope"
SWEP.Penetrating = true
SWEP.Spawnable				= true
SWEP.ViewModelFlip		= false
SWEP.AdminSpawnable			= true
SWEP.HoldType			= "ar2"
SWEP.ViewModel			= "models/weapons/v_ma5b.mdl"
SWEP.WorldModel			= "models/weapons/W_ma5b.mdl"

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Sound			= Sound( "weapons/aafire1.wav" )
SWEP.Primary.Recoil			= 0.25
SWEP.Primary.Damage			= 32
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.001 --starting cone, it WILL increase to something higher, so keep it low
SWEP.Primary.ClipSize		= 60
SWEP.Primary.Delay			= 0.085
SWEP.Primary.DefaultClip	= 180
SWEP.Primary.MaxReserve		= 90
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"
SWEP.Zoom					= "no"
SWEP.Zoom1					= 40

SWEP.Primary.MaxSpread		= 0.15 --the maximum amount the spread can go by, best left at 0.20 or lower
SWEP.Primary.Handle			= 0.5 --how many seconds you have to wait between each shot before the spread is at its best
SWEP.Primary.SpreadIncrease	= 0.21/15 --how much you add to the cone after each shot

SWEP.Primary.Zoom1MaxSpread		= 0.1 --the maximum amount the spread can go by, best left at 0.20 or lower
SWEP.Primary.Zoom1Handle			= 0.3 --how many seconds you have to wait between each shot before the spread is at its best
SWEP.Primary.Zoom1SpreadIncrease	= 0.15/15 --how much you add to the cone after each shot

SWEP.Zoom0Cone				= 0.07 --cone when not zoomed
SWEP.Zoom0Delay				= 0.10 --delay when not zoomed

SWEP.Zoom1Cone				= 0.0005 --cone when zoomed
SWEP.Zoom1Delay				= 0.15 --delay when zoomed

SWEP.MoveSpread				= 6 --multiplier for spread when you are moving
SWEP.JumpSpread				= 10 --multiplier for spread when you are jumping
SWEP.CrouchSpread			= 0.5 --multiplier for spread when you are crouching


SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= true
SWEP.Secondary.Ammo			= "none"


SWEP.IronSightsPos = Vector (5.741, -3.7658, 3.2987)
SWEP.IronSightsAng = Vector (0.8252, -2.6023, -0.1554)

function SWEP:ShootBullet( damage, num_bullets, aimcone )	
	local bullet = {}
	bullet.Num 		= num_bullets
	bullet.Src 		= self.Owner:GetShootPos()
	bullet.Dir 		= self.Owner:GetAimVector()
	bullet.Spread 	= Vector( aimcone, aimcone, 0 )
	bullet.Tracer	= 5
	bullet.Force	= 0
	bullet.Damage	= self.Primary.Damage
	bullet.AmmoType = "smg1"
	self.Owner:FireBullets( bullet )
	self:ShootEffects()
	
end

function SWEP:ShootEffects()
	self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
	self.Owner:MuzzleFlash()
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
end

function SWEP:Reload()
		self.Weapon:EmitSound(Sound("weapons/ar_reload.wav"))
		self.Weapon:DefaultReload(ACT_VM_RELOAD)
end

function SWEP:Deploy()
	self.Weapon:EmitSound(Sound("weapons/ar_ready.wav"))
end