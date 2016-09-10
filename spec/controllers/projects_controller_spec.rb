require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do


  describe "show action" do

    it "renders show template if project ID is found" do
      sign_in @user
      project = FactoryGirl.create(:project)
      get :show, { id: project.id }

      response.should render_template('show')
    end

    it "renders 404 if an ID is not found" do
      get :show, { id: 0 }
      binding.pry
      response.status.should == 404
    end
  end

end
