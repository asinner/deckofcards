require 'spec_helper'
require 'deck'

describe Deck do
  it 'should have 52 cards' do
    d = Deck.new
    assert_equal(d.cards.count, 52)
  end

  it 'should always be shuffled' do
    d1 = Deck.new
    d2 = Deck.new
    d3 = Deck.new
    d4 = Deck.new
    refute_match(d1, (d2 || d3 || d4))
  end
end
