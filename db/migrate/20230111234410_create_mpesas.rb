class CreateMpesas < ActiveRecord::Migration[7.0]
  def change
    create_table :mpesas do |t|
      t.belongs_to :order, foreign_key: true
      t.string :checkoutRequestId
      t.string :merchantRequestId
      t.string :amount
      t.string :mpesaReceiptNumber
      t.string :phoneNumber

      t.timestamps
    end
  end
end
