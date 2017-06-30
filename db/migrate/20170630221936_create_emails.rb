class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.string :email_address
      t.string :product_id

      t.timestamps
    end
  end
end
