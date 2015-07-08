la_juggernaut_cleave = class({})

function la_juggernaut_cleave:OnSpellStart()
	self:GetCaster():AddNewModifier( self:GetCaster(), self, "modifier_juggernaut_blade_fury", { duration = self:GetDuration(), damage = self:GetAbilityDamage() } )	
end

