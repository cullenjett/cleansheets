require 'rails_helper'

describe SessionsController do
  describe 'POST create' do
    let(:joe) { User.create(first_name: "Joe", last_name: "Montana", email: "test@example.com", password: "password") }

    context "with valid credentials" do
      it "sets the user in the session" do
        post :create, email: joe.email, password: joe.password
        expect(session[:user_id]).to eq(joe.id)
      end

      it "redirects to the user show page" do
        post :create, email: joe.email, password: joe.password
        expect(response).to redirect_to user_path(joe)
      end
    end

    context "with invalid credentials" do
      it "sets the flash[:danger] message" do
        post :create, email: joe.email, password: "wrong password"
        expect(flash[:danger]).to be_present
      end

      it "renders the session#new template" do
        post :create, email: joe.email, password: "wrong password"
        expect(response).to render_template :new
      end

      it "does not set the user in the session" do
        post :create, email: joe.email, password: "wrong password"
        expect(session[:user_id]).to be nil
      end
    end
  end#POST create

  describe 'GET destroy' do
    before do
      session[:user_id] = 'some_id'
      get :destroy
    end

    it "removes the user from the session" do
      expect(session[:user_id]).to be nil
    end

    it "redirects to the home page" do
      expect(response).to redirect_to root_path
    end

    it "sets the flash[:success] message" do
      expect(flash[:success]).to be_present
    end
  end#GET destroy
end
