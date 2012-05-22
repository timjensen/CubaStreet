class ChangeColumnNameFromTypeInProducts < ActiveRecord::Migration
  def change
    rename_column :products, :type, :pro_type
  end
end
