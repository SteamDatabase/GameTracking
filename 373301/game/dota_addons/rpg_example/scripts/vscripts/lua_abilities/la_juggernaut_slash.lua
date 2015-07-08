la_juggernaut_slash = class({})

function la_juggernaut_slash:StopSwingGesture()
	if self.nCurrentGesture ~= nil then
		self:GetCaster():RemoveGesture( self.nCurrentGesture )
		self.nCurrentGesture = nil
	end
end

function la_juggernaut_slash:StartSwingGesture( nAction )
	if self.nCurrentGesture ~= nil then
		self:GetCaster():RemoveGesture( self.nCurrentGesture )
	end
	self.nCurrentGesture = nAction
	self:GetCaster():StartGesture( nAction )
end

function la_juggernaut_slash:OnAbilityPhaseStart()
	local result = self.BaseClass.OnAbilityPhaseStart( self )
	if result then
		self:StartSwingGesture( ACT_DOTA_ATTACK )
	end
	return result
end

function la_juggernaut_slash:OnAbilityPhaseInterrupted()
	self:StopSwingGesture()
end

function la_juggernaut_slash:OnSpellStart()
	ApplyDamage( {
		victim = self:GetCursorTarget(),
		attacker = self:GetCaster(),
		damage = self:GetAbilityDamage(),
		damage_type = DAMAGE_TYPE_PHYSICAL,
		damage_flags = DOTA_DAMAGE_FLAG_NONE,
		ability = self
	} )
end

function la_juggernaut_slash:GetCastRange( vLocation, hTarget )
	return 128
end
