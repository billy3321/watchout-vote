class Admin::CandidateStandpointsController < Admin::BaseController
  before_action :set_candidate_standpoint, except: [:index, :new]

  # GET /candidate_standpoints
  def index
    @candidate_standpoints = CandidateStandpoint.all.page params[:page]
    set_meta_tags({
      title: "候選人表態管理"
    })
  end

  # GET /candidate_standpoints/1
  def show
  end

  # GET /candidate_standpoints/new
  def new
    @candidate_standpoint = CandidateStandpoint.new
    set_meta_tags({
      title: "新增候選人表態"
    })
  end

  # GET /candidate_standpoints/1/edit
  def edit
    set_meta_tags({
      title: "編輯候選人表態"
    })
  end

  # POST /candidate_standpoints
  def create
    @candidate_standpoint = CandidateStandpoint.new(candidate_standpoint_params)
    if @candidate_standpoint.save
      redirect_to admin_candidate_standpoints_url, notice: '候選人表態成功建立！'
    else
      render :new
    end
  end

  # PATCH/PUT /candidate_standpoints/1
  def update
    if @candidate_standpoint.update(candidate_standpoint_params)
      redirect_to admin_candidate_standpoints_url, notice: '候選人表態成功更新！'
    else
      render :edit
    end
  end

  # DELETE /candidate_standpoints/1
  def destroy
    @candidate_standpoint.destroy
    redirect_to admin_candidate_standpoints_url, notice: '候選人表態成功刪除！'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_candidate_standpoint
    @candidate_standpoint = params[:id] ? CandidateStandpoint.find(params[:id]) : CandidateStandpoint.new(candidate_standpoint_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def candidate_standpoint_params
    params.require(:candidate_standpoint).permit(:candidate_id, :issue_id, :agree, :disagree, :abstain, :notvote)
  end
end