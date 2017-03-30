require_relative "hand"
require_relative "card"
require 'colorize'

class Dealer
  attr_reader :name, :hand
  attr_accessor :bust, :win, :deck

  def initialize(name)
    @name = name
    @hand = Hand.new
    @deck = Deck.new
    @bust = false
    @win = false
  end

  def dealer_results
    puts "#{name}'s hand is currently #{hand.cards[0].card_printer} and the rest is hidden.".colorize(:yellow)
    puts "#{name}'s score is currently #{hand.calculate_hand}".colorize(:yellow)
  end

end
