require "spec_helper"

RSpec.describe Card do
  # Define a card:
  #   Card has a value and a suit
  #   Value displayed can be number or letter
  #     Need to be able to calculate value of letter cards (J,Q,K,A)

  let (:ace_card) { Card.new('A', '♦') }
  let (:face_card) { Card.new('Q', '♦') }
  let (:regular_card) { Card.new('6', '♦') }

  describe '#initialize' do
    it 'should contain the indentifier, suit, and value' do
      expect(regular_card.rank).to eq('6')
      expect(regular_card.suit).to eq('♦')
      expect(regular_card.value).to eq(6)
    end

    it 'should correctly calculate the value of a face card' do
      expect(face_card.rank).to eq('Q')
      expect(face_card.suit).to eq('♦')
      expect(face_card.value).to eq(10)
    end

    it 'should correctly calculate the value of an ace card' do
      expect(ace_card.rank).to eq('A')
      expect(ace_card.suit).to eq('♦')
      expect(ace_card.value).to eq(1)
    end
  end

  describe '#is_face_card?' do
    it 'should return true if the card is a face card' do
      expect(face_card.is_face_card?).to be true
    end
  end

  describe '#is_ace?' do
    it 'should return true if the card is an ace card' do
      expect(ace_card.is_ace?).to be true
    end
  end
end
