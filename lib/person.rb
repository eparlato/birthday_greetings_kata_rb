# frozen_string_literal: true

class Person
  attr_reader :birthday_date
  
  def initialize(name, surname, birthday_date, email)
    @name = name
    @surname = surname
    @birthday_date = birthday_date
    @email = email
  end
end