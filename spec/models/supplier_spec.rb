require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe "#valid?" do
    it "false when corporate_name is empty" do
      supplier = Supplier.new(corporate_name: '', brand_name: 'ACME', registration_number: '1019181716715',
                                full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                email: 'ACME@ACME.br')
                                
      expect(supplier.valid?).to be_falsey 
    end
    it "false when brand_name is empty" do
      supplier = Supplier.new(corporate_name: 'ACME Corp', brand_name: '', registration_number: '1019181716715',
                                full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                email: 'ACME@ACME.br')
                                
      expect(supplier.valid?).to be_falsey 
    end
    it "false when registration_number is empty" do
      supplier = Supplier.new(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '',
                                full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                email: 'ACME@ACME.br')
                                
      expect(supplier.valid?).to be_falsey 
    end
    it "false when full_address is empty" do
      supplier = Supplier.new(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                                full_address: '', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                email: 'ACME@ACME.br')
                                
      expect(supplier.valid?).to be_falsey 
    end
    it "false when city is empty" do
      supplier = Supplier.new(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                                full_address: 'Avenida explosiva, 1000', city: '', state: 'Rio de janeiro',
                                email: 'ACME@ACME.br')
                                
      expect(supplier.valid?).to be_falsey 
    end
    it "false when state is empty" do
      supplier = Supplier.new(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                                full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: '',
                                email: 'ACME@ACME.br')
                                
      expect(supplier.valid?).to be_falsey 
    end
    it "false when email is empty" do
      supplier = Supplier.new(corporate_name: 'ACME corp', brand_name: 'ACME', registration_number: '1019181716715',
                                full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                email: '')
                                
      expect(supplier.valid?).to be_falsey 
    end
    
    it "false when corporate_name already in use" do
      first_supplier = Supplier.new(corporate_name: 'ACME corp', brand_name: 'ACME', registration_number: '1019181716715',
                                full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                email: 'ACME@ACME.br')
      first_supplier.save()
      second_supplier = Supplier.new(corporate_name: 'ACME corp', brand_name: 'Sirius Cybernetics', registration_number: '2029282726725',
                                full_address: 'Avenida espacial, 1000', city: 'São Paulo', state: 'São Paulo',
                                email: 'Sirius@galaxia.br')

      expect(second_supplier.valid?).to be_falsey 
      
    end
    it "false when registration_number already in use" do
      first_supplier = Supplier.new(corporate_name: 'ACME corp', brand_name: 'ACME', registration_number: '1019181716715',
                                full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                email: 'ACME@ACME.br')
      first_supplier.save()
      second_supplier = Supplier.new(corporate_name: 'Sirius Cybernetics corp', brand_name: 'Sirius Cybernetics', registration_number: '1019181716715',
                                full_address: 'Avenida espacial, 1000', city: 'São Paulo', state: 'São Paulo',
                                email: 'Sirius@galaxia.br')

      expect(second_supplier.valid?).to be_falsey 
      
    end
  end
end
