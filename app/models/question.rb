class Question < ActiveRecord::Base

  belongs_to :survey
  has_many :answers

  def answers_by_submission(id)
    self.answers.select {|a| a.submission_id == id}
  end

end
