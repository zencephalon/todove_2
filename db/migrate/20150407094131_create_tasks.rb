class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :project
      t.string :description
      t.string :status
      t.timestamps
    end
  end
end
