class TestController < ApplicationController
  helper ActivityCalendar::Engine.helpers

  def index
    @user = User.first
    @activity_calendar = ActivityCalendar.new(
      resource: @user,
      start_at: Time.now.beginning_of_month,
      end_at: Time.now.end_of_month,
      colors: [
        "#ebedf0" => ->(resource, date) { resource.commits_count_for(date).zero? },
        "#cce395" => ->(resource, date) { resource.commits_count_for(date).between?(1, 99) },
        "#8dc679" => ->(resource, date) { resource.commits_count_for(date) >= 100 }
      ]
    )
  end
end
