class Admin::CandidatesController < Admin::BaseController
  before_action :set_candidate, except: [:index, :new]

  # GET /candidates
  def index
    @candidates = Candidate.all.page params[:page]
    set_meta_tags({
      title: "候選人管理"
    })
  end

  # GET /candidates/1
  def show
  end

  # GET /candidates/new
  def new
    @candidate = Candidate.new
    set_meta_tags({
      title: "新增候選人"
    })
  end

  # GET /candidates/1/edit
  def edit
    set_meta_tags({
      title: "編輯候選人"
    })
  end

  # POST /candidates
  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      redirect_to admin_candidates_url, notice: '候選人成功建立！'
    else
      render :new
    end
  end

  # PATCH/PUT /candidates/1
  def update
    if @candidate.update(candidate_params)
      redirect_to admin_candidates_url, notice: '候選人成功更新！'
    else
      render :edit
    end
  end

  # DELETE /candidates/1
  def destroy
    @candidate.destroy
    redirect_to admin_candidates_url, notice: '候選人成功刪除！'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_candidate
    @candidate = params[:id] ? Candidate.find(params[:id]) : Candidate.new(candidate_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def candidate_params
    params.require(:candidate).permit(:name, :published, :description, :image, :image_cache, :remove_image, :ngo, :ngo_link)
  end
end