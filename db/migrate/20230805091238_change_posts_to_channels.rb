class ChangePostsToChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :channels do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end 
end
