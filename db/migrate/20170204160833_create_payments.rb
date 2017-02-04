class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :month
      t.integer :year
      t.date :paid_at

      t.timestamps null: false
    end
  end
end
