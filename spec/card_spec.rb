require 'spec_helper'

module BlackJack
  describe Card do
    it 'accepts suit and value when building' do
      card = Card.new(:clubs, 10)
      expect(card.suit).to eq(:clubs)
      expect(card.value).to eq(10)
    end

    it 'has a value of 10 for facecards' do
      facecards = %w(J Q K)
      facecards.each do |facecard|
        card = Card.new(:hearts, facecard)
        expect(card.value).to eq(10)
      end
    end

    it 'has a value of 10 for the 10-clubs' do
      card = Card.new(:clubs, 10)
      expect(card.value).to eq(10)
    end

    it 'has a value of 11 for Ace' do
      card = Card.new(:diamonds, 'A')
      expect(card.value).to eq(11)
    end

    it 'does not allow to build with invalid suit' do
      expect { Card.new(:abc, 2) }.to raise_error(/Invalid Card Suit/)
    end

    it 'does not allow to build with invalid value' do
      expect { Card.new(:clubs, 12) }.to raise_error(/Invalid Card Value/)
    end
  end
end
