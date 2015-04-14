class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.boolean :status, default: false
      t.references :user, null: false
      t.references :parent
      t.timestamps
    end
  end
end
