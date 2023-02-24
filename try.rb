class Pokemon
  include Pokedex
  attr_reader :attack

  @@stat_HP = nil
  @@attack = nil
  @@defense = nil
  @@special_attack = nil
  @@special_defense = nil
  @@speed = nil
  def initialize(poke_name, poke_init)
    @poke_name = poke_name
    @poke_init = poke_init
    @base_stats = Pokedex::POKEMONS[@poke_init][:base_stats]
    @types = Pokedex::POKEMONS[@poke_init][:type]
    @individual_values = { hp: rand(1..30), attack: rand(1..30), defense: rand(1..30), special_attack: rand(1..30), special_defense: rand(1..30), speed: rand(1..30) }
    @level = 1
    @effort_values = {special_defense: 0}

    # Set experience points based on level
    if @level == 1
      @experience_points = 0
    else
      @experience_points = ((@level**3) * 5 / 4).to_i
    end
  end
  def stats_gene
    stats = {}
    stats[:hp] = ((2 * @base_stats[:hp] +  @individual_values[:hp] + 0) * @level / 100 + @level + 10).floor
    stats[:attack] = ((2 * @base_stats[:attack] +  @individual_values[:attack] + 0) * @level / 100 + 5).floor
    stats[:defense] = ((2 * @base_stats[:defense] +  @individual_values[:defense] + 0) * @level / 100 + 5).floor
  end
end