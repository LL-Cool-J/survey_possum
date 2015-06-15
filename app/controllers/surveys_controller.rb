class SurveysController < ApplicationController
  before_action :logged_in?, except: [:show]
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  before_action :check_author, only: [:edit, :update, :destroy]
  before_action :check_for_submissions, only: [:edit]
  before_action :check_for_questions, only: [:update]
  before_action :check_published, only: :show

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.where(author_id: session[:author_id])
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @questions = @survey.questions
    @submission = Submission.new(survey_id: params[:survey_id])
    @submission.answers.build
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    @survey.questions.build
  end

  # GET /surveys/1/edit
  def edit
    @survey.questions.build
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)
    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
      @author = @survey.author
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:author_id, :title, :description, :published,
          questions_attributes: [:id, :question_text, :question_info, :question_type,
          :required, :order_number, :_destroy])
    end

    def check_for_submissions
      if @survey.check_if_submissions?
        redirect_to @survey, notice: "Survey cannot be edited. Answers have been submitted."
      else
        return true
      end
    end

    def check_for_questions
      if !(@survey.check_if_questions?) && survey_params[:published] == "true"
        @survey.unpublish!
        redirect_to @survey, notice: "Surveys must have at least one question to be published."
      else
        return true
      end
    end

    def check_published
      if !(@survey.published) && !(session[:author_id])
        redirect_to login_path, notice: "Please Login."
      end
    end

end
