# frozen_string_literal: true

require "csv"
class UserFileDataSource
  
  def initialize(file_path)
    @file_path = file_path
  end
  def find_persons_born_on(month, day)
    persons = []
    
    CSV.foreach(@file_path, headers: true) do |row|
      date_of_birth = Date.parse(row["date_of_birth"])
      
      if (date_of_birth.month == month && date_of_birth.day == day)
        persons << Person.new(row["first_name"], row["last_name"], date_of_birth, row["email"]) 
      end
    end
    
    persons
  end
end