describe('Cereal', function()
  Cereal = require'cereal'

  it('failed serializing a simple table with numbers', function()
    local expected = {x = 5, y = 22}
    local result = Cereal.load(Cereal.tostring(expected))
    assert.are.same(expected, result)
  end)

  it('failed serializing a simple table with strings', function()
    local expected = {x = 'hello', y = 'world', z = '!'}
    local result = Cereal.load(Cereal.tostring(expected))
    assert.are.same(expected, result)
  end)

  it('failed serializing a table inside of a table', function()
    local expected = {x = {y = 2}}
    local result = Cereal.load(Cereal.tostring(expected))
    assert.are.same(expected, result)
  end)

  it('failed serializing several tables inside of each other', function()
    local expected = {x = {y = 2, z = {w = 'test'}}}
    local result = Cereal.load(Cereal.tostring(expected))
    assert.are.same(expected, result)
  end)
end)