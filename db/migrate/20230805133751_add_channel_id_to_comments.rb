class AddChannelIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :channel, null: false, foreign_key: true
  end
end
