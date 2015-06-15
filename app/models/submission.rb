class Submission < ActiveRecord::Base

  belongs_to :survey
  has_many :answers
  accepts_nested_attributes_for :answers

  def check_required?
    required = self.survey.required_questions
    answers = []
    required.each do |r|
      answers += r.answers_by_submission(self.id)
    end
    answers.all? {|a| a.response != nil}
  end

end
