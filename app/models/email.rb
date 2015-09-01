class Email < ActiveRecord::Base
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, uniqueness: { case_sensitive: false }
  before_validation :lower_case_email

  scope :subscribed, -> { where(subscribed: true) }

  private

  def lower_case_email
    self.email.strip.downcase!
  end
end
