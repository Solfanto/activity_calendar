module ActivityCalendar::ViewHelper
  def render_activity_calendar(calendar)
    content_tag(:div) do
      calendar.dates.each do |date|
        color, title = calendar.color_and_title_for_date(date)
        concat(content_tag(:div, "Date: #{date}, color: #{color}, title: #{title}", style: "color: #{color}"))
      end
    end
  end
end
