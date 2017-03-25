require File.expand_path("../random_word", __FILE__)

class Hangman
  def initialize
    @word = RandomWord.new
    @bad_guesses_allowed = 10
    @bad_guesses = 0
    @player_selections = []
  end

  def play!
    welcome
    difficultySelect
    while (@bad_guesses < @bad_guesses_allowed)
      displayBoard
      getUserInput
      evaluate_guess
      if word_guessed?
        break
      end
    end
  end
  
  def welcome
    puts "You were caught stealing horses from the townsfolk and the punishment for your crime is to be hanged until dead.\nBut the sheriff likes to play with words, so he'll spare your life, if you can guess the word that he's thinking of.\nYou can choose letters one at a time, and I'll let you know if the word contains that letter. If you guess a letter that isn't in the word 10 times, then I'm afraid it's the noose for you."
  end

  def difficultySelect

  end

  def displayBoard
    puts "#{@word.positions_for(characters: @player_selections)}"
  end

  def getUserInput
    puts "So, you feeling lucky, punk? Pick a letter and try to beat the hangman."
    selection = gets.chomp
    @player_selections << selection.downcase
  end

  def evaluate_guess
    old_bad_guesses = @bad_guesses
    @bad_guesses = @word.count_incorrect_characters(@player_selections)
    puts old_bad_guesses < @bad_guesses ? "Too bad, that wasn't the right answer. You've now made #{@bad_guesses} bad guesses. You've got #{@bad_guesses_allowed - @bad_guesses} attempts remaining." :  "Well, I'll be. You got it right."
  end

  def word_guessed?

  end


end
