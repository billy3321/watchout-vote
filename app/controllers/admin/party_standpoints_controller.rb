class Admin::PartyStandpointsController < Admin::BaseController
  before_action :set_party_standpoint, except: [:index, :new]

  # GET /party_standpoints
  def index
    @party_standpoints = PartyStandpoint.all.page params[:page]
    set_meta_tags({
      title: "政黨表態管理"
    })
  end

  # GET /party_standpoints/1
  def show
  end

  # GET /party_standpoints/new
  def new
    @party_standpoint = PartyStandpoint.new
    set_meta_tags({
      title: "新增政黨表態"
    })
  end

  # GET /party_standpoints/1/edit
  def edit
    set_meta_tags({
      title: "編輯政黨表態"
    })
  end

  # POST /party_standpoints
  def create
    @party_standpoint = PartyStandpoint.new(party_standpoint_params)
    if @party_standpoint.save
      redirect_to admin_party_standpoints_url, notice: '政黨表態成功建立！'
    else
      render :new
    end
  end

  # PATCH/PUT /party_standpoints/1
  def update
    if @party_standpoint.update(party_standpoint_params)
      redirect_to admin_party_standpoints_url, notice: '政黨表態成功更新！'
    else
      render :edit
    end
  end

  # DELETE /party_standpoints/1
  def destroy
    @party_standpoint.destroy
    redirect_to admin_party_standpoints_url, notice: '政黨表態成功刪除！'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_party_standpoint
    @party_standpoint = params[:id] ? PartyStandpoint.find(params[:id]) : PartyStandpoint.new(party_standpoint_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def party_standpoint_params
    params.require(:party_standpoint).permit(:party_id, :issue_id, :agree, :disagree, :abstain, :notvote)
  end
end