require("prototypes.shortcuts")

data:extend(
		{
			{
				type = "selection-tool",
				name = "lawnmower-lawnmower",
        icon = "__lawn-mower__/graphics/icons/lawn-mower-white-32.png",
				icon_size = 32,
        icon_mipmaps = 0,
				stack_size = 1,
        subgroup = "other",
				selection_color = {r = 0.125, g = 0.447, b = 0.13, a = 0.051},
        alt_selection_color = {r = 0.125, g = 0.447, b = 0.13, a = 0.051},
				selection_mode = {"nothing"},
        alt_selection_mode = {"nothing"},
				selection_cursor_box_type = "not-allowed",
        alt_selection_cursor_box_type = "not-allowed",
				flags = { "only-in-cursor", "hidden", "not-stackable", "spawnable" },
			}
		}
	)