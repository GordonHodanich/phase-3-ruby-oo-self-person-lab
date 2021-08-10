# your code goes here
require "pry"
class Person
  attr_reader :name, :happiness, :hygiene
  attr_accessor :bank_account

  def initialize(name)
    @name = name
    @bank_account = 25
    @happiness = 8
    @hygiene = 8
  end

  def happiness=(new_happiness)
    @happiness = round(new_happiness)
  end

  def hygiene=(new_hygiene)
    @hygiene = round(new_hygiene)
  end

  def round(new_value)
    if new_value > 10
      10
    elsif new_value.negative?
      0
    else
      new_value
    end
  end

  def happy?
    @happiness > 7
  end

  def clean?
    @hygiene > 7
  end

  def get_paid(amount)
    @bank_account += amount
    "all about the benjamins"
  end

  def take_bath
    self.hygiene = @hygiene + 4
    "♪ Rub-a-dub just relaxing in the tub ♫"
  end

  def work_out
    self.hygiene = @hygiene - 3
    self.happiness = @happiness + 2
    "♪ another one bites the dust ♫"
  end

  def call_friend(person)
    self.happiness = @happiness + 3
    person.happiness += 3
    "Hi #{person.name}! It's #{name}. How are you?"
  end

  def start_conversation(person, topic)
    case topic
    when "politics"
      Person.adjust_happiness_for_people([self, person], -2)
      "blah blah partisan blah lobbyist"
    when "weather"
      Person.adjust_happiness_for_people([self, person], 1)
      "blah blah sun blah rain"
    else
      "blah blah blah blah blah"
    end
  end

  def self.adjust_happiness_for_people(people, offset)
    people.each do |person|
      person.happiness = person.happiness + offset
    end
  end
end
