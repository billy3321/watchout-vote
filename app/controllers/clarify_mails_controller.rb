class ClarifyMailsController < ApplicationController
  def new
    @clarify_mail = ClarifyMail.new
  end

  def create
    session[:return_to] ||= request.referer ? request.referer : root_url
    @clarify_mail = ClarifyMail.new(params["clarify_mail"])
    @clarify_mail.request = request
    if @clarify_mail.deliver
      puts 'success'
      puts @clarify_mail
      redirect_to session.delete(:return_to), notice: '成功發送澄清信'
    else
      puts 'failed'
      puts @clarify_mail.errors
      redirect_to session.delete(:return_to), notice: '發生錯誤！'
    end
  end
end