require_relative 'deck'
require_relative 'card'
require_relative 'player'

class Hand
  attr_accessor :cards

  def initialize(cards = [])
    @cards = cards
  end

  def calculate_hand
    hand_value = 0
    @cards.each do |card|
      hand_value += card.value
    end
    aces = self.ace_separator
    aces.each do |ace|
      if hand_value + 10 <= 21
        hand_value += 10
      end
    end
    hand_value
  end

  def add_card(card)
    @cards << card
  end

  def hand_printer
    hand_string = ""
    @cards.each {|card| hand_string += card.card_printer}
    hand_string
  end

  def ace_separator
    ace_array = []
    @cards.each do |card|
      card.is_ace? ? ace_array << card : card
    end
    ace_array
  end
end
