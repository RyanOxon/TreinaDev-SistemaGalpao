class ProductModel < ApplicationRecord
  validates :name, :weight, :height, :width, :depth, :sku, :supplier, presence: true
  validates :sku, uniqueness: true

  belongs_to :supplier
end
