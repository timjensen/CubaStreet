class Product < ActiveRecord::Base
  attr_accessible :discrip, :name, :price, :spec, :sprice, :type
end
