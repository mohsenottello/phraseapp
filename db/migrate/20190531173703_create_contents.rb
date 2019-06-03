class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.text :description, null: false
      t.text :description_de
      t.integer :content_type, null: false, index: true
      t.bigint :parent_id, index: true

      t.timestamps
    end
  end
end
