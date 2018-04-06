require 'rails_helper'

RSpec.describe AssignmentsController do

  before(:each) do
    login_user
  end

  describe "GET index" do

    it "assigns @assignments" do
      user =  FactoryGirl.create(:user, email:'faculty1@example.com')
      assignment = FactoryGirl.create(:assignment, user:user)
      get :index
      expect(assigns(:assignments)).to eq([assignment])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

end