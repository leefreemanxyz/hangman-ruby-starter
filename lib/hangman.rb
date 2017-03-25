require File.expand_path("../random_word", __FILE__)

class Hangman
  def initialize
    @word = RandomWord.new
    @bad_guesses_left = 10
    @player_selections = []
  end

  def play!
    puts "You were caught stealing horses from the townsfolk and the punishment for your crime is to be hanged until dead.\nBut the sheriff likes to play with words, so he'll spare your life, if you can guess the word that he's thinking of.\nYou can choose letters one at a time, and I'll let you know if the word contains that letter. If you guess a letter that isn't in the word 10 times, then I'm afraid it's the noose for you."
    startGame
  end

  def startGame
    displayBoard
    #getUserInput
    #checkIfCorrect #dec @bad_guesses_left
    #gameOver?
  end

  def displayBoard
    puts "#{@word.positions_for(@player_selections)}"
  end
end
