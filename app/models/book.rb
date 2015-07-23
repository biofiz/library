class Book < ActiveRecord::Base
  validates :name,  presence: true
  validates :author,  presence: true
  validates :language,  presence: true
  validates :extension,  presence: true
  validates :size,  presence: true
end
