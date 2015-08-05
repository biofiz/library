require 'rails_helper'

describe Comment do

  let(:user) { FactoryGirl.create(:user) }
  let(:comment) { FactoryGirl.create(:comment) }

  subject { comment }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:book_id) }
  it { should respond_to(:user) }
  it { should respond_to(:book) }
  it { should validate_presence_of :user }
  it { should validate_presence_of :book }

  it { should be_valid }

  describe "with blank content" do
    before { comment.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { comment.content = "a" * 1501 }
    it { should_not be_valid }
  end
end