class User
  include ActiveModel::Model

  def self.first
    new
  end

  def commits_count_for(date)
    rand(0..200)
  end
end
