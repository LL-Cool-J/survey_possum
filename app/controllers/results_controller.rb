class ResultsController < ApplicationController
  before_action :logged_in?
  before_action :set_survey
  before_action :set_author
  before_action :check_author

  def show
    @submissions = Submission.where(survey_id: @survey.id)
    @questions = @survey.questions
  end

  private

  def set_survey
    @survey = Survey.find_by_id(params[:id])
  end

  def set_author
    @author = Author.find_by_id(@survey.author_id)
  end

end
