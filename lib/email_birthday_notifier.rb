# frozen_string_literal: true

require "mail"
require "person"
class EmailBirthdayNotifier
  
  def send_greeting_message_to(person)
    Mail.deliver do
      to person.email
      from "email_birthday_notifier@foobar.com"
      subject "Happy birthday!"
      body "Happy birthday, dear #{person.name}!"
    end
  end
end