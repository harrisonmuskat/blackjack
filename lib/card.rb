class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    if is_face_card?
      return 10
    elsif is_ace?
      return 1
    else
      return @rank.to_i
    end
  end

  def is_face_card?
    'JQK'.include?(rank.to_s)
  end

  def is_ace?
    @rank == 'A'
  end

  def card_printer
    "#{rank}#{suit}"
  end

end
