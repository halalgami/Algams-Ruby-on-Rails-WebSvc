class CreateCustpayments < ActiveRecord::Migration
  def change
    create_table :custpayments do |t|
      t.string :paymentsource
      t.decimal :paymentamount
      t.integer :affectedinvoice
      t.datetime :createdate

      t.timestamps
    end
  end
end
