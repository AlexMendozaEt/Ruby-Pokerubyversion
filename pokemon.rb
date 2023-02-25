# require neccesary files
require_relative "pokedex/pokemons"
require_relative "game"


class POKEMONS
  # include neccesary modules
  include Pokedex
  attr_reader :attack, :level, :stats, :set_current_move


  def initialize(poke_name, poke_init, level = 1)
    @poke_name = poke_name
    @poke_init = poke_init
    @base_stats = Pokedex::POKEMONS[@poke_init][:base_stats]
    @types = Pokedex::POKEMONS[@poke_init][:type]
    @individual_values = { hp: rand(1..30), attack: rand(1..30), defense: rand(1..30), special_attack: rand(1..30), special_defense: rand(1..30), speed: rand(1..30) }
    @level = level
    @effort_values = {special_defense: 0}
    @set_current_move = nil
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
    @stats[:hp] = ((2 * @base_stats[:hp] +  @individual_values[:hp] + 0) * @level / 100 + @level + 10).floor
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
    p @stats_copy
  end

  def receive_damage
    @stats[:hp] -= 2
  end

  def set_current_move(move_select)
    @set_current_move = move_select
  end

  def fainted?
    !@health.positive?
  end

  def attack()
    # Print attack message 'Tortuguita used MOVE!'
    puts "#{@poke_name.capitalize} used #{@set_current_move.upcase}!"
    # Accuracy check
    # If the movement is not missed
    # -- Calculate base damage
    # -- Critical Hit check
    # -- If critical, multiply base damage and print message 'It was CRITICAL hit!'
    # -- Effectiveness check
    # -- Mutltiply damage by effectiveness multiplier and round down. Print message if neccesary
    # ---- "It's not very effective..." when effectivenes is less than or equal to 0.5
    # ---- "It's super effective!" when effectivenes is greater than or equal to 1.5
    # ---- "It doesn't affect [target name]!" when effectivenes is 0
    # -- Inflict damage to target and print message "And it hit [target name] with [damage] damage""
    # Else, print "But it MISSED!"
  end

  def increase_stats(target)
    # Increase stats base on the defeated pokemon and print message "#[pokemon name] gained [amount] experience points"

    # If the new experience point are enough to level up, do it and print
    # message "#[pokemon name] reached level [level]!" # -- Re-calculate the stat
  end

  # private methods:
  # Create here auxiliary methods
end
