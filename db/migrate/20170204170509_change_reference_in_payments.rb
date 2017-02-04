class ChangeReferenceInPayments < ActiveRecord::Migration
  def change
    remove_reference :payments, :user
    add_reference :payments, :student
  end
end
