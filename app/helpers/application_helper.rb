module ApplicationHelper
  def status_message(status)
    if status == "未着手"
      ""
    else
      status
    end
  end
end
