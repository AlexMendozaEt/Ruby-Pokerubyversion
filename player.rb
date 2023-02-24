require_relative "game"

class Player
  # (Complete parameters)
  def initialize(name,poke_name,poke_init)
    @name = name
    @poke = POKEMONS.new(poke_name, poke_init)
  end

  def select_move
    # Complete this
  end
end

# Create a class Bot that inherits from Player and override the select_move method
