class ClarifyMail < MailForm::Base
  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,   captcha: true
  attribute :url
  attribute :phone,     validate: true
  attribute :site_url,  validate: true
  attribute :candidate_name, validate: true
  attribute :record_type, validate: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "澄清：對於#{candidate_name}的#{record_type}",
      # :to => "wevote@watchout.tw",
      :to => "billy3321@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end