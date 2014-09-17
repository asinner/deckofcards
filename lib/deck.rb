class Deck
  attr_accessor :cards

  def initialize
    self.cards = []
    suits.each do |suit|
      ranks.each do |rank|
        cards << Card.new(suit: suit, rank: rank)
      end
    end
    cards.shuffle
  end

  def suits
    %w(Spade Club Heart Diamond)
  end

  def ranks
    %w(Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King)
  end
end
