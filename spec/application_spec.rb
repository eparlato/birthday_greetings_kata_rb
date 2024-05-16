# frozen_string_literal: true

require "application"

RSpec.describe "Application" do
  it "works" do
    application = Application.new
    
    expect(application.works?).to eq(true)
  end
end