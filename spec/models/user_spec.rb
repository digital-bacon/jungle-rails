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

    it "should not allow a user to be created without a first name" do
      @user.first_name = nil
      @user.save
      expect(@user.errors[:first_name]).to include("can't be blank")
    end
    
    it "should not allow a user to be created without a last name" do
      @user.last_name = nil
      @user.save
      expect(@user.errors[:last_name]).to include("can't be blank")
    end

    it "should not allow a user to be created without an email" do
      @user.email = nil
      @user.save
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it "should not allow a user to be created without a password" do
      @user.password = nil
      @user.save
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it "should not allow a user to be created without a password_confirmation" do
      @user.password_confirmation = nil
      @user.save
      expect(@user.errors[:password_confirmation]).to include("can't be blank")
    end

  end
  
end
