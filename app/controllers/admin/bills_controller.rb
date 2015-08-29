class Admin::BillsController < Admin::BaseController
  before_action :set_bill, except: [:index, :new]

  # GET /bills
  def index
    @bills = Bill.all.page params[:page]
    set_meta_tags({
      title: "法律提案管理"
    })
  end

  # GET /bills/1
  def show
  end

  # GET /bills/new
  def new
    @bill = Bill.new
    set_meta_tags({
      title: "新增法律提案"
    })
  end

  # GET /bills/1/edit
  def edit
    if @bill.clarify.blank?
      @clarify = @bill.build_clarify
    else
      @clarify = @bill.clarify
    end
    set_meta_tags({
      title: "編輯法律提案"
    })
  end

  # POST /bills
  def create
    @bill = Bill.new(bill_params)
    if @bill.save
      redirect_to admin_bills_url, notice: '法律提案成功建立！'
    else
      render :new
    end
  end

  # PATCH/PUT /bills/1
  def update
    if @bill.update(bill_params)
      redirect_to admin_bills_url, notice: '法律提案成功更新！'
    else
      render :edit
    end
  end

  # DELETE /bills/1
  def destroy
    @bill.destroy
    redirect_to admin_bills_url, notice: '法律提案成功刪除！'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bill
    @bill = params[:id] ? Bill.find(params[:id]) : Bill.new(bill_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bill_params
    params.require(:bill).permit(:candidate_id, :committee_id, :issue_id, :content, :summary, :detail, :decision, :url, :date,
      :category, clarify_attributes: [:id, :record_id, :record_type, :content, :date, :_destroy])
  end
end