class CreateTasks < ActiveRecord::Migration
  def change
    create_tables :tasks do |t|
      t.references :project
      t.string :description
      t.string :status
      t.timestamps
    end
  end
end
