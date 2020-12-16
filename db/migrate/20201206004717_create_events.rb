class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :detail
      t.date :event_date
      t.time :event_time
      t.integer :category_id
      t.timestamps
    end
  end
end
