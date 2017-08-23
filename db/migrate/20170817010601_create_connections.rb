class CreateConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :connections do |t|
      t.integer :owner_id
      t.integer :added_id

      t.timestamps

    end
  end
end
