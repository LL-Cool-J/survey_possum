class Answer < ActiveRecord::Base

  #before_save callback for required questions

  belongs_to :question
  belongs_to :submission

  validates :response, presence: true, if: Proc.new {|a| a.question.required }

end
