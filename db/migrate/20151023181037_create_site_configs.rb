class CreateSiteConfigs < ActiveRecord::Migration
  def change
    create_table :site_configs do |t|
      t.integer :site_id, null: false
      t.string :nag
      t.timestamps null: false
    end
  end
end
