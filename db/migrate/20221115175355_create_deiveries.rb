class CreateDeiveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deiveries do |t|
      t.string :description
      t.string :details
      t.date :arrives
      t.boolean :recieved
      t.integer :user_id

      t.timestamps
    end
  end
end
