# Readme
## Approach
I started by reading the user stories. The first user story needed three things:

1. a Card object
2. a Card object with a suit attribute
3. a Card object with a rank attribute
 
Therefore I created `card_spec.rb` in the `/spec`. I wrote out the first spect test:
```ruby
describe Card do

end
```
Then I ran `rake test` and got an `uninitializedConstant` error. Therefore I created the `Card` class under `/lib`:
```ruby
def Card

end
```
and added
```ruby 
require 'card'
```
to `card_spec.rb`.

Great. But no tests were actually being run. Therefore I wrote out what I thought to be the second requirement: the user needs a `Card` object with a `:suit` attribute. Therefore I changed the `Card` class to 
```ruby
class Card
  attr_accessor :suit
end
```
After this I put the first test in the `card_spec.rb` file:
```ruby
describe Card do
  it "should have a suit" do
    c = Card.new(suit: 'Spade')
    assert_equal(c.suit, 'Spade')
  end
end
```
This failed with a wrong number of arguments error so I defined an initialize function on the on the `Card` class:
```ruby
class Card
  attr_accessor :suit
  
  def initialize(attributes = [])
    attributes.each do |k, v| 
      send("#{k}=", v)
    end
  end
end
````
This allowed me to accept a hash of attributes for `Card.new` and assign those attributes their respective values. Great.
Now when I ran `rake test` again it showed the test passing.

I then moved on to the second feature: the user need a Card object with a rank. So I added a test:
```ruby
it 'has a rank' do
  card = Card.new(rank: 'Jack')
  assert_equal(card.rank, 'Jack')
end
```
Ran the test and it passed. Great. I satisfied the test that the user needed to create a card with a particular suit and rank.
After this I went over the second user story and determined the user needed four things:

1. A Deck object
2. A Deck object with 52 Card objects
3. A Deck object with 52 shuffled Card objects

So I created `deck_spec.rb` and filled it in:
```ruby
require 'deck'

describe Deck do
  it "should have 52 cards" do
    d = Deck.new
    assert_equal(d.cards.count, 52)
  end
  
  it "should always be shuffled" do
    d1 = Deck.new
    d2 = Deck.new
    d3 = Deck.new
    d4 = Deck.new
    refute_match(d1, (d2 || d3 || d4))
  end
end
```

Then I went on to create the `Deck` class:
```ruby
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
```
Whenever `Deck` gets initialized, it automatically creates 52 cards from the `Deck.suits` and `Deck.ranks` arrays. It also shuffles the cards.