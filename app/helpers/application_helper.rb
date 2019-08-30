module ApplicationHelper
  def devise_error_messages
    return if resource.errors.empty?
    html = ""
    resource.errors.full_messages.each do |msg|
      html += <<-EOF
        <div>
          <p style="color: red;">#{msg}\n</p>
        </div>
      EOF
    end
    html.html_safe
  end
end