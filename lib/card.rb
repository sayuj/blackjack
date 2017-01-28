module BlackJack
  class Card
    attr_reader :suit, :value

    FACE_CARDS    = %w(J Q K).freeze
    NUMBER_CARDS  = [2, 3, 4, 5, 6, 7, 8, 9, 10].freeze
    VALUES        = (NUMBER_CARDS + FACE_CARDS + ['A']).freeze
    SUITES        = [:clubs, :hearts, :spades, :diamonds].freeze

    def initialize(suit, value)
      @suit  = suit
      @value = value
      validate
    end

    def value
      case @value
      when 'A'
        11
      when *FACE_CARDS
        10
      when *NUMBER_CARDS
        @value.to_i
      else
        0
      end
    end

    protected

    def validate
      raise 'Invalid Card Suit'  unless SUITES.include?(@suit)
      raise 'Invalid Card Value' unless VALUES.include?(@value)
    end
  end
end
