# Dead-Simple Input Config
A dead-simple way to handle configurable input at runtime with Defold

This is probably not the most performant way to handle configurable input, but it's very simple to setup and use and should be totally fine for most projects.

_NOTE: The project in this repo is not a nice example at the moment, but you can look at main/example/example.script for a simple example of usage._

## Setup

#### Add the library dependency
```
https://github.com/rgrams/dead_simple_input_config/archive/master.zip
```

#### Hook up the input bindings file
Open `game.project`, scroll down to "input", click the edit ("...") button for "Game Binding", and select `simple_input_config/all_inputs.input_binding`.

## Usage

#### Require the module in your scripts
Add this line to the top of your scripts that use input:
```lua
local input = require "simple_input_config.input"
```

#### Bind inputs
Call `input.bind()` for each input you want to bind. To set up your starting bindings you may want to have a table of input and action IDs and iterate over it to bind them on `init`.

#### Convert inputs
On the first line of each of your `on_input` functions, add:
```lua
action_id = input.process(action_id)
```

#### Use input
You don't have to do anything else, just use the input `action_id` as you would normally.

## Functions

### input.bind(input_id, action_id)
Use this to bind your inputs, on `init` or whenever. Look at the _action_ names in `all_inputs.input_binding` for the correct `input_id` that you want.

_PARAMETERS_
* __input_id__ <kbd>string</kbd> - The string ID of the input to be bound.
* __action_id__ <kbd>string</kbd> - The string action name that you want to bind it to.

_RETURNS_
* __old_binding__ <kbd>hash|nil</kbd> - The hashed `action_id` that `input_id` was previously bound to, or `nil` if it wasn't bound.

### input.process(action_id)
On the first line of your `on_input` functions, add:
```lua
action_id = input.process(action_id)
```
This converts the incoming `action_id` to match your bound inputs. It returns `hash("unbound input")` for any input that it not bound (except mouse movement input, which keeps its `action_id` of `nil`).

### input.get_bindings_table()
Use this if you need to check what inputs are currently bound.

_RETURNS_
* __bindings__ <kbd>table</kbd> - The full table of currently bound inputs. The keys are the hashed `input_id`s, and the values are the hashed `action_id`s.
