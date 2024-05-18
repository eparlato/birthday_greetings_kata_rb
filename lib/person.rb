# frozen_string_literal: true

class Person
  attr_reader :name, :surname, :birthday_date, :email
  
  def initialize(name, surname, birthday_date, email)
    @name = name
    @surname = surname
    @birthday_date = birthday_date
    @email = email
  end
  
  def ==(other)
    return false unless other.is_a?(Person)
    
    @name == other.name && @surname == other.surname && @birthday_date == other.birthday_date && @email == other.email
  end

  def eql?(other)
    self == other
  end

  def hash
    [@name, @surname, @birthday_date, @email].hash
  end
end