module BlackJack
  class Game
    attr_reader :player_hand, :dealer_hand, :deck

    def initialize(deck_count = 4)
      @deck = build_deck(deck_count)
      @player_hand = Hand.new
      @dealer_hand = Hand.new
      2.times { @player_hand.hit!(@deck) }
      2.times { @dealer_hand.hit!(@deck) }
    end

    def hit
      player_hand.hit!(@deck)
    end

    def stand
      dealer_hand.hit_as_dealer(@deck)
      winner
    end

    def show_dealer_hand
      [dealer_hand.cards.first]
    end

    def show_player_hand
      dealer_hand.cards
    end

    def winner
      return :dealer if @player_hand.score > 21
      return :player if @dealer_hand.score > 21

      if @player_hand.score == @dealer_hand.score
        :draw
      elsif @player_hand.score > @dealer_hand.score
        :player
      else
        :dealer
      end
    end

    protected

    def build_deck(deck_count)
      (build_cards * deck_count).shuffle
    end

    def build_cards
      cards = []
      Card::SUITES.each do |suit|
        Card::VALUES.each do |value|
          cards << Card.new(suit, value)
        end
      end
      cards
    end
  end
end
