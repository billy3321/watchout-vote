class Admin::InterviewsController < Admin::BaseController
  before_action :set_interview, except: [:index, :new]

  # GET /interviews
  def index
    @interviews = Interview.all.page params[:page]
    set_meta_tags({
      title: "專訪管理"
    })
  end

  # GET /interviews/1
  def show
  end

  # GET /interviews/new
  def new
    @interview = Interview.new
    set_meta_tags({
      title: "新增專訪"
    })
  end

  # GET /interviews/1/edit
  def edit
    set_meta_tags({
      title: "編輯專訪"
    })
  end

  # POST /interviews
  def create
    @interview = Interview.new(interview_params)
    if @interview.save
      redirect_to admin_interviews_url, notice: '專訪成功建立！'
    else
      render :new
    end
  end

  # PATCH/PUT /interviews/1
  def update
    if @interview.update(interview_params)
      redirect_to admin_interviews_url, notice: '專訪成功更新！'
    else
      render :edit
    end
  end

  # DELETE /interviews/1
  def destroy
    @interview.destroy
    redirect_to admin_interviews_url, notice: '專訪成功刪除！'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_interview
    @interview = params[:id] ? Interview.find(params[:id]) : Interview.new(interview_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def interview_params
    params.require(:interview).permit(:alt, :candidate_id, :description, :date, :image, :image_cache, :remove_image)
  end
end