# require neccesary files
require_relative "pokedex/pokemons"
require_relative "pokedex/moves"
require_relative "game"
require_relative "battle"



class POKEMONS
  # include neccesary modules
  include Pokedex
  include Pokedex

  attr_reader :attack, :level, :stats, :set_current_move, :types, :damage, :poke_name, :hp


  def initialize(poke_name, poke_init, level = 1)
    @poke_name = poke_name
    @poke_init = poke_init
    @base_stats = Pokedex::POKEMONS[@poke_init][:base_stats]
    @types = Pokedex::POKEMONS[@poke_init][:type]
    @moves = Pokedex::MOVES
    @type_multiplier = Pokedex::TYPE_MULTIPLIER
    @individual_values = { hp: rand(1..30), attack: rand(1..30), defense: rand(1..30), special_attack: rand(1..30), special_defense: rand(1..30), speed: rand(1..30) }
    @level = level
    @effort_values = {special_defense: 0}
    @set_current_move = nil
    @damage = nil
    @hp = ((2 * @base_stats[:hp] +  @individual_values[:hp] + 0) * @level / 100 + @level + 10).floor
    stats_gene
    # Retrieve pokemon info from Pokedex and set instance variables
    # Calculate Individual Values and store them in instance variable
    # Create instance variable with effort values. All set to 0
    # Store the level in instance variable
    # If level is 1, set experience points to 0 in instance variable.
    # If level is not 1, calculate the minimum experience point for that level and store it in instance variable.
    # Calculate pokemon stats and store them in instance variable
  end

  def stats_gene
    @stats = {}
    @stats[:hp] = @hp
    @stats[:attack] = ((2 * @base_stats[:attack] +  @individual_values[:attack] + 0) * @level / 100 + 5).floor
    @stats[:defense] = ((2 * @base_stats[:defense] +  @individual_values[:defense] + 0) * @level / 100 + 5).floor
    @stats[:special_attack] = ((2 * @base_stats[:special_attack] +  @individual_values[:special_attack] + 0) * @level / 100 + 5).floor
    @stats[:special_defense] = ((2 * @base_stats[:special_defense] +  @individual_values[:special_defense] + 0) * @level / 100 + 5).floor
    @stats[:speed] = ((2 * @base_stats[:speed] +  @individual_values[:speed] + 0) * @level / 100 + 5).floor
  end

  def show_stats
    puts "#{@poke_name.capitalize}:"
    puts "Kind: #{@poke_init}"
    puts "Level: #{@level}"
    print "Type: "
    @types.each {|i,j| print "#{i} #{j}"}
    puts "\nStats:"
    puts "HP: #{@stats[:hp]}"
    puts "Attack: #{@stats[:attack]}"
    puts "Defense: #{@stats[:defense]}"
    puts "Special attack: #{@stats[:special_attack]}"
    puts "Special defense: #{@stats[:special_defense]}"
    puts "Speed: #{@stats[:speed]}"
  end

  def prepare_for_battle
    @stats[:hp] = @hp
  end

  def receive_damage(damage)
    @stats[:hp] -= damage
  end

  def set_current_move(move_select)
    @set_current_move = move_select
  end

  def fainted?
    !@health.positive?
  end

  def attack(poke_target)

    puts "#{@poke_name.capitalize} used #{@set_current_move.upcase}!"

    @move_type = @moves[@set_current_move][:type]

    @accuracy = 1

    if @moves[@set_current_move][:accuracy] == 90
        rand(1..10) == 10 ? @accuracy = 0 : @accuracy
    end

    if Pokedex::SPECIAL_MOVE_TYPE.include?(@move_type)
      @damage = (((2 * level / 5.0 + 2).floor * @stats[:special_attack] * 40 / poke_target.stats[:special_defense]).floor / 50.0).floor + 2
    else
      @damage = (((2 * level / 5.0 + 2).floor * @stats[:attack] * 40 / poke_target.stats[:defense]).floor / 50.0).floor + 2
    end
    
    crit_pro = rand(1..16)

    if crit_pro == 1
      @damage = damage * 1.5
      puts "It was CRITICAL hit!"
    else
      @damage
    end
    
    effectiveness = 1
    Pokedex::TYPE_MULTIPLIER.each do |data_effectiveness|
      if data_effectiveness[:user] == @move_type && poke_target.types.include?(data_effectiveness[:target])
        effectiveness = data_effectiveness[:multiplier]
        break
      end
    end

    @damage = (@damage * effectiveness).floor

    if @accuracy == 0
      puts "Hit #{poke_target.poke_name} with #{@damage} damage"
      puts "But it MISSED!"
      @damage = @damage * @accuracy
    else
      if effectiveness == 0
        puts "It doesn't affect! #{poke_target.poke_name}"
        puts "And it hit #{poke_target.poke_name} with #{@damage} damage"
      elsif effectiveness == 0.5
        puts "It's not very effective..."
        puts "And it hit #{poke_target.poke_name} with #{@damage} damage"
      elsif effectiveness == 1
        puts "Hit #{poke_target.poke_name} with #{@damage} damage"
      else
        puts "It's super effective!"
        puts "And it hit #{poke_target.poke_name} with #{@damage} damage"
      end
    end
    @damage
  end

  def increase_stats(target)
    # Increase stats base on the defeated pokemon and print message "#[pokemon name] gained [amount] experience points"

    # If the new experience point are enough to level up, do it and print
    # message "#[pokemon name] reached level [level]!" # -- Re-calculate the stat
  end

  # private methods:
  # Create here auxiliary methods
end
