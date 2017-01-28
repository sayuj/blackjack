module BlackJack
  class Hand
    attr_reader :cards

    def initialize
      @cards = []
    end

    def hit!(deck)
      raise 'Hand Busted' if score >  21
      raise 'BlackJack'   if score == 21
      @cards << deck.shift
    end

    def score
      cards.inject(0) { |score, card| score + card.value }
    end

    def hit_as_dealer(deck)
      return if score > 17
      hit!(deck)
      hit_as_dealer(deck)
    end
  end
end
