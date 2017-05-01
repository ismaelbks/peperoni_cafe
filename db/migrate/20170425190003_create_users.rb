class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :pseudo
      t.string :phone_number
      t.string :last_name

      t.timestamps
    end
  end
end
