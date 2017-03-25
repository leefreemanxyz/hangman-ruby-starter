class RandomWord
  attr_reader :word

  WORDS = %w(programming monkeybusiness rubyesque styleguide)

  def initialize
    @word = WORDS.sample
    @player_selections = []
  end

  def positions_for(characters: [])
    positions = turn_chars_into_empty_strings_array
    for i in 0...positions.length
      for j in 0...characters.length
        positions[i] = characters[j] if self.word[i] == characters[j]
      end
    end
    return positions
  end

  def turn_chars_into_empty_strings_array
    self.word.split(//).map{|i| ""}
  end

end
