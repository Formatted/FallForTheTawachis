class CreateCompanions < ActiveRecord::Migration
  def change
    create_table :companions do |t|
      t.belongs_to :customer
      t.belongs_to :reservation
      t.belongs_to :invitee
      t.belongs_to :meal
      t.string :first_name
      t.string :last_name
      t.timestamps null: false
    end
  end
end
