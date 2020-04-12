class TestController < ApplicationController
  def index
    @user = User.first
    @activity_calendar = ActivityCalendar::Calendar.new(
      resource: @user,
      start_at: 1.year.ago.beginning_of_week(:sunday),
      end_at: Time.now,
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
