require "spec_helper"

describe Dealer do

  let (:dealer) { Dealer.new("Harrison") }
  let (:hand) { dealer.hand = Hand.new([Card.new("10", "♦"), Card.new("J", "♥")]) }

  describe "#initialize" do
    it "has a name" do
      expect(dealer.name).to eq("Harrison")
    end
    it "has an empty hand" do
      expect(dealer.hand).to be_a(Hand)
    end
    it "has a default bust value set to false" do
      expect(dealer.bust).to be(false)
    end
    it "had a default win value set to false" do
      expect(dealer.win).to be(false)
    end
    it "had a default deck" do
      expect(dealer.deck).to be_a(Deck)
    end
  end

  describe "#bust" do
    it "can reset the bust value to true" do
      dealer.bust = true
      expect(dealer.bust).to be(true)
    end
  end

  describe "#win" do
    it "can reset the win value to true" do
      dealer.win = true
      expect(dealer.win).to be(true)
    end
  end

end
