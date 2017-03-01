require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe "If user sign_in" do
    before(:each) do
      # @user = create(:user)
      # sign_in(@user)
      #@project = build(:project)

      @user = User.create!({:email => "guyq@gmail.com", :password => "romantrv", :password_confirmation => "romantrv"})
      sign_in @user
    end

    it "should get INDEX" do
      get :index
      expect(response).to be_success
      expect(response).to render_template("index")
    end

    it "should create POST" do
      post :create
      expect(Project.count).to eq(1)
    end

    it "should UPDATE" do
      @project = @user.projects.build(name: "New Project#")
      @project.save
      patch :update, id: @project, "project" => {"name" => "Updated Project#"}
      expect(Project.last.name).to eq("Updated Project#")
    end

    it "should DELETE" do
      @project = @user.projects.build(name: "New Project#")
      @project.save
      delete :destroy, id: @project
      expect(Project.count).to eq(0)
    end


  end
end
