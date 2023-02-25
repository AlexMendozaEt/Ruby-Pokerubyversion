module GetInput
  def print_options(options)
    options.each.with_index do |option, index|
      print "#{index + 1}. #{option.capitalize} #{' ' * 5}"
    end
    print "\n"
  end

  def print_menu_options(options)
    puts "-----------------------Menu-----------------------\n\n"
    options.each.with_index do |option, index|
      print "#{index + 1}. #{option.capitalize} #{' ' * 10}"
    end
    print "\n"
  end

  def get_input(prompt)
    input = ""
    while input.empty?
      puts prompt
      print "> "
      input = gets.chomp
    end

    input
  end
  
  def get_input_poke(prompt,poke_init)
    input = ""
    puts prompt
    print "> "
    input = gets.chomp

    if input.empty?
      input = poke_init
    else
      input
    end
  end

  def get_menu_with_options(options)
    input = ""
    until options.include?(input.capitalize)
      print_menu_options(options)
      print "> "
      input = gets.chomp.capitalize
    end
    input
  end

  def get_with_options(options)
    input = ""
    until options.include?(input.capitalize)
      print_options(options)
      print "> "
      input = gets.chomp.capitalize
    end
    input
  end
  def get_with_options_battle(options)
    input = ""
    until options.include?(input.downcase)
      print_options(options)
      print "> "
      input = gets.chomp.downcase
    end
    input
  end
end
