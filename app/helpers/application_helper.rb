module ApplicationHelper
  def flash_messages
    unless flash.empty?
      flash.map { |message_type, message| content_tag(:div, message,
                                                      class: "container alert alert-#{message_type}") }.join.html_safe
    end
  end
end
