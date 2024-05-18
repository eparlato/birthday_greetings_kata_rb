# frozen_string_literal: true

require "csv"
class UserFileDataSource
  
  def initialize(file_path)
    @file_path = file_path
  end
  def find_users_born_on(month, day)
    users = []
    
    CSV.foreach(@file_path, headers: true) do |row|
      date_of_birth = Date.parse(row["date_of_birth"])
      
      if (date_of_birth.month == month && date_of_birth.day == day)
        users << Person.new(row["first_name"], row["last_name"], date_of_birth, row["email"]) 
      end
    end
    
    users
  end
end