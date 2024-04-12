require 'rails_helper'

describe "Usuario ve modelos de produto" do
  it "a partir do menu" do
      
    visit root_path
    within 'nav' do
      click_on 'Modelos de produtos'
    end

    expect(current_path).to eq product_models_path
  end
  
  it "com sucesso" do
    supplier = Supplier.create!(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                                full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                email: 'ACME@ACME.br')

    ProductModel.create!(name:'Lança-Foguetes', weight:'10000', width: 200, height: 50, depth: 50, sku: 'Rocket404-ACME-171', supplier: supplier)
    ProductModel.create!(name:'TNT', weight:'500', width: 2, height: 10, depth: 5, sku: 'Explosive-ACME-404', supplier: supplier)

    visit root_path
    within 'nav' do
      click_on 'Modelos de produtos'
    end

    expect(page).not_to have_content 'Nenhum modelo de produto cadastrado' 
    expect(page).to have_content 'Lança-Foguetes'  
    expect(page).to have_content 'Rocket404-ACME-171'
    expect(page).to have_content 'ACME'
    expect(page).to have_content 'TNT'  
    expect(page).to have_content 'Explosive-ACME-404'
    expect(page).to have_content 'ACME'
  end

  it "e nao ve nenhum modelo de produto" do

    visit root_path
    within 'nav' do
      click_on 'Modelos de produtos'
    end

    expect(page).to have_content 'Nenhum modelo de produto cadastrado' 
    
  end
  
  
end
