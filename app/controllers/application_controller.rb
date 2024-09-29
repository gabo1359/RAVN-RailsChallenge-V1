class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  layout :layout_by_resource

  private

  def layout_by_resource
    if controller_name == "registrations" && action_name == "edit"
      "application"
    elsif devise_controller?
      "devise"
    else
      "application"
    end
  end
end
