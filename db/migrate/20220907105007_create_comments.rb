class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :trip_id, null: false
      t.integer :customer_id, null: false
      t.string :comment_text

      t.timestamps
    end
  end
end
