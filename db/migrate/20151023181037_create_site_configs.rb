class CreateSiteConfigs < ActiveRecord::Migration
  def change
    create_table :site_configs do |t|
      t.integer :site_id, null: false
      t.string :nag, limit: 5000
      t.timestamps null: false
      t.index :site_id
    end
  end
end
