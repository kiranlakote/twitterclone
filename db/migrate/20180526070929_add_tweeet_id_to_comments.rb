class AddTweeetIdToComments < ActiveRecord::Migration[5.2]
  def change
  	add_column :comments, :tweeet_id, :integer
  end
end
