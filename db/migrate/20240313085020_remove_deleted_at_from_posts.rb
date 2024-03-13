class RemoveDeletedAtFromPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :deleted_at, :datetime
  end
end
