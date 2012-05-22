class AddAdminTitleToPages < ActiveRecord::Migration
  def change
    add_column :pages, :admintitle, :string
  end
end
