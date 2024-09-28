module ApplicationHelper
  def show_svg(path)
    File.open("app/assets/images/icons/#{path}", "rb") do |file|
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
end
