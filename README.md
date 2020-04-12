# ActivityCalendar
Github-inspired activity calendar.

## Usage
```ruby
# In controller
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
```

```erb
# In view
<%= render_activity_calendar @activity_calendar %>
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
