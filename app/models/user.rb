class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :books, dependent: :destroy
  has_many :comments, dependent: :destroy
  enum role: [ :demo, :usual, :native, :librarian, :admin ]

end
