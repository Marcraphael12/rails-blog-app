class DeleteUselessColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :CreatedAt
    remove_column :posts, :UpdatedAt

    remove_column :comments, :CreatedAt
    remove_column :comments, :UpdatedAt

    remove_column :users, :CreatedAt
    remove_column :users, :UpdatedAt

    remove_column :likes, :CreatedAt
    remove_column :likes, :UpdatedAt
  end
end
