require 'spec_helper'

module BlackJack
  describe Game do
    it { expect(subject.deck.length).to eq(4 * 52 - 4) }

    it { expect(Game.new(5).deck.length).to eq(5 * 52 - 4) }

    it { expect(subject.player_hand.cards.length).to eq(2) }

    it { expect(subject.dealer_hand.cards.length).to eq(2) }

    describe '#show_dealer_hand' do
      it 'shows only onecard in dealer hand' do
        expect(subject.show_dealer_hand.length).to eq 1
      end
    end

    describe '#show_player_hand' do
      it 'shows all cards in player hand' do
        expect(subject.show_player_hand.length).to eq 2
      end
    end

    describe '#hit' do
      it 'picks a card from deck' do
        subject.hit
        expect(subject.player_hand.cards.length).to eq(3)
      end
    end

    describe '#stand' do
      it 'plays the dealer hand when player stand' do
        expect(subject.dealer_hand).to receive(:hit_as_dealer)
        subject.stand
      end
    end

    describe '#winner' do
      it 'dealer wins when player busts' do
        allow(subject.player_hand).to receive(:score).and_return(22)
        allow(subject.dealer_hand).to receive(:score).and_return(15)
        expect(subject.winner).to eq(:dealer)
      end

      it 'player wins when dealer busts' do
        allow(subject.player_hand).to receive(:score).and_return(18)
        allow(subject.dealer_hand).to receive(:score).and_return(22)
        expect(subject.winner).to eq(:player)
      end

      it 'player wins if player scored more than dealer' do
        allow(subject.player_hand).to receive(:score).and_return(18)
        allow(subject.dealer_hand).to receive(:score).and_return(16)
        expect(subject.winner).to eq(:player)
      end

      it 'draw if scores are level' do
        allow(subject.player_hand).to receive(:score).and_return(16)
        allow(subject.dealer_hand).to receive(:score).and_return(16)
        expect(subject.winner).to eq(:draw)
      end
    end
  end
end
