class CreateCalls < ActiveRecord::Migration[5.0]
  def change
    create_table :calls do |t|
      t.string :caller_name
      t.string :caller_picture
      t.boolean :call_type_icon
      t.string :date
      t.integer :number_of_calls
      t.string :time_of_call

      t.timestamps
    end
  end
end
