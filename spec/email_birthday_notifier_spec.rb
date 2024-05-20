# frozen_string_literal: true

require "mail"
require "person"
require "email_birthday_notifier"

RSpec.describe "EmailBirthdayNotifier" do
  include Mail::Matchers

  describe "#send_greeting_message_to" do
    it "sends a greeting message to a Person email address" do
      person = Person.new("John", "Doe", Date.new(1970, 1, 1), "john.doe@foobar.com" )
      
      EmailBirthdayNotifier.new.send_greeting_message_to(person)
      
      is_expected.to have_sent_email.to("john.doe@foobar.com")
      is_expected.to have_sent_email.with_subject("Happy birthday!")
      is_expected.to have_sent_email.with_body("Happy birthday, dear John!")
    end
  end
end