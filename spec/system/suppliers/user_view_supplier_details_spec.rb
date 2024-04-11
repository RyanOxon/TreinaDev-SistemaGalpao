require 'rails_helper'

describe "usuario ve detalhes de um fornecedor" do
  it "e ve as informações" do
    supplier = Supplier.create!(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                                full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'RJ',
                                email: 'ACME@ACME.br')

  visit root_path
  click_on 'Fornecedores'
  click_on 'ACME'

  expect(page).to have_content 'Nome corporativo: ACME Corp' 
  expect(page).to have_content 'Marca: ACME' 
  expect(page).to have_content 'Registro: 1019181716715'
  expect(page).to have_content 'Endereço: Avenida explosiva, 1000 - Rio de Janeiro|RJ'
  expect(page).to have_content 'Email: ACME@ACME.br'
  end
  
  
end
