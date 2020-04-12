class TestController < ApplicationController
  def index
    @user = User.first
    @activity_calendar = ActivityCalendar::Calendar.new(
      resource: @user,
      start_at: Time.now.beginning_of_month,
      end_at: Time.now.end_of_month,
      colors: {
        "#cce395" => {
          condition: ->(resource, date) { resource.commits_count_for(date).between?(1, 99) },
          title: ->(resource, date) { "#{resource.commits_count_for(date)} commits" }
        },
        "#8dc679" => {
          condition: ->(resource, date) { resource.commits_count_for(date) >= 100 },
          title: ->(resource, date) { "#{resource.commits_count_for(date)} commits" }
        }
      },
      default_color: "#ebedf0",
      default_title: "no commit"
    )
  end
end
