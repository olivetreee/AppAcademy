require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do

  describe "Test user validations" do
    it { should validate_presence_of(:username) }
    # it { should validate_presence_of(:name) }
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}
    it {should validate_length_of(:password).is_at_least(6)}
  end
  #
  # describe "Test user associations" do
  #   it {should have_many(:)}
  # end

  describe "::find_by_credentials" do
    # FactoryGirl.define do
    #   factory :user do
    #     username 'user1'
    #     password 'password'
    #   end
    # end


    context "invalid credentials" do
      it "should return nil" do
        expect(User.find_by_credentials('user2','nopassword')).to be_nil
      end
    end

    it "should valid new user's credentials" do
      user1 = FactoryGirl.create(:user, username:'user1', password:'password')
      # it "should return user" do
        # user1 = FactoryGirl.create :user1
        expect(User.find_by_credentials('user1','password')).to eq(user1)
      # end
    end




  end
end
