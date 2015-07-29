class Survey < ActiveRecord::Base

  belongs_to :author
  has_many :questions
  has_many :submissions

  accepts_nested_attributes_for :questions, allow_destroy: true,
      reject_if: proc { |attributes| attributes['question_text'].blank? || attributes['question_type'].blank? }

  validates :author_id, presence: true
  validates :title, presence: true

  def required_questions
    self.questions.select {|q| q.required == true}
  end

  def check_if_questions?
    self.questions.count != 0 ? true : false
  end

  def check_if_submissions?
    self.submissions.count != 0 ? true : false
  end

end
