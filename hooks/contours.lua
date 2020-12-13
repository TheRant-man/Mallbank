local material_config_paths = {
  "units/pd2_mod_friday/characters/npc_manager/npc_manager",
  "units/pd2_mod_friday/characters/ene_security_fri_1/ene_security_fri_1"
}

for i, material_config_path in pairs(material_config_paths) do
  local normal_ids = Idstring(material_config_path)
  local contour_ids = Idstring(material_config_path .. "_contour")

  CopBase._material_translation_map[tostring(normal_ids:key())] = contour_ids
  CopBase._material_translation_map[tostring(contour_ids:key())] = normal_ids 
end