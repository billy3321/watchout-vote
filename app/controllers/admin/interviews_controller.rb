class Admin::InterviewsController < Admin::BaseController
  before_filter :find_candidate, except: [:sort]
  before_action :set_interview, except: [:index, :new, :update_interviews, :sort]

  # GET /interviews
  def index
    @interviews = Interview.all
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
      redirect_to edit_admin_candidate_url(@candidate), notice: '專訪成功建立！'
    else
      render :new
    end
  end

  # PATCH/PUT /interviews/1
  def update
    if @interview.update(interview_params)
      redirect_to edit_admin_candidate_url(@candidate), notice: '專訪成功更新！'
    else
      render :edit
    end
  end

  # DELETE /interviews/1
  def destroy
    @interview.destroy
    redirect_to edit_admin_candidate_url(@candidate), notice: '專訪成功刪除！'
  end

  def update_interviews
    if interview_params[:interview_ids].any? and interview_params[:interview_positions].any?
      interview_positions = interview_params[:interview_positions]
      interview_ids = interview_params[:interview_ids]
      interview_ids.length.times.each do |i|
        interview = Interview.find(interview_ids[i])
        interview.position = interview_positions[i].to_i if interview_positions[i]
        interview.save
      end
      flash[:notice] = "專訪順序更新完畢！"
    end
    redirect_to edit_admin_candidate_url(@candidate)
  end

  def sort
    # puts interview_params[:order]
    interview_params[:order].each do |key, value|
      Interview.find(value[:id]).update_attribute(:position, value[:position])
    end
    render :nothing => true
  end

  private

  def find_candidate
    @candidate = Candidate.find(params[:candidate_id])
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_interview
    @interview = params[:id] ? Interview.find(params[:id]) : Interview.new(interview_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def interview_params
    params.require(:interview).permit(:title, :description, :content, :candidate_id, :image, :image_cache, :remove_image, {interview_ids: []}, {interview_positions: []},
      {order: [:id, :position]}, :position, :published, :date)
  end
end