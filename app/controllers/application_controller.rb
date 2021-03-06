class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :null_session, unless: -> { request.format.json? }
  before_filter :set_issues, :set_email
  # For APIs, you may want to use :null_session instead.
  def after_sign_in_path_for(resource)
    admin_root_path
  end

  layout :layout_by_resource

  private

  def set_issues
    @issues = Issue.all
  end

  def set_email
    @email = Email.new
  end

  def require_admin
    if user_signed_in? and not current_user.admin?
      sign_out current_user
      redirect_to '/'
    end
  end

  def layout_by_resource
    if devise_controller?
      "admin"
    else
      "application"
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def after_sign_in_path_for(resource)
    if current_user.admin
      request.env['omniauth.origin'] || stored_location_for(resource) || admin_root_path
    else
      sign_out current_user
      root_path
    end
  end
end
