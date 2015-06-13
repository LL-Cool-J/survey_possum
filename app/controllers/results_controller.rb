class ResultsController < ApplicationController

  def show
    @survey = Survey.find_by_id(params[:id])
    @submissions = Submission.where(survey_id: @survey.id)
    @questions = @survey.questions
  end

end
