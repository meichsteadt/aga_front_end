class EditEmails < ActiveRecord::Migration[5.0]
  def change
    change_table :emails do |t|
      t.integer :user_id
    end
  end
end
