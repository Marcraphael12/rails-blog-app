class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :Name
      t.string :Photo, default: "https://this-person-does-not-exist.com/img/avatar-gen11828689f76739ac5772010de9c529f7.jpg"
      t.text :Bio , default: "Developer"
      t.datetime :CreatedAt
      t.datetime :UpdatedAt
      t.integer :PostCounter, default: 0

      t.timestamps
    end
  end
end
