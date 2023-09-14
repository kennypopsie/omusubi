class CreateStudies < ActiveRecord::Migration[7.0]
  def change
    create_table :studies do |t|
      t.time :start_time
      t.time :end_time
      t.time :break_time
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
