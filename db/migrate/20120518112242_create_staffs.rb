class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :title
      t.text :blurb
      t.string :image, :default => "comingsoon.png"

      t.timestamps
    end
  end
end
