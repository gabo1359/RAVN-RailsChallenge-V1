ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag =~ /^<label/
    "#{html_tag}<span class='text-red-500'>*</span>".html_safe
  else
    html_tag.html_safe
  end
end
