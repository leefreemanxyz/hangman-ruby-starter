class RandomWord
  attr_reader :word

  WORDS = %w(macabre rabbit dusty abhorrent chivalrous unarmed wonderful terrific)

  def initialize
    @word = WORDS.sample
  end

  def positions_for(characters: [])
    puts characters
    positions = turn_word_into_empty_strings_array
    for i in 0...positions.length
      for j in 0...characters.length
        positions[i] = characters[j] if self.word[i] == characters[j]
      end
    end
    return positions
  end

  def count_incorrect_characters(characters)
    bad_guesses = 0
    characters.each do |char|
      unless self.word.include?(char)
        bad_guesses += 1
      end
    end
      return bad_guesses
    #should return the number of items in the array which aren't in the string
  end

  def contains? (player_selections)
    sheriffWord = Set.new(self.word.split(//))
    playerGuesses = Set.new(player_selections)
    sheriffWord.subset?(playerGuesses)
  end

  def turn_word_into_empty_strings_array
    self.word.split(//).map{|i| ""}
  end

end
