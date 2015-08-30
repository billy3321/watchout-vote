class EmailsController < ApplicationController

  # POST /emails
  def create
    session[:return_to] ||= request.referer ? request.referer : root_url
    @email = Email.new(email_params)
    if @email.save
      redirect_to session.delete(:return_to), notice: '成功訂閱電子報！'
    else
      redirect_to session.delete(:return_to)
    end
  end

  # DELETE /emails/1
  def destroy
    session[:return_to] ||= request.referer ? request.referer : root_url
    @email = Email.where(email: email_params["email"].strip.downcase).first
    unless @email.blank?
      @email.destroy
    end
    redirect_to session.delete(:return_to), notice: '電子報訂閱取消！'
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_email
    @email = params[:id] ? Email.find(params[:id]) : Email.new(email_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def email_params
    params.require(:email).permit(:email)
  end
end