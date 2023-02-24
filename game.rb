# require neccesary files
require_relative "get_input"
require_relative "text_init"
require_relative "pokedex/pokemons"

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
    poke_name = get_input("Give your pokemon a name?")
    init_game(player_name, poke_name)
    menu_options = ["Stats", "Train", "Leader", "Exit"]
    input = get_menu_with_options(menu_options)
  end

=begin
    # Then create a Player with that information and store it in @player

    # Suggested game flow
    action = menu
    until action == "Exit"
      case action
      when "Train"
        train
        action = menu
      when "Leader"
        challenge_leader
        action = menu
      when "Stats"
        show_stats
        action = menu
      end
    end

    goodbye
  end

  def train
    # Complete this
  end

  def challenge_leader
    # Complete this
  end

  def show_stats
    # Complete this
  end

  def goodbye
    # Complete this
  end

  def menu
    # Complete this
=end
end
