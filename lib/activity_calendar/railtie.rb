require_relative "./view_helper"

module ActivityCalendar
  class Railtie < ::Rails::Railtie
    initializer "activitiy_calender.view_helpers" do
      ActionView::Base.send(:include, ViewHelper)
    end
  end
end
