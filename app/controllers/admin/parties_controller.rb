class Admin::PartiesController < Admin::BaseController
  before_action :set_party, except: [:index, :new]

  # GET /parties
  def index
    @parties = Party.all
    set_meta_tags({
      title: "政黨管理"
    })
  end

  # GET /parties/1
  def show
  end

  # GET /parties/new
  def new
    @party = Party.new
    set_meta_tags({
      title: "新增政黨"
    })
  end

  # GET /parties/1/edit
  def edit
    set_meta_tags({
      title: "編輯政黨"
    })
  end

  # POST /parties
  def create
    @party = Party.new(party_params)
    if @party.save
      redirect_to admin_parties_url, notice: '政黨成功建立！'
    else
      render :new
    end
  end

  # PATCH/PUT /parties/1
  def update
    if @party.update(party_params)
      redirect_to admin_parties_url, notice: '政黨成功更新！'
    else
      render :edit
    end
  end

  # DELETE /parties/1
  def destroy
    @party.destroy
    redirect_to admin_parties_url, notice: '政黨成功刪除！'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_party
    @party = params[:id] ? Party.find(params[:id]) : Party.new(party_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def party_params
    params.require(:party).permit(:name, :short_name, :abbreviation, :image, :image_cache, :remove_image,
      :background, :background_cache, :background_image, :prediction, :experience, :property)
  end
end