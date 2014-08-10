require 'rails_helper'

describe UsersController do
  describe "POST create" do
    context "successful signup" do
      it "sets the flash[:success] message" do
        post :create, user: { first_name: "John", last_name: "Doe", email: "test@example.com", password: "password" }
        expect(flash[:success]).to be_present
      end

      it "redirects to the user show page"
    end

    context "unsuccessful signup" do

    end
  end
end
