class Admin::InterpellationsController < Admin::BaseController
  before_action :set_interpellation, except: [:index, :new]

  # GET /interpellations
  def index
    @interpellations = Interpellation.all.page params[:page]
    set_meta_tags({
      title: "提案發言質詢"
    })
  end

  # GET /interpellations/1
  def show
  end

  # GET /interpellations/new
  def new
    @interpellation = Interpellation.new
    set_meta_tags({
      title: "新增發言質詢"
    })
  end

  # GET /interpellations/1/edit
  def edit
    if @interpellation.clarify.blank?
      @clarify = @interpellation.build_clarify
    else
      @clarify = @interpellation.clarify
    end
    set_meta_tags({
      title: "編輯發言質詢"
    })
  end

  # POST /interpellations
  def create
    @interpellation = Interpellation.new(interpellation_params)
    if @interpellation.save
      redirect_to admin_interpellations_url, notice: '發言質詢成功建立！'
    else
      render :new
    end
  end

  # PATCH/PUT /interpellations/1
  def update
    if @interpellation.update(interpellation_params)
      redirect_to admin_interpellations_url, notice: '發言質詢成功更新！'
    else
      render :edit
    end
  end

  # DELETE /interpellations/1
  def destroy
    @interpellation.destroy
    redirect_to admin_interpellations_url, notice: '發言質詢成功刪除！'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_interpellation
    @interpellation = params[:id] ? Interpellation.find(params[:id]) : Interpellation.new(interpellation_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def interpellation_params
    params.require(:interpellation).permit(:candidate_id, :committee_id, :issue_id, :content, :summary, :detail, :decision, :url, :date,
      :category, clarify_attributes: [:id, :record_id, :record_type, :content, :date, :_destroy])
  end
end