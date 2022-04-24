class AddRateToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :rate, :float
  end
end
