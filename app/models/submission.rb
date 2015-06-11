class Submission < ActiveRecord::Base

  belongs_to :survey
  has_many :answers

  validates :survey_id, presence: true

end
