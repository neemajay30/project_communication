require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "#audit_status" do
    let(:user) { FactoryBot.create(:user) }

    context "when creating a new project" do
      it "creates a comment for draft status" do
        project = FactoryBot.build(:project, status: 'draft')

        expect {
          project.save
        }.to change { project.comments.count }.from(0).to(1)

        comment = project.comments.last
        expect(comment.user).to eq(project.user)
        expect(comment.content).to eq("Status has changed 'Draft'")
        expect(comment.properties).to eq({ "status" => %w[draft draft] })
      end
    end

    context "when updating an existing project" do
      let(:project) { FactoryBot.create(:project, status: 'draft') }

      it "creates a comment when the status changes" do
        project.current_user = user

        expect {
          project.update(status: 'in_progress')
        }.to change { project.comments.count }.by(1)

        comment = project.comments.last
        expect(comment.user).to eq(user)
        expect(comment.content).to eq("Status has changed 'Draft' to 'In progress'")
        expect(comment.properties).to eq({ "status" => %w[draft in_progress] })
      end

      it "does not create a comment when the status does not change" do
        project.current_user = user

        expect {
          project.update(name: 'New Name')
        }.not_to change { project.comments.count }
      end

      it "does not create a comment when the status is set to the same value" do
        project.current_user = user

        expect {
          project.update(status: 'draft')
        }.not_to change { project.comments.count }
      end
    end
  end
end
