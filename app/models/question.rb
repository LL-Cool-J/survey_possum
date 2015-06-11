class Question < ActiveRecord::Base

  belongs_to :survey
  has_many :answers

  validates :survey_id, presence: true
  # validates :question_text, presence: true
  # validates :question_type, presence: true

end
