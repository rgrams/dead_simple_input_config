
--#####  Dead Simple Input Config  #####
-- A very simple way of having configurable input bindings at runtime.

-- To use:
--		1. Hook up the `all_inputs.input_binding` file in your game.project > input
--		2. In a script, bind your input actions with `M.bind`.
--		2. On the first line of your `on_input` functions, add: `action_id = input.process(action_id)`

-- One input (key, mouse button, etc) can only be bound to one action at a time.
-- Multiple inputs can be bound to the same action.


local M = {}


M.UNBOUND_ID = hash("unbound input")
local bindings = {
-- Example of what may be here at runtime
	-- [hash("up")] = hash("up"),
	-- [hash("down")] = hash("down"),
	-- [hash("left")] = hash("left"),
	-- [hash("right")] = hash("right"),
	-- [hash("space")] = hash("fire"),
	-- [hash("lt shift")] = hash("fire")
}

function M.bind(input_id, action_id)
	if type(input_id) == "string" and type(action_id) == "string" then
		local old_binding = bindings[input_id]
		bindings[hash(input_id)] = hash(action_id)
		return old_binding
	else
		print("ERROR: dead simple input config - both arguments to bind() must be strings.")
		return nil
	end
end

function M.get_bindings_table()
	return bindings
end

function M.process(action_id)
	if action_id then action_id = bindings[action_id] or M.UNBOUND_ID end
	return action_id
end


return M
