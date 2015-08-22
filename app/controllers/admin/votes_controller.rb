class Admin::VotesController < Admin::BaseController
  before_action :set_vote, except: [:index, :new]

  # GET /votes
  def index
    @votes = Vote.all.page params[:page]
    set_meta_tags({
      title: "投票表決管理"
    })
  end

  # GET /votes/1
  def show
  end

  # GET /votes/new
  def new
    @vote = Vote.new
    set_meta_tags({
      title: "新增投票表決"
    })
  end

  # GET /votes/1/edit
  def edit
    if @vote.clarify.blank?
      @clarify = @vote.build_clarify
    else
      @clarify = @vote.clarify
    end
    set_meta_tags({
      title: "編輯投票表決"
    })
  end

  # POST /votes
  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      redirect_to admin_votes_url, notice: '投票表決成功建立！'
    else
      render :new
    end
  end

  # PATCH/PUT /votes/1
  def update
    if @vote.update(vote_params)
      redirect_to admin_votes_url, notice: '投票表決成功更新！'
    else
      render :edit
    end
  end

  # DELETE /votes/1
  def destroy
    @vote.destroy
    redirect_to admin_votes_url, notice: '投票表決成功刪除！'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vote
    @vote = params[:id] ? Vote.find(params[:id]) : Vote.new(vote_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vote_params
    params.require(:vote).permit(:candidate_id, :issue_id, :content, :summary, :detail, :decision, :url, :date,
      :clarify_attributes => [:id, :record_id, :record_type, :content, :date, :_destroy])
  end
end