module ApplicationHelper
  def ajax_flash(div_id)
    response = ""
    flash_div = ""

    flash.each do |name, msg|
      if msg.is_a?(String)
        flash_div = "<div class=\"alert alert-#{name.to_sym == :notice ? 'success' : 'error'} ajax_flash\"><a class=\"close\" data-dismiss=\"alert\">&#215;</a> <div id=\"flash_#{name.to_sym == :notice ? 'notice' : 'error'}\">#{h(msg)}</div> </div>"
      end
    end

    response = "$('#top-div').children().remove();$('#{div_id}').prepend('#{flash_div}');"
    response.html_safe
  end
end
