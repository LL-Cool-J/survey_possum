class Submission < ActiveRecord::Base

  belongs_to :survey
  has_many :answers
  accepts_nested_attributes_for :answers

  # validates :survey_id, presence: true

end
