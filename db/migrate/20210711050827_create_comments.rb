class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|

      t.string :content
      t.integer :owner_id, index: true
      t.integer :post_id, index: true
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
