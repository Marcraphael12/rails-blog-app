class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :Text
      t.datetime :CreatedAt
      t.datetime :UpdatedAt
      t.integer :CommentsCounter, default: 0
      t.integer :LikesCounter, default: 0

      t.timestamps
    end
  end
end
