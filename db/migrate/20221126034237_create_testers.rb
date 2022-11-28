class CreateTesters < ActiveRecord::Migration[7.0]
  def change
    create_table :testers do |t|
      t.string :name
      t.string :last_name
      t.string :string
      t.integer :age

      t.timestamps
    end
  end
end
