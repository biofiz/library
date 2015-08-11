class Book < ActiveRecord::Base
  validates :name,  presence: true
  validates :author,  presence: true
  validates :language,  presence: true
  validates :extension,  presence: true
  validates :size,  presence: true
  belongs_to :user
  has_many :comments
  enum status: [ :new_book, :active_book, :deleted_book ]
end
