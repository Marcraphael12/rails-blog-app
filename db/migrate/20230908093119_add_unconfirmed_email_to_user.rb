class AddUnconfirmedEmailToUser < ActiveRecord::Migration[7.0]
  change_table :users do |t|
    # Confirmable
    t.string   :unconfirmed_email
  end
end
