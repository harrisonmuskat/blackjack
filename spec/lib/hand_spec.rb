require "spec_helper"

describe Hand do
  # These UTF-8 characters will be useful for making different hands:
  # '♦', '♣', '♠', '♥'

  let(:empty_hand) { Hand.new }
  let(:hand) { Hand.new([Card.new("10", "♦"), Card.new("J", "♥")]) }
  let(:hand_low_ace) { Hand.new([Card.new("10", "♦"), Card.new("J", "♥"), Card.new("A", "♥")]) }
  let(:hand_high_ace) { Hand.new([Card.new("6", "♦"), Card.new("2", "♥"), Card.new("A", "♥")]) }
  let(:hand_aces) { Hand.new([Card.new("A", "♦"), Card.new("9", "♥"), Card.new("A", "♥")]) }
  let(:losing_hand) { Hand.new([Card.new("J", "♦"), Card.new("5", "♥"), Card.new("6", "♥"), Card.new("A", "♥")]) }

  describe "#calculate_hand" do
    it "returns the total value of a hand" do
      hand_total = hand.calculate_hand
      expect(hand_total).to eq (20)
    end

    it "correctly calculates Ace values" do
      win_hand_total = hand_low_ace.calculate_hand
      under_hand_total = hand_high_ace.calculate_hand
      hand_aces_total = hand_aces.calculate_hand
      losing_hand_total = losing_hand.calculate_hand

      expect(win_hand_total).to eq (21)
      expect(under_hand_total).to eq (19)
      expect(hand_aces_total).to eq (21)
      expect(losing_hand_total).to eq (22)
    end
  end

  describe "#add_card" do
    it "adds a new card to a hand" do
      empty_hand.add_card(Card.new("J", "♦"))
      expect(empty_hand.cards.length).to eq(1)
    end
  end

  describe "#hand_printer" do
    it "returns the stringified contents of a hand" do
      hand_string = hand.hand_printer
      expect(hand_string).to eq("10♦J♥")
    end
  end

  describe "#ace_separator" do
    it "makes a new array of aces in a hand" do
      ace_array = hand_aces.ace_separator
      expect(ace_array[0].rank).to eq("A")
      expect(ace_array[1].rank).to eq("A")
      expect(ace_array.length).to eq(2)
    end
  end
end
