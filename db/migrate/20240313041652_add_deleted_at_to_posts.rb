class AddDeletedAtToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :deleted_at, :datetime
  end
end
