class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :task_name
      t.integer :card_list_id

      t.timestamps null: false
    end
  end
end
