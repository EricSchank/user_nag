class CreateNagHistories < ActiveRecord::Migration
  def change
    create_table :nag_histories do |t|
      t.integer :site_id, null: false
      t.integer :action_id, null: false
      t.integer :ticket_id, null: false
      t.boolean :ticket_specific, default: false
      t.timestamps null: false
      t.index :site_id
      t.index [:site_id, :ticket_id]
      t.index [:site_id, :action_id]
    end
  end
end
