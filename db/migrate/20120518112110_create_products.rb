class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :type
      t.string :name
      t.text :discrip
      t.string :image, :default => "comingsoon.png"
      t.decimal :price, :precision => 10, :scale => 2
      t.decimal :sprice, :precision => 10, :scale => 2
      t.string :spec, :null => true

      t.timestamps
    end
  end
end
