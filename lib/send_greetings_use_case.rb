# frozen_string_literal: true

class SendGreetingsUseCase
  def initialize(data_source, birthday_notifier, calendar)
    @data_source = data_source
    @birthday_notifier = birthday_notifier
    @calendar = calendar
  end
  
  def send_greetings
    today = @calendar.get_today_date
    persons_whose_birthday_is_today = @data_source.find_persons_born_on(today.month, today.day)

    persons_whose_birthday_is_today.each do |person|
      @birthday_notifier.send_greeting_message_to(person)
    end
  end
end