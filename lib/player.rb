require_relative "hand"

class Player
  attr_reader :name, :hand
  attr_accessor :bust, :win

  def initialize(name)
    @name = name
    @hand = Hand.new
    @bust = false
    @win = false
  end

  def player_results
    puts "#{name}'s hand is currently #{hand.hand_printer}"
    puts "#{name}'s score is currently #{hand.calculate_hand}"
  end
end
