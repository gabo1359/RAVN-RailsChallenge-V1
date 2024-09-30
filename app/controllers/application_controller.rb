class ApplicationController < ActionController::Base
  include Pagy::Backend

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :needs_devise_layout?

  layout :layout_by_resource

  private

  def layout_by_resource
    if needs_devise_layout?
      "devise"
    else
      "application"
    end
  end

  def needs_devise_layout?
    return false if controller_name == "registrations" && %w[edit update].include?(action_name)

    devise_controller?
  end
end
