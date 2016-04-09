describe('Cereal', function()
  Cereal = require'cereal'

  it('should serialize a string', function()
    assert.truthy(Cereal.toString({2}) == 'return 2')
  end)
end)
