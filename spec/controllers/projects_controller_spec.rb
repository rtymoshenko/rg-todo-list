require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe "If user sign_in" do
    before(:each){
      @user = build(:user)
      @project = create(:project)
      @project1 = build(:project)
    }

    it "should get INDEX" do
      sign_in @user
      get :index
      expect(response).to be_success
      expect(response).to render_template("index")

    end

    it "should create POST" do
      sign_in @user
      expect {
        post :create, project: FactoryGirl.attributes_for(:project, id: 2)
      }.to change(Project, :count).by(1)

    end

  end

end
