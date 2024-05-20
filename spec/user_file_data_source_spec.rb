# frozen_string_literal: true

require "user_file_data_source"
require "person"

RSpec.describe "UserFileDataSource" do
  
  describe "#find_persons_born_on" do
    context "when the file is empty" do
      let(:user_file_data_source) { UserFileDataSource.new("spec/test_files/empty_file.csv") }
      
      it "returns an empty array" do
        expect(user_file_data_source.find_persons_born_on(10, 8)).to eq([])
      end
    end
    
    context "when the file has persons data" do
      let(:user_file_data_source) { UserFileDataSource.new("spec/test_files/test_input_file.csv")}
      
      context "and some user is born on the same month and day" do
        it "returns an array with a Person for each user" do
          expected_person_array = [
            Person.new("John", "Doe", Date.new(1982, 10, 8), "john.doe@foobar.com"),
            Person.new("Ian", "Solo", Date.new(1977, 10, 8), "ian.solo@foobar.com")
          ]
          
          expect(user_file_data_source.find_persons_born_on(10, 8)).to eq(expected_person_array)
        end
      end
    
      context "and no user is born on the same month and day" do
        
        it "returns an empty array" do
          expect(user_file_data_source.find_persons_born_on(10, 9)).to eq([])
        end
      end
    
    end
    
  end
end
