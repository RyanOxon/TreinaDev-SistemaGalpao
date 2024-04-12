require 'rails_helper'

describe "Usuario Cadastra novo modelo de produto" do
  it "a partir da lista de modelos" do
    Supplier.create!(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                                full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                email: 'ACME@ACME.br')
    
    visit root_path
    click_on 'Modelos de produtos'
    click_on 'Cadastrar novo modelo'

    expect(current_path).to eq new_product_model_path 
  end

  it "com sucesso" do
    Supplier.create!(corporate_name: 'Sirius Cybernetics LTDA', brand_name: 'Sirius Cybernetics', registration_number: '2029282726725',
                                full_address: 'Avenida espacial, 1000', city: 'São Paulo', state: 'São Paulo',
                                email: 'Sirius@galaxia.br')
    Supplier.create!(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                                full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                email: 'ACME@ACME.br')
    
    visit root_path
    click_on 'Modelos de produtos'
    click_on 'Cadastrar novo modelo'
    fill_in "Nome",	with: "Rocket6000"
    fill_in "Peso",	with: "10000"
    fill_in "Altura",	with: "100"
    fill_in "Largura",	with: "20"
    fill_in "Profundidade",	with: "20"
    fill_in "SKU",	with: "Rocket-ACME-6000"
    select 'ACME', from: 'Fornecedor'
    click_on 'Criar Modelo de produto'

    expect(page).to have_content 'Modelo de produto cadastrado com sucesso'
    expect(page).to have_content 'Rocket6000'
    expect(page).to have_content 'SKU: Rocket-ACME-6000'
    expect(page).to have_content 'Fornecedor: ACME' 

    end
    
    it "com dados incompletos" do
      visit root_path
      click_on 'Modelos de produtos'
      click_on 'Cadastrar novo modelo'
      click_on 'Criar Modelo de produto'
  
      expect(page).to have_content 'Modelo de produto não cadastrado' 
      expect(page).to have_content 'Peso não pode ficar em branco' 
      expect(page).to have_content 'Altura não pode ficar em branco'
      expect(page).to have_content 'Largura não pode ficar em branco'
      expect(page).to have_content 'Profundidade não pode ficar em branco'
      expect(page).to have_content 'SKU não pode ficar em branco'
      expect(page).to have_content 'Fornecedor não pode ficar em branco'
    end
    
    
  end
  
  
  

