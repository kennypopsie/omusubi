class CreateStudies < ActiveRecord::Migration[7.0]
  def change
    create_table :studies do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :break_time
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
