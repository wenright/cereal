local Cereal = {}

function Cereal.load(str)
  assert(type(str) == 'string', 'Cereal can only deserialize strings')
end

function Cereal.toString(tab)
  assert(type(tab) == 'table', 'Cereal can only serialize tables')
end

return Cereal
