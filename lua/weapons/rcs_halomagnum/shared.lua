if (SERVER) then

	AddCSLuaFile( "shared.lua" )
	SWEP.Weight				= 5

end

if ( CLIENT ) then
	SWEP.PrintName			= "M6D Magnum"	
	SWEP.Author				= "kuropixel"
	SWEP.SlotPos			= 2
	SWEP.Slot				= 1
	SWEP.ViewModelFlip		= false
	SWEP.ViewModelFOV		= 90
	SWEP.DefaultVFOV		= 90
	SWEP.NameOfSWEP			= "rcs_halomagnum"
end

SWEP.Category				= "Halo"
SWEP.Base					= "rcs_base_pistol"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.HoldType			= "pistol"
SWEP.ViewModel			= "models/Weapons/v_m6d.mdl"
SWEP.WorldModel			= "models/Weapons/w_m6d.mdl"
SWEP.Penetrating = true
SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.Sound			= Sound( "weapons/pistol_fire.wav" )
SWEP.Primary.Recoil			= 1
SWEP.Primary.Damage			= 15
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.001 --starting cone, it WILL increase to something higher, so keep it low
SWEP.Primary.ClipSize		= 12
SWEP.Primary.Delay			= 0.19
SWEP.Primary.DefaultClip	= 80
SWEP.Primary.MaxReserve		= 35
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "pistol"

SWEP.Primary.MaxSpread		= 0.15 --the maximum amount the spread can go by, best left at 0.20 or lower
SWEP.Primary.Handle			= 0.5 --how many seconds you have to wait between each shot before the spread is at its best
SWEP.Primary.SpreadIncrease	= 0.21/15 --how much you add to the cone after each shot

SWEP.MoveSpread				= 6 --multiplier for spread when you are moving
SWEP.JumpSpread				= 10 --multiplier for spread when you are jumping
SWEP.CrouchSpread			= 0.5 --multiplier for spread when you are crouching

SWEP.DryFires				= true

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IronSightsPos = Vector (-5.6509, -8.5018, 2.6222)
SWEP.IronSightsAng = Vector (0.1385, -0.3078, 1.2868)

function SWEP:Initialize()

		self:SetWeaponHoldType(self.HoldType)
end

function SWEP:ShootBullet( damage, num_bullets, aimcone )	
	local bullet = {}
	bullet.Num 		= num_bullets
	bullet.Src 		= self.Owner:GetShootPos()
	bullet.Dir 		= self.Owner:GetAimVector()
	bullet.Spread 		= Vector( aimcone, aimcone, 0 )
	bullet.Tracer		= 5
	bullet.Force		= 0
	bullet.Damage		= 19
	bullet.AmmoType 	= self.Primary.Ammo
	self.Owner:FireBullets( bullet )
	self:ShootEffects()
	
end

function SWEP:ShootEffects()
	self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
	self.Owner:MuzzleFlash()
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
end

function SWEP:Deploy()
	self.Weapon:EmitSound(Sound("weapons/pistol_ready.wav"))
end

function SWEP:Reload()
	self.Weapon:EmitSound(Sound("weapons/pistol_reload.wav"))
	self.Weapon:DefaultReload(ACT_VM_RELOAD)
end