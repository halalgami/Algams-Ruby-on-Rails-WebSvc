class CreateUsersubnums < ActiveRecord::Migration
  def change
    create_table :usersubnums do |t|
      t.integer :subnum
      t.string :status
      t.datetime :createdate

      t.timestamps
    end
  end
end
