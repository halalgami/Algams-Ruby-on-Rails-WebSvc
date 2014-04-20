class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :password_digest
      t.string :realname
      t.string :status
      t.text :userinfo

      t.timestamps
    end
  end
end
