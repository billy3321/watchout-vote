class Admin::QuestionsController < Admin::BaseController
  before_action :set_question, except: [:index, :new]

  # GET /questions
  def index
    @questions = Question.all.page params[:page]
    set_meta_tags({
      title: "承諾書問題管理"
    })
  end

  # GET /questions/1
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    set_meta_tags({
      title: "新增承諾書問題"
    })
  end

  # GET /questions/1/edit
  def edit
    set_meta_tags({
      title: "編輯承諾書問題"
    })
  end

  # POST /questions
  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to admin_questions_url, notice: '承諾書問題成功建立！'
    else
      render :new
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      redirect_to admin_questions_url, notice: '承諾書問題成功更新！'
    else
      render :edit
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    redirect_to admin_questions_url, notice: '承諾書問題成功刪除！'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = params[:id] ? Question.find(params[:id]) : Question.new(question_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:title, :description, :content, :issue_id)
  end
end