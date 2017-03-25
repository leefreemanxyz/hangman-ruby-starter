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
  describe "#turn_word_into_empty_strings_array" do
    before do
      allow(random_word).to receive(:word).and_return("codaisseur")
    end
    it "returns an array of empty strings the same length as the input word" do
      expect(random_word.turn_word_into_empty_strings_array).to eq(["", "", "", "", "", "", "", "", "", "", ])
    end
  end
  describe "#count_incorrect_characters" do
    before do
      allow(random_word).to receive(:word).and_return("codaisseur")
    end
    it "returns the number of bad guesses passed in as an array" do
      expect(random_word.count_incorrect_characters(["c", "d", "x", "w", "p"])).to eq(3)
    end
  end
  describe "#contains?" do
    before do
      allow(random_word).to receive(:word).and_return("codaisseur")
    end
    it "returns true if the player's array contains all the letters of the sheriff's word" do
      expect(random_word.contains?(["c", "o", "d", "a", "i", "s", "e", "u", "r", "x", "y", "z"])).to eq true
    end
    it "returns false if the player's array does not contain all the letters of the sheriff's word" do
      expect(random_word.contains?(["c", "i", "s", "e", "u", "r", "x", "y", "z"])).to eq false

    end
  end
end
