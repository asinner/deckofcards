class Deck
  attr_accessor :cards
  
  def initialize
    self.cards = []
    self.suits.each do |suit|
      self.ranks.each do |rank|
        self.cards << Card.new(suit: suit, rank: rank)
      end
    end
    self.cards.shuffle
  end
  
  def suits
    ['Spade', 'Club', 'Heart', 'Diamond']
  end
  
  def ranks
    ['Ace', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten', 'Jack', 'Queen', 'King']
  end
end