class Admin::SlidesController < Admin::BaseController
  before_filter :find_issue, except: [:sort]
  before_action :set_slide, except: [:index, :new, :update_slides, :sort]

  # GET /slides
  def index
    @slides = Slide.all
    set_meta_tags({
      title: "議題圖片管理"
    })
  end

  # GET /slides/1
  def show
  end

  # GET /slides/new
  def new
    @slide = Slide.new
    set_meta_tags({
      title: "新增議題圖片"
    })
  end

  # GET /slides/1/edit
  def edit
    set_meta_tags({
      title: "編輯議題圖片"
    })
  end

  # POST /slides
  def create
    @slide = Slide.new(slide_params)
    if @slide.save
      redirect_to edit_admin_issue_url(@issue), notice: '議題圖片成功建立！'
    else
      render :new
    end
  end

  # PATCH/PUT /slides/1
  def update
    if @slide.update(slide_params)
      redirect_to edit_admin_issue_url(@issue), notice: '議題圖片成功更新！'
    else
      render :edit
    end
  end

  # DELETE /slides/1
  def destroy
    @slide.destroy
    redirect_to edit_admin_issue_url(@issue), notice: '議題圖片成功刪除！'
  end

  def update_slides
    if slide_params[:slide_ids].any? and slide_params[:slide_positions].any?
      slide_positions = slide_params[:slide_positions]
      slide_ids = slide_params[:slide_ids]
      slide_ids.length.times.each do |i|
        slide = Slide.find(slide_ids[i])
        slide.position = slide_positions[i].to_i if slide_positions[i]
        slide.save
      end
      flash[:notice] = "議題圖片順序更新完畢！"
    end
    redirect_to edit_admin_issue_url(@issue)
  end

  def sort
    puts slide_params[:order]
    slide_params[:order].each do |key, value|
      Slide.find(value[:id]).update_attribute(:position, value[:position])
    end
    render :nothing => true
  end

  private

  def find_issue
    @issue = Issue.find(params[:issue_id])
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_slide
    @slide = params[:id] ? Slide.find(params[:id]) : Slide.new(slide_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def slide_params
    params.require(:slide).permit(:alt, :issue_id, :image, :image_cache, :remove_image, {slide_ids: []}, {slide_positions: []},
      {order: [:id, :position]}, :position)
  end
end