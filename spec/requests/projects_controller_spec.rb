require 'rails_helper'

RSpec.describe "Projects", type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  before { sign_in user, scope: :user }

  describe "POST /projects" do
    context "with valid parameters" do
      it "creates a new project" do
        expect {
          post projects_path, params: { project: attributes_for(:project) }
        }.to change(Project, :count).by(1)
      end

      it "redirects to the created project" do
        post projects_path, params: { project: attributes_for(:project) }
        expect(response).to redirect_to(project_path(Project.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new project" do
        expect {
          post projects_path, params: { project: { name: "", description: "", status: "" } }
        }.not_to change(Project, :count)
      end

      it "renders the new template" do
        post projects_path, params: { project: { name: "", description: "", status: "" } }
        expect(response.body).to include("error")
      end
    end
  end

  describe "GET /projects/:id/edit" do
    it "returns a success response" do
      get edit_project_path(project)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /projects/:id" do
    context "with valid parameters" do
      it "updates the project" do
        patch project_path(project), params: { project: { name: "Updated Name" } }
        project.reload
        expect(project.name).to eq("Updated Name")
      end

      it "redirects to the project" do
        patch project_path(project), params: { project: { name: "Updated Name" } }
        expect(response).to redirect_to(project_path(project))
      end
    end

    context "with invalid parameters" do
      it "does not update the project" do
        patch project_path(project), params: { project: { name: "" } }
        project.reload
        expect(project.name).not_to eq("")
      end

      it "renders the edit template" do
        patch project_path(project), params: { project: { name: "" } }
        expect(response.body).to include("error")
      end
    end
  end

  describe "DELETE /projects/:id" do
    it "destroys the project" do
      project_to_delete = create(:project, user: user)
      expect {
        delete project_path(project_to_delete)
      }.to change(Project, :count).by(-1)
    end

    it "redirects to the projects list" do
      delete project_path(project)
      expect(response).to redirect_to(projects_path)
    end
  end
end
