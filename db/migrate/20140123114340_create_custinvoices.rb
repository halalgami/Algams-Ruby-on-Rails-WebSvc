class CreateCustinvoices < ActiveRecord::Migration
  def change
    create_table :custinvoices do |t|
      t.integer :usersubnumfk
      t.integer :usersubseqnumfk
      t.decimal :invoiceamount
      t.string :billyear
      t.string :billperiod
      t.integer :affectedinvoice
      t.datetime :createdate

      t.timestamps
    end
  end
end
