# frozen_string_literal: true

require "send_greetings_use_case"
require "person"
require "date"
require "user_file_data_source"
require "email_birthday_notifier"
require "calendar"

RSpec.describe SendGreetingsUseCase do
  let(:user_file_data_source) { instance_double("UserFileDataSource") }
  let(:email_birthday_notifier) { instance_double("EmailBirthdayNotifier") }
  let(:calendar) { instance_double("Calendar") }
  
  context "when the data source has one person whose birthday is today" do
    it "sends a birthday greeting message" do
      person = Person.new("John", "Doe", Date.new(1982, 10, 8), "john.doe@foobar.com")
      
      allow(calendar).to receive(:get_today_date).and_return(Date.new(2024, 10, 8))
      allow(user_file_data_source).to receive(:find_users_born_on).with(10, 8).and_return([person])
      allow(email_birthday_notifier).to receive(:send_greeting_message_to)
      
      send_greetings_use_case = SendGreetingsUseCase.new(user_file_data_source, email_birthday_notifier, calendar)
      
      send_greetings_use_case.send_greetings
      
      expect(email_birthday_notifier).to have_received(:send_greeting_message_to).with(person)
    end
  end
  
  context "when the data source has one user and today is NOT its birthday" do
    it "doesn't send any birthday greeting message" do
      allow(calendar).to receive(:get_today_date).and_return(Date.new(2024, 10, 8))
      allow(user_file_data_source).to receive(:find_users_born_on).with(10, 8).and_return([])
      allow(email_birthday_notifier).to receive(:send_greeting_message_to)

      send_greetings_use_case = SendGreetingsUseCase.new(user_file_data_source, email_birthday_notifier, calendar)

      send_greetings_use_case.send_greetings
      
      expect(email_birthday_notifier).not_to have_received(:send_greeting_message_to)
    end
  end
end