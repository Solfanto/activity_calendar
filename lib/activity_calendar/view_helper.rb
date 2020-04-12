module ActivityCalendar::ViewHelper
  def render_activity_calendar(calendar)
    container_height = calendar.tile_height * 7 + calendar.tile_spacing * 8

    container_style = "display: flex; flex-direction: column; flex-wrap: wrap; align-content: flex-start;" \
      "height: #{container_height}px; paddign-left: #{calendar.tile_spacing}px; padding-top: #{calendar.tile_spacing}px"

    content_tag(:div, style: container_style) do
      calendar.dates.first.wday.times do
        concat(
          content_tag(
            :div,
            nil,
            style: "width: #{calendar.tile_width}px; height: #{calendar.tile_height}px; " \
              "margin-bottom: #{calendar.tile_spacing}px; margin-right: #{calendar.tile_spacing}px;"
          )
        )
      end

      calendar.dates.each do |date|
        color, title = calendar.color_and_title_for_date(date)
        concat(
          content_tag(
            :div,
            nil,
            title: "<b>#{title}</b> #{date.strftime(calendar.date_format)}",
            style: "background-color: #{color}; width: #{calendar.tile_width}px; height: #{calendar.tile_height}px; "\
              "margin-bottom: #{calendar.tile_spacing}px; margin-right: #{calendar.tile_spacing}px;",
            data: calendar.tile_data
          )
        )
      end
    end
  end
end
