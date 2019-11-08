class Card
  attr_reader :value, :suit
  def initialize(value, suit)
    @value = value
    @suit = suit 
  end
end

class Deck
  def initialize
    @the_deck = self.populate
  end
  
  def populate
    results = []
    [2,3,4,5,6,7,8,9,10,'J','Q','K','A'].each do |val|
      ['club','spade','heart','diamond'].each do |suit|
        results << Card.new(val,suit)
      end
    end
    return results
  end

end

class Hand
  attr_reader :value
  def initialize(cards)
    @cards = cards
    @value = rank_hand(@cards) 
  end

  def >(otherhand)
  end

  def rank_hand(cards)
    temp = 0 
    values = []
    cards.each do |card|
      values << card.value
    end
    [2,3,4,5,6,7,8,9,10,'J','Q','K','A'].each_with_index do |value,index|
      temp = index if values.count(value) > 1
    end
    return temp
  end

end

p Hand.new([Card.new('K','club'),Card.new('K','club')]).value