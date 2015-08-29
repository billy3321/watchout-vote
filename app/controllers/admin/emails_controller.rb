class Admin::EmailsController < Admin::BaseController
  before_action :set_email, except: [:index, :export, :new]

  # GET /emails
  def index
    @emails = Email.all.page params[:page]
    set_meta_tags({
      title: "電子報訂閱管理"
    })
  end

  def export
    @emails = Email.all
    set_meta_tags({
      title: "電子報訂閱匯出"
    })
  end

  # GET /emails/1
  def show
  end

  # GET /emails/new
  def new
    @email = Email.new
    set_meta_tags({
      title: "新增議題"
    })
  end

  # GET /emails/1/edit
  def edit
    set_meta_tags({
      title: "編輯議題"
    })
  end

  # POST /emails
  def create
    @email = Email.new(email_params)
    if @email.save
      redirect_to admin_emails_url, notice: '電子報訂閱成功建立！'
    else
      render :new
    end
  end

  # PATCH/PUT /emails/1
  def update
    if @email.update(email_params)
      redirect_to admin_emails_url, notice: '電子報訂閱成功更新！'
    else
      render :edit
    end
  end

  # DELETE /emails/1
  def destroy
    @email.destroy
    redirect_to admin_emails_url, notice: '電子報訂閱成功刪除！'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_email
    @email = params[:id] ? Email.find(params[:id]) : Email.new(email_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def email_params
    params.require(:email).permit(:name, :image, :image_cache, :remove_image, :description, :ngo, :ngo_link, :published)
  end
end