local function node_exist(table,node)
	for key,value in pairs(table) do
		if value == node.name then
		return true
		end
	end
return false
end 

local function fix_trunks(pos,size)
	if size == 1 then
		for i = 0,1  do minetest.set_node({x = pos.x,y = pos.y + i,z = pos.z},{name = "air"}) end
	elseif size == 2 then
		for i = 0,4  do minetest.set_node({x = pos.x,y = pos.y + i,z = pos.z},{name = "air"}) end
	elseif size == 3 then
		for i = 0,7  do minetest.set_node({x = pos.x,y = pos.y + i,z = pos.z},{name = "air"}) end
	elseif size == 4 then
		for i = 0,11 do minetest.set_node({x = pos.x,y = pos.y + i,z = pos.z},{name = "air"}) end
	end
end

local function fix_leaves(pos,radius)

local leaves =	{
				"real_trees:small_jungle_leaves",
				"real_trees:corner_jungle_leaves",
				"real_trees:wide_jungle_leaves",
				"real_trees:jungle_leaf_slab",
				"real_trees:medium_jungle_tree",
				"real_trees:large_jungle_tree",
				"default:jungleleaves",
				}

	if radius == 1 then

	local positions =	{
						{x = pos.x - 1,y = pos.y,z = pos.z - 1},
						{x = pos.x - 1,y = pos.y,z = pos.z},
						{x = pos.x - 1,y = pos.y,z = pos.z + 1},
						{x = pos.x,y = pos.y,z = pos.z - 1},
						{x = pos.x,y = pos.y,z = pos.z + 1},
						{x = pos.x + 1,y = pos.y,z = pos.z - 1},
						{x = pos.x + 1,y = pos.y,z = pos.z},
						{x = pos.x + 1,y = pos.y,z = pos.z + 1}
						}

	for key,value in pairs(positions) do
						if node_exist(leaves,minetest.get_node(value)) then
							minetest.set_node(value,{name = "air"})
						end
					end

elseif radius == 2 then

local positions =	{
					{x = pos.x - 2,y = pos.y,z = pos.z - 2},
					{x = pos.x - 2,y = pos.y,z = pos.z - 1},
					{x = pos.x - 2,y = pos.y,z = pos.z},
					{x = pos.x - 2,y = pos.y,z = pos.z + 1},
					{x = pos.x - 2,y = pos.y,z = pos.z + 2},

					{x = pos.x - 1,y = pos.y,z = pos.z - 2},
					{x = pos.x,y = pos.y,z = pos.z - 2},
					{x = pos.x + 1,y = pos.y,z = pos.z - 2},
					{x = pos.x - 1,y = pos.y,z = pos.z + 2},
					{x = pos.x,y = pos.y,z = pos.z + 2},
					{x = pos.x + 1,y = pos.y,z = pos.z + 2},

					{x = pos.x + 2,y = pos.y,z = pos.z - 2},
					{x = pos.x + 2,y = pos.y,z = pos.z - 1},
					{x = pos.x + 2,y = pos.y,z = pos.z},
					{x = pos.x + 2,y = pos.y,z = pos.z + 1},
					{x = pos.x + 2,y = pos.y,z = pos.z + 2}
					}

	for key,value in pairs(positions) do
						if node_exist(leaves,minetest.get_node(value)) then
							minetest.set_node(value,{name = "air"})
						end
					end

end
end

local function fix_everything(pos,size)
	if size == 1 then
		fix_trunks(pos,1)
	elseif size == 2 then
		fix_trunks(pos,2)
		fix_leaves({x = pos.x,y = pos.y + 4,z = pos.z},1)
	elseif size == 3 then
		fix_trunks(pos,3)
		fix_leaves({x = pos.x,y = pos.y + 3,z = pos.z},1)
		fix_leaves({x = pos.x,y = pos.y + 3,z = pos.z},2)
		fix_leaves({x = pos.x,y = pos.y + 5,z = pos.z},1)
		fix_leaves({x = pos.x,y = pos.y + 5,z = pos.z},2)
		fix_leaves({x = pos.x,y = pos.y + 7,z = pos.z},1)
	elseif size == 4 then
		fix_trunks(pos,4)
		fix_leaves({x = pos.x,y = pos.y,z = pos.z},1)
		fix_leaves({x = pos.x,y = pos.y + 1,z = pos.z},1)
		fix_leaves({x = pos.x,y = pos.y + 5,z = pos.z},1)
		fix_leaves({x = pos.x,y = pos.y + 5,z = pos.z},2)
		fix_leaves({x = pos.x,y = pos.y + 7,z = pos.z},1)
		fix_leaves({x = pos.x,y = pos.y + 7,z = pos.z},2)
		fix_leaves({x = pos.x,y = pos.y + 10,z = pos.z},1)
	end
end

local function can_grow(pos,size)

	local soil  = {"default:dirt","default:dirt_with_grass","default:dirt_with_dry_grass","default:dirt_with_snow"}
	local under = {x = pos.x,y = pos.y - 1,z = pos.z}

	if size == 1 then
		if minetest.get_node_light({x = pos.x,y = pos.y + 1,z = pos.z}) == 15 and node_exist(soil,minetest.get_node(under)) then
		return true
		else
		return false
		end
	elseif size == 2 then
		if minetest.get_node_light({x = pos.x,y = pos.y + 5,z = pos.z}) == 15 and node_exist(soil,minetest.get_node(under)) then
		return true
		else 
		return false    
		end
	elseif size == 3 then
		if minetest.get_node_light({x = pos.x,y = pos.y + 8,z = pos.z}) == 15 and node_exist(soil,minetest.get_node(under)) then
		return true
		else
		return false
		end
	elseif size == 4 then
		if minetest.get_node_light({x = pos.x,y = pos.y + 12,z = pos.z}) == 15 and node_exist(soil,minetest.get_node(under)) then
		return true
		else
		return false
		end
	end
end

function jungle_growth(pos,size,action)
	if action == 1 then
		if can_grow(pos,size) then return true else return false end
elseif action == 2 then
	if size == 1 then
		fix_everything(pos,1)
		minetest.place_schematic({x = pos.x - 1,y = pos.y,z = pos.z - 1},minetest.get_modpath("real_trees").."/trees/jungle/schems/small_jungle_tree.mts","0",nil,false)
elseif size == 2 then
		fix_everything(pos,2)
		minetest.place_schematic({x = pos.x - 2,y = pos.y,z = pos.z - 2},minetest.get_modpath("real_trees").."/trees/jungle/schems/medium_jungle_tree.mts","random",nil,false)
elseif size == 3 then
		fix_everything(pos,3)
		minetest.place_schematic({x = pos.x - 2,y = pos.y,z = pos.z - 2},minetest.get_modpath("real_trees").."/trees/jungle/schems/large_jungle_tree.mts","random",nil,false)
elseif size == 4 then
		fix_everything(pos,4)
		minetest.place_schematic({x = pos.x - 2,y = pos.y,z = pos.z - 2},minetest.get_modpath("real_trees").."/trees/jungle/schems/jungle_tree.mts","random",nil,false)
	end
	end
end
