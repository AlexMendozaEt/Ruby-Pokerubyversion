module Texts
  def welcome
    puts "#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#"
    puts "#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#"
    puts "#$##$##$##$ ---        Pokemon Ruby         --- #$##$##$#$#"
    puts "#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#"
    puts "#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#\n\n"
    puts "Hello there! Welcome to the world of POKEMON! My name is OAK!"
    puts "People call me the POKEMON PROF!\n\n"
    puts "This world is inhabited by creatures called POKEMON! For some"
    puts "people, POKEMON are pets. Others use them for fights. Myself..."
    puts "I study POKEMON as a profession."
  end

  def choice_poke(player_name)
    puts "\nRight! So your name is #{player_name.upcase}!"
    puts "Your very own POKEMON legend is about to unfold! A world of"
    puts "dreams and adventures with POKEMON awaits! Let's go!"
    puts "Here, #{player_name.upcase} ! There are 3 POKEMON here! Haha!"
    puts "When I was young, I was a serious POKEMON trainer."
    puts "In my old age, I have only 3 left, but you can have one! Choose!\n\n"
  end

  def poke_name(poke_init)
    puts "\nYou selected #{poke_init.upcase}. Great choice!"
  end

  def init_game(player_name, poke_name)
    puts "\n#{player_name.upcase}, raise your young #{poke_name.upcase} by making it fight!"
    puts "When you feel ready you can challenge BROCK, the PEWTER's GYM LEADER\n"
  end

  def text_battle(player_name,poke_bot,poke_leve)
    puts "#{player_name.capitalize} challenge Random Person for training"
    puts "Random Person has a #{poke_bot} level #{poke_leve} "
    puts "What do you want to do now?"
  end
  def text_fight(player_name,poke_name,poke_bot,poke_random,poke)
    puts "\nRandom Person sent out #{poke_bot.upcase}!"
    puts "#{player_name.capitalize} sent out #{poke_name.upcase}!"
    puts "\n-------------------Battle Start!-------------------"
    puts "\n#{player_name.capitalize}'s #{poke_name.capitalize} - Level #{poke.level}"
    puts "HP: #{poke.stats[:hp]}"
    puts "Random Person's #{poke_bot.capitalize} - Level #{poke_random.level}"
    puts "HP: #{poke_random.stats[:hp]}"
  end
end
