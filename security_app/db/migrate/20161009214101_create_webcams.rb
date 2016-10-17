class CreateWebcams < ActiveRecord::Migration
  def change
    create_table :webcams do |t|
      t.string   "camera",             limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "image_file_name",    limit: 255
      t.string   "image_content_type", limit: 255
      t.integer  "image_file_size",    limit: 4
      t.datetime "image_updated_at"
    end
  end
end
