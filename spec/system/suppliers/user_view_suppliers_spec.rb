require 'rails_helper'

describe "Usuario ve fornecedores" do
  it "a partir do menu" do

    visit root_path
    within 'nav' do
      click_on 'Fornecedores'
    end
    
    expect(current_path).to eq suppliers_path
  end

  it "e ve informacoes de fornecedores cadastrados" do
    supplier = Supplier.create!(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                                full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                email: 'ACME@ACME.br')
    supplier = Supplier.create!(corporate_name: 'Sirius Cybernetics LTDA', brand_name: 'Sirius Cybernetics', registration_number: '2029282726725',
                                full_address: 'Avenida espacial, 1000', city: 'São Paulo', state: 'São Paulo',
                                email: 'Sirius@galaxia.br')

    visit root_path
    within 'nav' do
      click_on 'Fornecedores'
    end

    expect(page).to_not have_content 'Nenhum fornecedor cadastrado'  
    expect(page).to have_content 'ACME'
    expect(page).to have_content 'Rio de Janeiro'

    expect(page).to have_content 'Sirius Cybernetics'
    expect(page).to have_content 'São Paulo'
  end
  
  it "e nao possuem fornecedores cadastrados" do

    visit root_path
    within 'nav' do
      click_on 'Fornecedores'
    end

    expect(page).to have_content 'Nenhum fornecedor cadastrado'
  end
end
