class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.date :pair_date
      t.integer :user_id
      t.index :user_id
      t.integer :pair_id
      t.index :pair_id
    end
  end
end
