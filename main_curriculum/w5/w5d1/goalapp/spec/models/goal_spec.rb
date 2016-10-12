require 'rails_helper'

RSpec.describe Goal, type: :model do
  #validations user, title, description, private_flag, deadline, start_date, completed
  #associations b_t :user, h_m :comments
  # methods #toggle_complete

  describe "test goal validations" do
    it {should validate_presence_of(:user)}
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:start_date)}
  end

  describe "test goal associations" do
    it {should have_many(:comments)}
    it {should belong_to(:user)}
  end

  describe "toggle complete" do
    it "should mark goal as complete" do
      goal1 = Goal.new(title: "Completed Goal", user_id: 1, start_date: "Mon, 10 Oct 2016")
      expect(goal1.completed).to eq("false")
      goal1.toggle_complete
      expect(goal1.completed).to eq("true")
      goal1.toggle_complete
      expect(goal1.completed).to eq("false")
    end

  end





end
