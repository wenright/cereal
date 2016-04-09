# cereal
Convert tables into strings that can be loaded in later

# Usage
``` Lua
local Cereal = require 'cereal'

local player = {
  health = 100,
  inventory = {
    weapon = 'sword',
    potions = 3
  }
}

local serialized = Cereal.tostring(player)
```

serialized is a string containing the equivalent of the player table.  It can be written to a file or sent across a network to be deserialized later.

``` Lua
local player = Cereal.loadstring(player)
```

player is now the same table as before being serialized.
