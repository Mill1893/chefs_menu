class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_super_admin!, unless: :public_page?

  private

  def authenticate_super_admin!
    if request.path == '/' || request.path.start_with?('/users/sign_in')
      return
    end
    authenticate_user!
    unless current_user&.role == 'super_admin'
      redirect_to root_path, alert: 'Access denied.'
    end
  end

  def public_page?
    request.path == '/'
  end
end
