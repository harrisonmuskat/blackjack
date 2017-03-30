require "spec_helper"

describe Deck do
  let(:deck) { Deck.new } # Creates a variable that can be used for tests

  describe "#build_deck" do
    it "builds a deck of 52 cards" do
      expect(deck.cards.size).to eq 52
    end

    it "creates unique cards" do
      expect(deck.cards.uniq.size).to eq 52
    end

    it "shuffles deck after being built" do
      expect(deck.cards.sort {|first_card, second_card| first_card.value <=> second_card.value}).to_not eq deck.cards
      first_two_cards = deck.cards.sort {|first_card, second_card| first_card.value <=> second_card.value}[0..1]
      card_values = []
      first_two_cards.each do |card|
        card_values << card.value
      end
      expect(card_values).to eq [1,1]
    end
  end

  describe "#deal" do
    it "removes correct number of cards" do
      start_size = deck.cards.size
      finish_size = start_size - 2

      deck.deal(2)

      expect(deck.cards.size).to eq finish_size
    end

    it "deals the top card in the deck" do
      correct_card = deck.cards[-1]
      expect(deck.deal(1)).to eq [correct_card]
    end
  end

end
