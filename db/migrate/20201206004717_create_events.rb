class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title,             null: false
      t.text :detail
      t.date :event_date,                null: false
      t.datetime :start_date
      t.datetime :end_date
      t.integer :category_id,      null: false

      t.timestamps
    end
  end
end
