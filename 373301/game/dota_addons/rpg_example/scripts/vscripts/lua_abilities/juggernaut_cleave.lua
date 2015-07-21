juggernaut_cleave = class({})

function juggernaut_cleave:OnSpellStart()
	local modifierData = {
		duration = self:GetDuration(),
		damage = self:GetCaster():GetAttackDamage() + self:GetAbilityDamage()
	}
	self:GetCaster():AddNewModifier( self:GetCaster(), self, "modifier_juggernaut_blade_fury", modifierData )	
end

