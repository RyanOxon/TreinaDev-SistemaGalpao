require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#valid?' do
    it "must have code" do
      user =User.create!(name: "rafael", email:"teste@teste.com", password: "password")
      warehouse = Warehouse.create(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')
      supplier = Supplier.create!(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                                  full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                  email: 'ACME@ACME.br')
                                            
      order = Order.new(user: user, warehouse: warehouse, supplier: supplier, estimated_delivery_date: '2024-10-11')
      
      expect(order.valid?).to be true
      
    end  
  end

  describe 'generate random code' do
    it "on create" do
      user =User.create!(name: "rafael", email:"teste@teste.com", password: "password")
      warehouse = Warehouse.create(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')
      supplier = Supplier.create!(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                                  full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                  email: 'ACME@ACME.br')
                                            
      order = Order.new(user: user, warehouse: warehouse, supplier: supplier, estimated_delivery_date: '2024-10-11')
      order.save!
      result = order.code

      expect(result).not_to be_empty 
      expect(result.length).to  eq 8

    end

    it "is unique" do
      user =User.create!(name: "rafael", email:"teste@teste.com", password: "password")
      warehouse = Warehouse.create(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')
      supplier = Supplier.create!(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                                  full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                  email: 'ACME@ACME.br')
                                            
      order_one = Order.create!(user: user, warehouse: warehouse, supplier: supplier, estimated_delivery_date: '2024-10-11')
      order_two = Order.new(user: user, warehouse: warehouse, supplier: supplier, estimated_delivery_date: '2024-10-11')
      
      order_two.save!
      expect(order_two.code).not_to eq order_one.code

    end
    
    
  end
end
