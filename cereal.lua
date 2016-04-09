local Cereal = {}

function Cereal.load(str)
  assert(type(str) == 'string', 'Cereal can only deserialize strings')

  local ld, err = loadstring(str)
  assert(ld, 'Cereal failed to parse the string to be loaded\n' .. (err or 'Unknown error'))

  return setfenv(ld, {})()
end

local function formatTable(tab)
  if type(tab) == 'table' then
    local str = '{'
    for k, v in pairs(tab) do
      str = str .. k .. '=' .. formatTable(v) .. ','
    end

    return str .. '}'
  elseif type(tab) == 'string' then
    return '\'' .. tab .. '\''
  else
    return tab or 'nil'
  end
end

function Cereal.tostring(x)
  return 'return ' .. formatTable(x)
end

return Cereal
