require 'spec_helper'
require 'card'

describe Card do
  it 'has a suit' do
    card = Card.new(suit: 'Spade')
    assert_equal(card.suit, 'Spade')
  end
  
  it 'has a rank' do
    card = Card.new(rank: 'Jack')
    assert_equal(card.rank, 'Jack')
  end
  
  it 'has a rank and suit' do
    card = Card.new(suit: 'Heart', rank: 'Ace')
    assert_equal(card.suit, 'Heart')
    assert_equal(card.rank, 'Ace')
  end
end