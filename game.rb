# require neccesary files
require_relative "get_input"
require_relative "text_init"
require_relative "pokemon"
require_relative "pokedex/pokemons"
require_relative "player"

class Game
  include GetInput
  include Texts

  def pokemon_char
    pokes_iniciales = Pokedex::POKEMONS.first(3).map { |keys, value| [keys, value.to_h] }.to_h
    valid_pokes = pokes_iniciales.keys
    get_with_options(valid_pokes)
  end

  def start
    welcome
    player_name = get_input("First, what is your name?")
    choice_poke(player_name)
    poke_init = pokemon_char
    poke_name(poke_init)
    poke_name = get_input_poke("Give your pokemon a name?",poke_init)
    init_game(player_name, poke_name)
    menu_options = ["Stats", "Train", "Leader", "Exit"]
    action = get_menu_with_options(menu_options)
    poke = POKEMONS.new(poke_name, poke_init)
    moves_options = ["tackle", "vine whip"]
    loop do
      case action.capitalize
      when "Stats"
        poke.show_stats
      when "Train"
        def pokemon_bot_char
          valid_pokes = Pokedex::POKEMONS.keys
          valid_pokes.sample
        end
        battle_option = ["Fight","Leave"]
        poke_bot = pokemon_bot_char
        poke_random = POKEMONS.new(poke_name, poke_bot, rand(1..10))
        poke_leve = poke_random.level
        text_battle(player_name,poke_bot,poke_leve)
        action_battle = get_menu_with_options(battle_option)
        case action_battle
        when "Fight"
          text_fight(player_name,poke_name,poke_bot,poke_random,poke)
          puts "\n#{player_name.capitalize}, select your move:\n\n"
          moves_action = get_with_options_battle(moves_options)
          poke.set_current_move(moves_action)
          puts "\n--------------------------------------------------"
          poke.attack
        when "Leave"
          puts "\n"
        end
      when "Leader"
        puts poke.receive_damage
      when "Exit"
        puts "Thanks for playing Pokemon Ruby"
        puts "This game was created with love by:\nDiego Renato Oviedo, Alex Mendoza Etchebarne, Gabriel Nuñez Arenas, Ruben Cuadros Espinoza."
        break
      end
      action = get_menu_with_options(menu_options)
    end
  end
end
