require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  let(:eren) { User.create!(username: 'eren_yaeger', password: 'asdasd') }
  let(:armin) { User.create!(username: 'armin', password: 'asdasd') }
  # new, create, pre-fill, persist to database, with valid/invalid params,
  # show, all of the goal fields, other user can access if public, not if pirvate,
  # edit, update, should prefill, persist to database, with valid/invalid params, only author can access
  # destroy, only author can destroy, should delete from database
  # index, shows all public goals, not private, show private if author

  before(:each) {sign_up_eren_yaeger}

  describe "GET #new" do
    it "renders new page" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      FactoryGirl.define do
        factory :goal do
          title "Invalid Goal"
        end
      end

      it "does not persist to database" do
        post :create, goal: {title: "Invalid Goal"}
        expect(Goal.last).to not_eq(:goal)
      end

      it "renders new page" do
        post :create, goal: {title: "Invalid Goal"}
        expect(response).to render_template(:new)
      end
    end

    context "with valid params" do
      FactoryGirl.define do
        factory :goal1 do
          title "Valid Goal"
          start_date "Mon, 10 Oct 2016"
          user_id 1
          description nil
          private_flag "false"
          deadline nil
          completed "false"
        end
      end
#validations user, title, description, private_flag, deadline, start_date, completed
      it "persists to database" do
        post :create, goal: { title: "Valid Goal", start_date: "Mon, 10 Oct 2016" }
        expect(Goal.last).to eq(:goal1)
      end

      it "renders new page" do
        post :create, goal: { title: "Valid Goal", start_date: "Mon, 10 Oct 2016" }
        expect(response).to render_template(:index)
      end
    end
  end

  describe "GET #show" do

    FactoryGirl.define do
      factory :goal2 do
        title "Valid Goal"
        start_date "Mon, 10 Oct 2016"
        user_id 1
        description nil
        private_flag "false"
        deadline nil
        completed "false"
      end
    end

    before do
      allow(controller).to receive(:current_user) { armin }
    end

    private_goal = FactoryGirl.create(:goal2, private_flag: "true")
    public_goal = FactoryGirl.create(:goal2)

    it "renders other user's goal if public" do
      get :show, {id: public_goal.id}
      expect(response).to render_template(:show)
    end

    it "does not render other user's goal if private" do
      get :show, {id: private_goal.id}
      expect(response).to render_template(:index)
    end


    goal.user_id


  end

end
