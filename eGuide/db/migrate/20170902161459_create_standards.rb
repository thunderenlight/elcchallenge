class CreateStandards < ActiveRecord::Migration[5.0]
  def change
    create_table :standards do |t|
      t.text :domains
      t.text :tests

      t.timestamps
    end
  end
end
