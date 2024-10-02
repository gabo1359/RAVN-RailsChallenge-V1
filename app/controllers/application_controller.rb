class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend

  rescue_from Pundit::NotAuthorizedError, with: :redirect_to_root
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_root

  before_action :authenticate_user!
  before_action :authorize_user!

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  layout :layout_by_resource

  private

  def layout_by_resource
    devise_controller? ? "devise" : "application"
  end

  def redirect_to_root(exception)
    case exception
    when Pundit::NotAuthorizedError
      flash[:alert] = t("shared.not_authorized")
    when ActiveRecord::RecordNotFound
      flash[:alert] = t("shared.not_found")
    end
    redirect_to root_path
  end
end
