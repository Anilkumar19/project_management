class CreateCardLists < ActiveRecord::Migration
  def change
    create_table :card_lists do |t|
      t.string :title
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
