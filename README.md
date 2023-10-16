# ActivityCalendar
Github-inspired activity calendar.

![Screenshot](https://raw.github.com/Solfanto/activity_calendar/master/Screenshot.png)

## Usage
```ruby
# In controller
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
  default_color: "#ebedf0",    # optional
  default_title: "no commit",  # optional
  tile_width: 10,              # optional
  tile_height: 10,             # optional
  tile_spacing: 2,             # optional
  tile_data: { toggle: "tooltip", placement: "top", html: "true" }, # optional, compatible with Bootstrap by default
  border_width: 1,              # optional
  border_radius: 2,            # optional
  date_format: "on %B %d, %Y"  # optional
)
```

```erb
# In view
<%= render_activity_calendar @activity_calendar, id: "activity-calendar" %>
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'activity_calendar', github: 'Solfanto/activity_calendar'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install activity_calendar --source=https://github.com/Solfanto/activity_calendar.git
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
