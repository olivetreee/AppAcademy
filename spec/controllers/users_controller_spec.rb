require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders sign up page" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "redirects to user show page" do
        post :create, user: {username:'user2', password: 'hunter2'}
        expect(response).to redirect_to(user_url(User.find_by(username: 'user2')))
      end
    end

    context "with invalid params" do
      it "render the new template" do
        post :create, user: {username:'user2'}
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #show" do
    it "accesses the correct user" do
      get :show, {id: 1}
      expect(params[:id]).to eq(1)
    end
  end
end
