class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :"title"
      t.text :"story"
      t.text :"review"
      t.integer :"user_id"
      t.string :"image"
      t.timestamps
    end
  end
end
