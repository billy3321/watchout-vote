class Admin::IssuesController < Admin::BaseController
  before_action :set_issue, except: [:index, :new]

  # GET /issues
  def index
    @issues = Issue.all
    set_meta_tags({
      title: "議題管理"
    })
  end

  # GET /issues/1
  def show
  end

  # GET /issues/new
  def new
    @issue = Issue.new
    set_meta_tags({
      title: "新增議題"
    })
  end

  # GET /issues/1/edit
  def edit
    set_meta_tags({
      title: "編輯議題"
    })
  end

  # POST /issues
  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      redirect_to admin_issues_url, notice: '議題成功建立！'
    else
      render :new
    end
  end

  # PATCH/PUT /issues/1
  def update
    if @issue.update(issue_params)
      redirect_to admin_issues_url, notice: '議題成功更新！'
    else
      render :edit
    end
  end

  # DELETE /issues/1
  def destroy
    @issue.destroy
    redirect_to admin_issues_url, notice: '議題成功刪除！'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_issue
    @issue = params[:id] ? Issue.find(params[:id]) : Issue.new(issue_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit(:name, :image, :image_cache, :remove_image, :description, :ngo, :ngo_link, :published, :summary)
  end
end