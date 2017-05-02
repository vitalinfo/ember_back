class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :user
      t.column :title, :string
      t.column :description, :text
      t.column :start_at, :datetime
      t.timestamps
    end
    add_index :tasks, [:user_id, :start_at]
  end
end
