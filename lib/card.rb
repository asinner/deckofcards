class Card
  attr_accessor :suit, :rank

  def initialize(attributes = [])
    attributes.each do |k, v| 
      send("#{k}=", v)
    end
  end
end