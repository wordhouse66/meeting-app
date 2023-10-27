class CreateMeetings < ActiveRecord::Migration[7.1]
  def change
    create_table :meetings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :client_id
      t.integer :duration_hours
      t.integer :duration_minutes
      t.integer :user_id

      t.timestamps
    end
  end
end
