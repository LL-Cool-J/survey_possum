class Author < ActiveRecord::Base

  has_many :surveys

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

end
