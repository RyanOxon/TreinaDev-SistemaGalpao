class Warehouse < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, :code, :city, :area, :address, :cep, :description, presence: true
  validates :code, length: {is: 3}

  def full_description
    "#{code} - #{name}"
    
  end
end
