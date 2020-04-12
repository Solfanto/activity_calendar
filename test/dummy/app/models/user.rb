require "memoist"

class User
  include ActiveModel::Model
  extend Memoist

  def self.first
    new
  end

  def commits_count_for(_date)
    rand(0..200)
  end
  memoize :commits_count_for
end
