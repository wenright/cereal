describe('Cereal', function()
  Cereal = require 'cereal'

  it('failed serializing a single number', function()
    local expected = 5
    assert.are.same(expected, Cereal.loadstring(Cereal.tostring(expected)))
  end)

  it('failed serializing a single string', function()
    local expected = 'Hello world!'
    assert.are.same(expected, Cereal.loadstring(Cereal.tostring(expected)))
  end)

  it('failed serializing a huge string', function()
    local expected = string.rep('a', 2^20)
    assert.are.same(expected, Cereal.loadstring(Cereal.tostring(expected)))
  end)

  it('failed serializing a nil value', function()
    local expected = nil
    assert.are.same(expected, Cereal.loadstring(Cereal.tostring(expected)))
  end)

  it('failed serializing a nan value', function()
    local expected = 0/0
    assert.are.same(tostring(expected), tostring(Cereal.loadstring(Cereal.tostring(expected))))
  end)

  it('failed serializing a simple table with nil values', function()
    local expected = {x = nil, y, z}
    assert.are.same(expected, Cereal.loadstring(Cereal.tostring(expected)))
  end)

  it('failed serializing a simple table with numbers', function()
    local expected = {x = 5, y = 22}
    assert.are.same(expected, Cereal.loadstring(Cereal.tostring(expected)))
  end)

  it('failed serializing a simple table with strings', function()
    local expected = {x = 'hello', y = 'world', z = '!'}
    assert.are.same(expected, Cereal.loadstring(Cereal.tostring(expected)))
  end)

  it('failed serializing a table inside of a table', function()
    local expected = {x = {y = 2}}
    assert.are.same(expected, Cereal.loadstring(Cereal.tostring(expected)))
  end)

  it('failed serializing several tables inside of each other', function()
    local expected = {x = {y = 2, z = {w = 'test'}}}
    assert.are.same(expected, Cereal.loadstring(Cereal.tostring(expected)))
  end)
end)
