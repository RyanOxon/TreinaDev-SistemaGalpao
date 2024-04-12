require 'rails_helper'

RSpec.describe ProductModel, type: :model do
  describe "ProductModel#valid?" do
    it "false when name is empty" do
      supplier = Supplier.create!(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                                  full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                  email: 'ACME@ACME.br')

      product = ProductModel.new(name:'', weight:'10000', width: 200, height: 50, depth: 50, sku: 'Rocket404-ACME-171', supplier: supplier)

      expect(product.valid?).to be_falsey 
    end
    it "false when weigth is empty" do
      supplier = Supplier.create!(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                                  full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                  email: 'ACME@ACME.br')

      product = ProductModel.new(name:'Rocket171', weight:'', width: 200, height: 50, depth: 50, sku: 'Rocket404-ACME-171', supplier: supplier)

      expect(product.valid?).to be_falsey 
    end
    it "false when width is empty" do
      supplier = Supplier.create!(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                                  full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                  email: 'ACME@ACME.br')

      product = ProductModel.new(name:'Rocket171', weight:'10000', width: '' , height: 50, depth: 50, sku: 'Rocket404-ACME-171', supplier: supplier)

      expect(product.valid?).to be_falsey 
    end
    it "false when height is empty" do
      supplier = Supplier.create!(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                                  full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                  email: 'ACME@ACME.br')

      product = ProductModel.new(name:'Rocket171', weight:'10000', width: 200, height: '' , depth: 50, sku: 'Rocket404-ACME-171', supplier: supplier)

      expect(product.valid?).to be_falsey 
    end
    it "false when depth is empty" do
      supplier = Supplier.create!(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                                  full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                  email: 'ACME@ACME.br')

      product = ProductModel.new(name:'Rocket171', weight:'10000', width: 200, height: 50, depth: '' , sku: 'Rocket404-ACME-171', supplier: supplier)

      expect(product.valid?).to be_falsey 
    end
    it "false when Sku is empty" do
      supplier = Supplier.create!(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                                  full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                  email: 'ACME@ACME.br')

      product = ProductModel.new(name:'Rocket171', weight:'10000', width: 200, height: 50, depth: 50, sku: '', supplier: supplier)

      expect(product.valid?).to be_falsey 
    end
    it "false when supplier is empty" do
      product = ProductModel.new(name:'Rocket171', weight:'10000', width: 200, height: 50, depth: 50, sku: 'Rocket404-ACME-171', supplier: nil)

      expect(product.valid?).to be_falsey 
    end

    it "false when Sku is already in use" do
      supplier = Supplier.create!(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                                  full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                  email: 'ACME@ACME.br')

      product_one = ProductModel.new(name:'Rocket1710000', weight:'10000', width: 200, height: 50, depth: 50 , sku: 'Rocket404-ACME-171', supplier: supplier)
      product_one.save
      product_two = ProductModel.new(name:'Rocket171', weight:'10000', width: 200, height: 50, depth: 50 , sku: 'Rocket404-ACME-171', supplier: supplier)

      expect(product_two.valid?).to be_falsey 
    end
  end
end
