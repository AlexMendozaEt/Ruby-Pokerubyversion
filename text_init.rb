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
    puts "Here, GREAT MASTER! There are 3 POKEMON here! Haha!"
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
end
