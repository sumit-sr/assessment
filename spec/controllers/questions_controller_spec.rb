require 'rails_helper'

RSpec.describe AnswersController do

  before(:each) do
    login_user
  end

  describe "GET index" do

    it "assigns @answers" do
      user =  FactoryGirl.create(:user, email:'faculty1@example.com')
      answer = FactoryGirl.create(:answer, user:user)
      get :index
      expect(assigns(:answers)).to eq([answer])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

end