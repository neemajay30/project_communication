require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:comment) { create(:comment, project: project, user: user) } # Uses FactoryBot

  before { sign_in user, scope: :user }

  describe "POST /projects/:project_id/comments" do
    context "with valid parameters" do
      it "creates a new comment" do
        expect {
          post project_comments_path(project), params: { comment: attributes_for(:comment) }
        }.to change(Comment, :count)
      end

      it "associates the comment with the current user" do
        post project_comments_path(project), params: { comment: attributes_for(:comment) }
        expect(Comment.last.user).to eq(user)
      end
    end
  end

  describe "DELETE /projects/:project_id/comments/:id" do
    it "deletes the comment" do
      comment_to_delete = create(:comment, project: project, user: user)
      expect {
        delete project_comment_path(project, comment_to_delete)
      }.to change(Comment, :count).by(-1)
    end
  end
end
