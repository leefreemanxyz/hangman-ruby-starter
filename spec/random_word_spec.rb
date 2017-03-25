require 'spec_helper'

RSpec.describe RandomWord do
  let(:random_word) { RandomWord.new }

  it "generates a random word from the WORDS list" do
    expect(RandomWord::WORDS).to include(random_word.word)
  end

  describe "#positions_for(characters: [])" do
    before do
      allow(random_word).to receive(:word).and_return("homebrew")
    end

    it "returns the character positions for all passed in characters" do
      expect(random_word.positions_for(characters: ["e", "o"])).to eq(["", "o", "", "e", "", "", "e", ""])
    end
  end
  describe "#turn_chars_into_empty_strings_array" do
    before do
      allow(random_word).to receive(:word).and_return("codaisseur")
    end
    it "returns an array of empty strings the same length as the input word" do
      expect(random_word.turn_chars_into_empty_strings_array).to eq(["", "", "", "", "", "", "", "", "", "", ])
    end
  end
end
