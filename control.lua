function clear_area(surface, area, range)
  local range = range or 0
  if range > 0 then
    area.left_top.x = area.left_top.x - range
    area.left_top.y = area.left_top.y - range
    area.right_bottom.x = area.right_bottom.x + range
    area.right_bottom.y = area.right_bottom.y + range
  end
  surface.destroy_decoratives({area = area})
  local corpses = surface.find_entities_filtered({area = area, type="corpse"})
  for _, corpse in pairs(corpses) do
    corpse.destroy()
  end
end

-- EVENTS

function on_selected_area(event, alt_selected)
  if (event.item ~= "lawnmower-lawnmower") then return end
  
  local surface = event.surface
  local area = event.area
  
  clear_area(surface, area)
end

script.on_event(defines.events.on_player_selected_area, function(event)
  on_selected_area(event, false)
end)

script.on_event(defines.events.on_player_alt_selected_area, function(event)
  on_selected_area(event, true)
end)

script.on_event(defines.events.on_built_entity, function(event)
  if event.entity == nil or event.entity.type == "entity-ghost" or event.entity.type == "tile-ghost" or not event.entity.prototype.selectable_in_game then return end
  local surface = game.surfaces[event.entity.surface_index]
  local area = event.entity.selection_box
  
  clear_area(surface, area, storage.settings.lawnmower_building_clear_range)
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
  if event.entity.type == "entity-ghost" or event.entity.type == "tile-ghost" or not event.entity.prototype.selectable_in_game then return end
  local surface = game.surfaces[event.entity.surface_index]
  local area = event.entity.selection_box
  
  clear_area(surface, area, storage.settings.lawnmower_building_clear_range)
end)

script.on_event(defines.events.script_raised_built, function(event)
  if event.entity.type == "entity-ghost" or event.entity.type == "tile-ghost" or not event.entity.prototype.selectable_in_game then return end
  local surface = game.surfaces[event.entity.surface_index]
  local area = event.entity.selection_box
  
  clear_area(surface, area, storage.settings.lawnmower_building_clear_range)
end)

script.on_event(defines.events.script_raised_revive, function(event)
  if event.entity.type == "entity-ghost" or event.entity.type == "tile-ghost" or not event.entity.prototype.selectable_in_game then return end
  local surface = game.surfaces[event.entity.surface_index]
  local area = event.entity.selection_box
  
  clear_area(surface, area, storage.settings.lawnmower_building_clear_range)
end)

-- SETTINGS & INITIALIZATION

script.on_event(defines.events.on_runtime_mod_setting_changed, function(event)
  if event.setting ~= "lawnmower-building-clear-range" then return end
  storage.settings = {}
  storage.settings.lawnmower_building_clear_range = settings.global["lawnmower-building-clear-range"].value
end)

script.on_init(function()
  storage.settings = {}
  storage.settings.lawnmower_building_clear_range = settings.global["lawnmower-building-clear-range"].value
end)