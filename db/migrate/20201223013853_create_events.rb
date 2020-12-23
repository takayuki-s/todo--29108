class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title,           null: false
      t.text :detail
      t.date :event_date,        null: false
      t.time :event_time
      t.integer :category_id,    null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
