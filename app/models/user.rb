class User < ActiveRecord::Base
  has_secure_password
  has_many :tasks

  def top_level_tasks
    self.tasks.where(parent_id: nil)
  end
end