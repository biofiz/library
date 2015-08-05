class Comment < ActiveRecord::Base
  validates :user, :book, presence: true
  belongs_to :user
  belongs_to :book
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 1500 }
end
