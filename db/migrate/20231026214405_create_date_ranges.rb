class CreateDateRanges < ActiveRecord::Migration[7.1]
  def change
    create_table :date_ranges do |t|
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end
  end
end
