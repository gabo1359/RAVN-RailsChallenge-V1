module ApplicationHelper
  include Pagy::Frontend

  def show_svg(path)
    File.open("app/assets/images/icons/#{path}.svg", "rb") do |file|
      raw file.read
    end
  end

  def flash_classes_for(flash_type)
    case flash_type
    when "alert"
      "border-red-500 bg-red-50 text-red-600"
    when "notice"
      "border-blue-500 bg-blue-50 text-blue-600"
    when "success"
      "border-green-500 bg-green-50 text-green-600"
    end
  end

  def countries_for_select
    ISO3166::Country.all.map { |country| [country.iso_short_name, country.alpha2] }
  end

  def country_selected(alpha2)
    ISO3166::Country[alpha2&.to_sym]
  end
end
