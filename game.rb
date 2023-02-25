# require neccesary files
require_relative "get_input"
require_relative "text_init"
require_relative "pokemon"
require_relative "pokedex/pokemons"

def pokemon_char
  pokes_iniciales = Pokedex::POKEMONS.first(3).map { |keys, value| [keys, value.to_h] }.to_h
  valid_pokes = pokes_iniciales.keys
  get_with_options(valid_pokes)
end

class Game
  include GetInput
  include Texts

  def start
    welcome
    player_name = get_input("First, what is your name?")
    choice_poke(player_name)
    poke_init = pokemon_char
    poke_name(poke_init)
    poke_name = get_input_poke("Give your pokemon a name?", poke_init)
    init_game(player_name, poke_name)
    menu_options = ["Stats", "Train", "Leader", "Exit"]
    action = get_menu_with_options(menu_options)
    poke = POKEMONS.new(poke_name, poke_init)
    moves_options = Pokedex::POKEMONS[poke_init][:moves]
    loop do
      case action.capitalize
      when "Stats"
        poke.show_stats
      when "Train"
        def pokemon_bot_char
          valid_pokes = Pokedex::POKEMONS.keys
          valid_pokes.sample
        end
        battle_option = ["Fight", "Leave"]
        poke_bot = pokemon_bot_char
        poke_random = POKEMONS.new(poke_bot, poke_bot, rand(1..10))
        poke_leve = poke_random.level
        text_battle(player_name, poke_bot, poke_leve)
        action_battle = get_menu_with_options(battle_option)
        case action_battle
        when "Fight"
          text_fight(player_name, poke_name, poke_bot, poke_random, poke)
          while poke.stats[:hp].positive? && poke_random.stats[:hp].positive?
            stats_fight(player_name, poke_name, poke_bot, poke_random, poke)
            puts "\n#{player_name.capitalize}, select your move:\n\n"
            moves_action = get_with_options_battle(moves_options)
            poke.set_current_move(moves_action)
            poke_random.set_current_move(Pokedex::POKEMONS[poke_bot][:moves].sample)
            first = poke.select_first(poke, poke_random)
            second = first == poke ? poke_random : poke
            puts "\n--------------------------------------------------"
            damage_first = first.attack(second)
            puts "----------------------------------------------------"
            damage_second = second.attack(first)
            second.receive_damage(damage_first)
            first.receive_damage(damage_second)
          end
          if poke.stats[:hp].positive?
            player_wins_exp(poke, poke_random)
            poke.increase_stats(poke_random)
          else
            bot_wins(poke, poke_random)
          end
        when "Leave"
          puts "\n"
        end
      when "Leader"
        battle_option_leder = ["Fight", "Leave"]
        poke_lider = POKEMONS.new("Onix", "Onix", 10)
        leder_fight
        action_battle_leder = get_menu_with_options(battle_option_leder)
        case action_battle_leder
        when "Fight"
          text_fight(player_name, poke_name, "Onix", "Onix", poke)
          while poke.stats[:hp].positive? && poke_lider.stats[:hp].positive?
            stats_fight(player_name, poke_name, "Onix", poke_lider, poke)
            puts "\n#{player_name.capitalize}, select your move:\n\n"
            moves_action = get_with_options_battle(moves_options)
            poke.set_current_move(moves_action)
            poke_lider.set_current_move(Pokedex::POKEMONS["Onix"][:moves].sample)
            first = poke.select_first(poke, poke_lider)
            second = first == poke ? poke_lider : poke
            puts "\n--------------------------------------------------"
            damage_first = first.attack(second)
            puts "----------------------------------------------------"
            damage_second = second.attack(first)
            second.receive_damage(damage_first)
            first.receive_damage(damage_second)
          end
          if poke.stats[:hp].positive?
            player_wins_exp(poke, poke_lider)
            poke.increase_stats(poke_lider)
            win_battle
          else
            bot_wins(poke, poke_lider)
          end
        when "Leave"
          puts "\n"
        end
      when "Exit"
        puts "Thanks for playing Pokemon Ruby"
        puts "This game was created with love by:\nAlex Mendoza Etchebarne, Gabriel Nuñez Arenas, Ruben Cuadros Espinoza, Diego Renato Oviedo."
        break
      end
      poke.prepare_for_battle
      action = get_menu_with_options(menu_options)
    end
  end
end
