class CreateCalendars < ActiveRecord::Migration[7.1]
  def change
    create_table :calendars do |t|
      t.datetime :date_of_choice

      t.timestamps
    end
  end
end
