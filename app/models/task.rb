class Task < ActiveRecord::Base
  belongs_to :user

  validates :user, :description, presence: true

  belongs_to :parent, class_name: "Task"
  has_many :children, class_name: "Task", foreign_key: :parent_id

  def create_subtask(task_hash)
    task_hash[:user_id] = self.user_id
    self.children.create(task_hash)
  end
end