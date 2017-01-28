require 'spec_helper'

module BlackJack
  describe Hand do
    describe '#hit!' do
      let(:club_4) { Card.new(:clubs, 4) }
      let(:diamond_7) { Card.new(:diamonds, 7) }
      let(:club_k) { Card.new(:clubs, 'K') }
      let(:deck) { [club_4, diamond_7, club_k] }

      it 'takes from the top of the deck' do
        2.times { subject.hit!(deck) }
        expect(subject.cards).to eq([club_4, diamond_7])
      end

      it 'can not hit if the hand busted' do
        allow(subject).to receive(:score).and_return(22)
        expect { subject.hit!(deck) }.to raise_error(/Hand Busted/)
      end

      it 'can not hit if the hand is BlackJack' do
        allow(subject).to receive(:score).and_return(21)
        expect { subject.hit!(deck) }.to raise_error(/BlackJack/)
      end
    end

    it 'calculates the score correctly' do
      deck = [Card.new(:clubs, 4), Card.new(:diamonds, 10)]
      2.times { subject.hit!(deck) }
      expect(subject.score).to eq(14)
    end

    describe '#hit_as_dealer' do
      it 'stops hiting when score reaches more than 17' do
        deck = [Card.new(:clubs, 4),
                Card.new(:diamonds, 4),
                Card.new(:clubs, 2),
                Card.new(:hearts, 8)
              ]
        2.times { subject.hit!(deck) }
        subject.hit_as_dealer(deck)
        expect(subject.score).to eq(18)
      end

      it 'does not hit if initial score is greater than 17' do
        deck = [Card.new(:clubs, 9), Card.new(:diamonds, 9)]
        2.times { subject.hit!(deck) }
        subject.hit_as_dealer(deck)
        expect(subject.score).to eq(18)
      end
    end
  end
end
