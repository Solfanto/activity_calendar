class ActivityCalendar::Calendar
  attr_reader :tile_width, :tile_height, :tile_spacing, :tile_data, :date_format

  DEFAULT_ARGS = {
    default_color: "#ffffff",
    tile_width: 10,
    tile_height: 10,
    tile_spacing: 3,
    tile_data: { toggle: "tooltip", placement: "top", html: "true" },
    date_format: "on %B %d, %Y"
  }.freeze

  def initialize(resource:, start_at:, end_at:, colors:, **args)
    @resource = resource
    @start_at = start_at.to_date
    @end_at = end_at.to_date
    @colors = colors
    @default_color = args[:default_color] || DEFAULT_ARGS[:default_color]
    @default_title = args[:default_title]
    @tile_width = args[:tile_width] || DEFAULT_ARGS[:tile_width]
    @tile_height = args[:tile_height] || DEFAULT_ARGS[:tile_height]
    @tile_spacing = args[:tile_spacing] || DEFAULT_ARGS[:tile_spacing]
    @tile_data = args[:tile_data] || DEFAULT_ARGS[:tile_data]
    @date_format = args[:date_format] || DEFAULT_ARGS[:date_format]
  end

  def dates
    (@start_at..@end_at).to_a
  end

  def color_and_title_for_date(date)
    @colors.each do |color, procs|
      return color, procs[:title].call(@resource, date) if procs[:condition].call(@resource, date)
    end
    [@default_color, @default_title]
  end
end
