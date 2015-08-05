require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.create(:user) }
  let(:book) { FactoryGirl.create(:book) }

  subject { user }
      it { should respond_to(:books) }
      it { should respond_to(:comments) }

  describe "micropost associations" do

    before { user.save }
    let!(:older_comment) do
      FactoryGirl.create(:comment, user: user, book: book, created_at: 1.day.ago)
    end
    let!(:newer_comment) do
      FactoryGirl.create(:comment, user: user, book: book, created_at: 1.hour.ago)
    end

    it "should have the right comments in the right order" do
      expect(user.comments.to_a).to eq [newer_comment, older_comment]
    end

    it "should not destroy associated comments" do
      comments = user.comments.to_a
      user.destroy
      expect(comments).not_to be_empty
      comments.each do |comment|
        expect(Comment.where(id: comment.id)).to be_empty
      end
    end
  end

end