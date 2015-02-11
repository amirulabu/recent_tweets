class CreateTwitters < ActiveRecord::Migration
  def change
    create_table :twitters do |t|
      t.string :text
      t.integer :user_id

      t.timestamps
    end
  end
end
