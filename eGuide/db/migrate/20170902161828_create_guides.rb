class CreateGuides < ActiveRecord::Migration[5.0]
  def change
    create_table :guides do |t|
      t.belongs_to :standard, foreign_key: true
      t.string :student
      t.string :path

      t.timestamps
    end
  end
end
