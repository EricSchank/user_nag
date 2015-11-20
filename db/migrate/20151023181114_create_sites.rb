class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :auid, null: false
      t.timestamps null: false
      t.index :auid
    end
  end
end
