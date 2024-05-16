# frozen_string_literal: true

class SendGreetingsUseCase
  def initialize(data_source, birthday_notifier, calendar)
    @data_source = data_source
    @birthday_notifier = birthday_notifier
    @calendar = calendar
  end
  
  def send_greetings
    users = @data_source.get_users
    today = @calendar.get_today_date
    
    users.each do |person|
      if birthday?(person, today)
        @birthday_notifier.send_greeting_message_to(person)
      end
    end
  end
  
  private
  
  def birthday?(person, date)
    person.birthday_date.month == date.month && person.birthday_date.day == date.day
  end
end