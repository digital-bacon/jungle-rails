require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
    @user = User.new(first_name: 'First', last_name: 'Last', email: 'test@email.com', password: '123Password', password_confirmation: '123Password')
  end

  describe "validates" do
    context "given valid user inputs" do
      it "should create a user with no errors" do
        @user.save
        expect(@user.errors).to be_empty
      end
    end
    
    context "given an empty first_name" do
      it "should not allow a user to be created and return an error" do
        @user.first_name = nil
        @user.save
        expect(@user.errors[:first_name]).to include("can't be blank")
      end
    end
      
    context "given an empty last_name" do
      it "should not allow a user to be created and return an error" do
        @user.last_name = nil
        @user.save
        expect(@user.errors[:last_name]).to include("can't be blank")
      end
    end

    context "given an empty email" do
      it "should not allow a user to be created and return an error" do
        @user.email = nil
        @user.save
        expect(@user.errors[:email]).to include("can't be blank")
      end
    end

    context "given an empty email" do
      it "should not allow a user to be created and return an error" do
        @user.password = nil
        @user.save
        expect(@user.errors[:password]).to include("can't be blank")
      end
    end

    context "given an empty password_confirmation" do
      it "should not allow a user to be created and return an error" do
        @user.password_confirmation = nil
        @user.save
        expect(@user.errors[:password_confirmation]).to include("can't be blank")
      end
    end

    context "given a mismatched password_confirmation" do
      it "should not allow a user to be created and return an error" do
        @user.password_confirmation = "321password"
        @user.save
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end
    end

    context "given a password that's too short" do
      it "should not allow a user to be created and return an error" do
        @user.password = "321Pass"
        @user.password_confirmation = "321Pass"
        @user.save
        expect(@user.errors[:password]).to include("is too short (minimum is 8 characters)")
      end
    end

  end
  
end
