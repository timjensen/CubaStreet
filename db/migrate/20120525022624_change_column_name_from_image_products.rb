class ChangeColumnNameFromImageProducts < ActiveRecord::Migration
  def change
    rename_column :products, :image, :pro_image
  end
end
