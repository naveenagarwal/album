class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references  :folder
      t.string      :pic_file_name
      t.string      :pic_content_type
      t.integer     :pic_file_size

      t.timestamps
    end
    add_index :photos, :folder_id
  end
end
