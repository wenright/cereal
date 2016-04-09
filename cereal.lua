local Cereal = {}

function Cereal.load(str)
  assert(type(str) == 'string', 'Cereal can only deserialize strings')

  local ld = loadstring(str)
  print(ld)
  return setfenv(ld, {})()
end

local function formatTable(tab)
  if type(tab) == 'table' then
    local str = '{'
    for k, v in pairs(tab) do
      str = str .. k .. '=' .. formatTable(v) .. ','
    end

    return str .. '}'
  else
    return tab
  end
end

function Cereal.tostring(tab)
  assert(type(tab) == 'table', 'Cereal can only serialize tables')

  return 'return ' .. formatTable(tab)
end

return Cereal
