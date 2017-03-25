require File.expand_path("../random_word", __FILE__)

class Hangman
  def initialize
    @word = RandomWord.new
    @bad_guesses_allowed = 10
    @bad_guesses = 0
    @player_selections = []
    @player_name = ""
  end

  def play!
    welcome
    print_progress_bar
    difficultySelect
    print_progress_bar

    while (@bad_guesses < @bad_guesses_allowed)
      displayBoard
      getUserInput
      print_progress_bar
      evaluate_guess
      print_progress_bar
      if word_guessed?
        puts "Dangit, I can't believe you guessed it. Well, guess I'll have to let you go. Now don't be bothering any more horses!"
        break
      end
      print_divider
    end
    if !word_guessed?
      puts "Afraid I'll have to get the noose for you."
    end
  end

  def welcome
    puts "Sheriff's office. It looks like I've lost my paperwork, remind me what your name was again."
    @player_name = gets.chomp
  end

  def difficultySelect
    puts "Hmm, we've got more than one #{@player_name} here. Were you #{@player_name} the vagrant? Or are you the infamous fraudster #{@player_name}? I hope you aren't #{@player_name} the horse thief!"
    puts "1. #{@player_name} the drunkard"
    puts "2. #{@player_name} the fraudster"
    puts "3. #{@player_name} the horse thief"
    response = gets.chomp.to_i
    case response
    when 1
      @bad_guesses_allowed = 10
    when 2
      @bad_guesses_allowed = 7
    when 3
      @bad_guesses_allowed = 5
    else
      puts "I'm afraid I didn't quite get that"
    end
    puts "Thanks, #{@player_name}. The sheriff is prepared to let you go if you can guess the word he is thinking of. Because of the severity of your crime, you can make #{@bad_guesses_allowed} incorrect attempts or it's the noose for you."
  end

  def displayBoard
    puts "#{@word.positions_for(characters: @player_selections)}"
  end

  def getUserInput
    puts "Do you feel lucky, punk? Pick a letter and try to beat the hangman."
    selection = gets.chomp
    @player_selections << selection.downcase
  end

  def evaluate_guess
    old_bad_guesses = @bad_guesses
    @bad_guesses = @word.count_incorrect_characters(@player_selections)
    puts old_bad_guesses < @bad_guesses ? "Too bad, that wasn't the right answer. You've now made #{@bad_guesses} bad guesses. You've got #{@bad_guesses_allowed - @bad_guesses} attempts remaining." :  "Well, I'll be. You got it right."
  end

  def word_guessed?
    @word.contains?(@player_selections)
  end

  def print_divider
    puts "*" * 40
    puts "\n"
  end

  def print_progress_bar
    3.times { sleep 0.5; print "." }
    puts "\n"
  end


end
