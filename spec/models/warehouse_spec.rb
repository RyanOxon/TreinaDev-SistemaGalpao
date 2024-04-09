require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe "#valid?" do
    it "false when name is empty" do
      warehouse = Warehouse.new(name: '', code: 'RIO', address: 'Endereço',
                                cep: '24000-000', city: 'Rio de Janeiro', area: 10000,
                                description: 'alguma descricao')
      
      result = warehouse.valid?

      expect(result).to eq false 
    end
    it "false when code is empty" do
      warehouse = Warehouse.new(name: 'Rio de janeiro', code: '', address: 'Endereço',
                                cep: '24000-000', city: 'Rio de Janeiro', area: 10000,
                                description: 'alguma descricao')
      
      result = warehouse.valid?

      expect(result).to eq false 
    end
    it "false when address is empty" do
      warehouse = Warehouse.new(name: 'Rio de Janeiro', code: 'RIO', address: '',
                                cep: '24000-000', city: 'Rio de Janeiro', area: 10000,
                                description: 'alguma descricao')
      
      result = warehouse.valid?

      expect(result).to eq false 
    end
    it "false when cep is empty" do
      warehouse = Warehouse.new(name: 'Rio de Janeiro', code: 'RIO', address: 'Endereço',
                                cep: '', city: 'Rio de Janeiro', area: 10000,
                                description: 'alguma descricao')
      
      result = warehouse.valid?

      expect(result).to eq false 
    end
    it "false when city is empty" do
      warehouse = Warehouse.new(name: 'Rio de Janeiro', code: 'RIO', address: 'Endereço',
                                cep: '24000-000', city: '', area: 10000,
                                description: 'alguma descricao')
      
      result = warehouse.valid?

      expect(result).to eq false 
    end
    it "false when area is empty" do
      warehouse = Warehouse.new(name: 'Rio de Janeiro', code: 'RIO', address: 'Endereço',
                                cep: '24000-000', city: 'Rio', area: '',
                                description: 'alguma descricao')
      
      result = warehouse.valid?

      expect(result).to eq false 
    end
    it "false when description is empty" do
      warehouse = Warehouse.new(name: 'Rio de Janeiro', code: 'RIO', address: 'Endereço',
                                cep: '24000-000', city: 'Rio', area: 10000,
                                description: '')
      
      result = warehouse.valid?

      expect(result).to eq false 
    end
    it "false when Code is smaller than 3" do
      warehouse = Warehouse.new(name: 'Rio de Janeiro', code: 'R', address: 'Endereço',
                                cep: '24000-000', city: 'Rio de Janeiro', area: 10000,
                                description: 'alguma descricao')
      
      result = warehouse.valid?

      expect(result).to eq false 
    end
    it "false when Code is bigger than 3" do
      warehouse = Warehouse.new(name: 'Rio de Janeiro', code: 'RIIO', address: 'Endereço',
                                cep: '24000-000', city: 'Rio de Janeiro', area: 10000,
                                description: 'alguma descricao')
      
      result = warehouse.valid?

      expect(result).to eq false 
    end

    it "False when code is already in use" do
      first_warehouse = Warehouse.create(name: 'Rio de Janeiro', code: 'RIO', address: 'Endereço',
                                      cep: '24000-000', city: 'Rio de Janeiro', area: 10000,
                                      description: 'alguma descricao')
      
      dup_warehouse = Warehouse.new(name: 'Rio de Janeiro', code: 'RIO', address: 'Endereço',
                                    cep: '24000-000', city: 'Rio de Janeiro', area: 10000,
                                    description: 'alguma descricao')

      result = dup_warehouse.valid?

      expect(result).to eq false  
      
    end
    
  end
end
