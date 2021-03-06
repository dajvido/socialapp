class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login, null: false, index: { unique: true }
      t.string :email, null: false, index: { unique: true }

      t.timestamps null: false
    end
  end
end
