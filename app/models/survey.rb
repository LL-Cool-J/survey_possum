class Survey < ActiveRecord::Base

  belongs_to :author
  has_many :questions
  has_many :submissions

  accepts_nested_attributes_for :questions

  validates :author_id, presence: true
  validates :title, presence: true
  validates :published, presence: true

end
