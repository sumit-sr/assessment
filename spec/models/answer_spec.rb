require 'rails_helper'

RSpec.describe AnswersController do

  describe "GET index" do

    it "assigns @answer" do
      answer = Answer.create
      get :index
      expect(assigns(:answer)).to eq([assignment])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

end