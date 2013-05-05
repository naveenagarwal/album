class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.references  :user
      t.string      :name
      t.integer     :photos_count, default: 0

      t.timestamps
    end
    add_index :folders, :user_id
  end
end
