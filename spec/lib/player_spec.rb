require "spec_helper"

describe Player do

  let (:player) { Player.new("Harrison") }
  let (:hand) { player.hand = Hand.new([Card.new("10", "♦"), Card.new("J", "♥")]) }


  describe "#initialize" do
    it "has a name" do
      expect(player.name).to eq("Harrison")
    end
    it "has an empty hand" do
      expect(player.hand).to be_a(Hand)
    end
    it "has a default bust value set to false" do
      expect(player.bust).to be(false)
    end
    it "had a default win value set to false" do
      expect(player.win).to be(false)
    end
  end

  describe "#bust" do
    it "can reset the bust value to true" do
      player.bust = true
      expect(player.bust).to be(true)
    end
  end

  describe "#win" do
    it "can reset the win value to true" do
      player.win = true
      expect(player.win).to be(true)
    end
  end

  describe "#player_results" do
    it "prints the hand and score of the player" do
      expect{ player.player_results }.to output.to_stdout
    end
  end
end
