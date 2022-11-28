class CreateTester2s < ActiveRecord::Migration[7.0]
  def change
    create_table :tester2s do |t|
      t.string :name
      t.string :last_name
      t.integer :age

      t.timestamps
    end
  end
end
