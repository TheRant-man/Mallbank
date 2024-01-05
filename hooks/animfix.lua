local ids_movement = Idstring("movement")
local civ_empty = Idstring("civilian/empty")

Hooks:PostHook(CopBase, "chk_freeze_anims", "lies_prevent_softlock", function(self)	
	if self._unit:anim_state_machine():segment_state(Idstring("base")) == civ_empty then
		local full_body_action = self._ext_movement:get_action(1)
		
		if full_body_action and full_body_action:type() == "act" then
			if not full_body_action:expired() then
				full_body_action._expired = true
			end
			
			if self._ext_movement._need_upd ~= true then
				self._ext_movement._need_upd = true
				 
				self._unit:set_extension_update_enabled(ids_movement, self._ext_movement._need_upd)
			end
		end
		
		if not self._unit:brain()._logic_data or self._unit:brain()._logic_data.cool then
			if not self._ext_movement:play_redirect("exit") then
				self._ext_movement:play_redirect("idle")
			end
		else
			self._ext_movement:play_redirect("idle")
		end
	end
end)