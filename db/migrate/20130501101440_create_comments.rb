class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.timestamps
      t.references :post
      t.references :user
    end
  end
end