require 'rails_helper'

RSpec.describe User, type: :model do

  fixtures :all
  
  describe "validation" do
    
    before(:each) do
      @user = User.new(first_name: 'First', last_name: 'Last', email: 'test@email.com', password: '123Password', password_confirmation: '123Password')
    end
    
    context "when given valid user inputs" do
      it "should create a user with no errors" do
        @user.save
        expect(@user.errors).to be_empty
      end
    end
    
    context "when given an empty first_name" do
      it "should not allow a user to be created and return an error" do
        @user.first_name = nil
        @user.save
        expect(@user.errors[:first_name]).to include("can't be blank")
      end
    end
      
    context "when given an empty last_name" do
      it "should not allow a user to be created and return an error" do
        @user.last_name = nil
        @user.save
        expect(@user.errors[:last_name]).to include("can't be blank")
      end
    end

    context "when given an empty email" do
      it "should not allow a user to be created and return an error" do
        @user.email = nil
        @user.save
        expect(@user.errors[:email]).to include("can't be blank")
      end
    end

    context "when given an empty email" do
      it "should not allow a user to be created and return an error" do
        @user.password = nil
        @user.save
        expect(@user.errors[:password]).to include("can't be blank")
      end
    end

    context "when given an empty password_confirmation" do
      it "should not allow a user to be created and return an error" do
        @user.password_confirmation = nil
        @user.save
        expect(@user.errors[:password_confirmation]).to include("can't be blank")
      end
    end

    context "when given a mismatched password_confirmation" do
      it "should not allow a user to be created and return an error" do
        @user.password_confirmation = "321password"
        @user.save
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end
    end

    context "when given a password that's too short" do
      it "should not allow a user to be created and return an error" do
        @user.password = "321Pass"
        @user.password_confirmation = "321Pass"
        @user.save
        expect(@user.errors[:password]).to include("is too short (minimum is 8 characters)")
      end
    end

    context "when given an email that's already taken" do
      it "should not be case sensitive" do
        email = "TEST@email.com"
        @user_case_sensitive = User.new(first_name: 'First', last_name: 'Last', email: email, password: '123Password', password_confirmation: '123Password')
        @user_case_sensitive.save
        expect(@user_case_sensitive.email).to eq("test@email.com")
      end
      it "should not allow a user to be created and return an error" do
        fixture_user = users(:marko)
        @user.email = "marko.anastasov@test.com"
        @user.save
        expect(@user.errors[:email]).to include("has already been taken")
      end
    end
  end

  describe ".authenticate_with_credentials" do
    before(:all) do
      @user = User.new(first_name: 'First', last_name: 'Last', email: 'test@email.com', password: '123Password', password_confirmation: '123Password')
    end

    context "when a user is verified" do
      it "should authenticate normally" do
        expect(user = User.authenticate_with_credentials('test@email.com', '123password')).to eql(user)
      end
    end

    context "when provided an email with whitespace" do
      it "should authenticate normally" do
        expect(user = User.authenticate_with_credentials(' test@email.com  ', '123password')).to eql(user)
      end
    end

    context "when provided a mixed case email" do
      it "should authenticate normally" do
        expect(user = User.authenticate_with_credentials('TEST@email.com', '123password')).to eql(user)
      end
    end

    context "when provided an empty email" do
      it "should not authenticate the user" do
        expect(user = User.authenticate_with_credentials('', '123password')).to be(nil)
      end
    end

    context "when provided an empty password" do
      it "should not authenticate the user" do
        expect(user = User.authenticate_with_credentials('test@email.com', '')).to be(nil)
      end
    end

    context "when provided a password that exactly matches the stored password_digest string" do
      it "should not authenticate the user" do
        expect(user = User.authenticate_with_credentials('test@email.com', @user.password_digest)).to be(nil)
      end
    end

  end
  
end
