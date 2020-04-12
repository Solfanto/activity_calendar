class ActivityCalendar::Calendar
  def initialize(resource:, start_at:, end_at:, colors:, **args)
    @resource = resource
    @start_at = start_at.to_date
    @end_at = end_at.to_date
    @colors = colors
    @default_color = args[:default_color] || "#ffffff"
    @default_title = args[:default_title]
  end

  def dates
    (@start_at..@end_at).to_a
  end

  def color_and_title_for_date(date)
    @colors.each do |color, procs|
      return color, procs[:title].call(@resource, date) if procs[:condition].call(@resource, date)
    end
    return @default_color, @default_title
  end
end
