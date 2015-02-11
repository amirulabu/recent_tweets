class CreateTwittertexts < ActiveRecord::Migration
  def change
    create_table :twittertexts do |t|
      t.string :text
      t.integer :user_id
      t.time :time
      t.string :link

      t.timestamps
    end
  end
end
