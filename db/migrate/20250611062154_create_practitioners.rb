# db/migrate/xxxxxx_create_practitioners.rb
class CreatePractitioners < ActiveRecord::Migration[6.1]
  def change
    create_table :practitioners do |t|
      t.string :identifier, null: false            
      t.string :active, default: 'true'
      t.string :family_name
      t.string :given_name
      t.string :prefix
      t.string :suffix
      t.string :gender
      t.date :birth_date
      t.text :telecom                          
      t.text :address                          
      t.timestamps
    end
    add_index :practitioners, :identifier, unique: true
  end
end