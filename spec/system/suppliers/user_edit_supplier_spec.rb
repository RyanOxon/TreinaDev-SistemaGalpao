require 'rails_helper'

describe "Usuario edita um fornecedor" do
  it "a partir da pagina de detalhes" do
    supplier = Supplier.create!(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                                full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                email: 'ACME@ACME.br')
    
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar'

    expect(page).to have_content 'Editar Fornecedor'
    expect(page).to have_field 'Marca', with: 'ACME'
    expect(page).to have_field 'Nome corporativo'
    expect(page).to have_field 'Registro'
    expect(page).to have_field 'Endereço completo'
    expect(page).to have_field 'Cidade'
    expect(page).to have_field 'Estado'
    expect(page).to have_field 'Email'
  end

  it "com sucesso" do
    supplier = Supplier.create!(corporate_name: 'ACME', brand_name: 'ACME', registration_number: '1019181716715',
                                full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                email: 'ACME@ACME')
    
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar'
    fill_in 'Nome corporativo', with: 'ACME Corp'
    fill_in 'Email', with: 'ACME@ACME.com'
    click_on 'Atualizar Fornecedor'

    expect(page).to have_content 'Fornecedor editado com sucesso'
    expect(page).to have_content 'Nome corporativo: ACME Corp'
    expect(page).to have_content 'Marca: ACME'
    expect(page).to have_content 'Email: ACME@ACME.com'
   
  end
  
  it "e mantem os campos obrigatorios" do
    supplier = Supplier.create!(corporate_name: 'ACME', brand_name: 'ACME', registration_number: '1019181716715',
                                full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                                email: 'ACME@ACME')
    
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar'
    fill_in 'Nome corporativo', with: 'ACME Corp'
    fill_in 'Email', with: ''
    click_on 'Atualizar Fornecedor'

    expect(page).to have_content 'Fornecedor não atualizado'
    expect(page).to have_content 'Email não pode ficar em branco'
  end
end
