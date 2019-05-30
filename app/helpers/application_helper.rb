module ApplicationHelper
  def icon_link_to(label, path, icon)
    link_to path do
      content_tag :span, class: "glyphicon glyphicon-#{icon}" do
        label
      end
    end
  end

  def flash_message(msg_type)
    # %Q = " "
    # %q = ' '
    %Q|<p class='#{msg_type}'>#{flash[msg_type]}</p>|.html_safe #用(),{},||,\\包起來都可以，html_safe表示此資料可安全顯示
    # <p class="notice"><%= notice %></p>
    # <p class="alert"><%= alert %></p>
  end

  def delete_link_to(label, url)
    link_to label, url, method: 'delete', class:'destroy', data: {confirm: '確定要刪除？'}
    # <%= link_to '刪除', candidate, method: 'delete', class:'destroy', data: {confirm: '確定要刪除？'}%>
  end
end
