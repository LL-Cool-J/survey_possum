class Survey < ActiveRecord::Base

  belongs_to :author
  has_many :questions
  has_many :submissions

  accepts_nested_attributes_for :questions,  reject_if: :all_blank, allow_destroy: true

  validates :author_id, presence: true
  validates :title, presence: true

end
