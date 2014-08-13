require 'rails_helper'

describe UsersController do
  describe "POST create" do
    let(:user) do
      User.create(first_name: "John",
                  last_name: "Doe",
                  email: "test@example.com",
                  password: "password")
    end

    context "successful signup" do
      it "sets the flash[:success] message" do
        post :create, user: { first_name: "John",
                              last_name: "Doe",
                              email: "test@example.com",
                              password: "password" }
        expect(flash[:success]).to be_present
      end

      it "creates a new user" do
        post :create, user: { first_name: user['first_name'],
                              last_name: user['last_name'],
                              email: user['email'],
                              password: user['password'] }
        expect(User.count).to eq(1)
      end
    end

    context "unsuccessful signup" do
      before { post :create, user: { first_name: "not enough info" } }

      it "sets the flash[:danger] message" do
        expect(flash[:danger]).to be_present
      end

      it "renders the front page" do
        expect(response).to render_template 'pages/front'
      end

      it "doesn't create a new user" do
        expect(User.count).to eq(0)
      end
    end
  end
end
