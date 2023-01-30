require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
    @user = User.new(first_name: 'First', last_name: 'Last', email: 'test@email.com', password: '123Password', password_confirmation: '123Password')
  end

  describe "validations" do
    it "should create a user when there are no validation errors" do
      @user.save
      expect(@user.errors).to be_empty
    end
  end
  
end
