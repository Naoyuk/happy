class AddColumnPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :days_id, :integer
  end
end
