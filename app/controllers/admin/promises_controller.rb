class Admin::PromisesController < Admin::BaseController
  before_action :set_promise, except: [:index, :new]

  # GET /promises
  def index
    @promises = Promise.all.page params[:page]
    set_meta_tags({
      title: "承諾書管理"
    })
  end

  # GET /promises/1
  def show
  end

  # GET /promises/new
  def new
    @promise = Promise.new
    set_meta_tags({
      title: "新增承諾書"
    })
  end

  # GET /promises/1/edit
  def edit
    set_meta_tags({
      title: "編輯承諾書"
    })
  end

  # POST /promises
  def create
    @promise = Promise.new(promise_params)
    if @promise.save
      redirect_to admin_promises_url, notice: '承諾書成功建立！'
    else
      render :new
    end
  end

  # PATCH/PUT /promises/1
  def update
    if @promise.update(promise_params)
      redirect_to admin_promises_url, notice: '承諾書成功更新！'
    else
      render :edit
    end
  end

  # DELETE /promises/1
  def destroy
    @promise.destroy
    redirect_to admin_promises_url, notice: '承諾書成功刪除！'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_promise
    @promise = params[:id] ? Promise.find(params[:id]) : Promise.new(promise_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def promise_params
    params.require(:promise).permit(:candidate_id, :question_id, :answer, :summary, :detail, :decision, :date)
  end
end