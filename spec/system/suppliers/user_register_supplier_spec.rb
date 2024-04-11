require 'rails_helper'

describe "Usuario registra novo fornecedor" do
  it "apartir da tela de fornecedores" do
    visit root_path
    click_on 'Fornecedores'

    click_on 'Novo Fornecedor'

    expect(current_path).to eq new_supplier_path
  end

  it "com sucesso" do
    visit root_path
    click_on 'Fornecedores'

    click_on 'Novo Fornecedor'
    fill_in 'Nome corporativo', with: 'ACME Corp'
    fill_in 'Marca', with: 'ACME'
    fill_in 'Registro', with: '101918171615'
    fill_in 'Endereço completo', with: 'Avenida explosiva, 1000'
    fill_in 'Cidade', with: 'Rio de Janeiro'
    fill_in 'Estado', with: 'RJ'
    fill_in 'Email', with: 'ACME@ACME.br'
    click_on 'Criar Fornecedor'

    expect(page).to have_content 'Detalhes ACME'
    expect(page).to have_content 'Nome corporativo: ACME Corp'
    expect(page).to have_content 'Registro: 101918171615'
  end
  
  it "com dados incompletos" do
    visit root_path
    click_on 'Fornecedores'

    click_on 'Novo Fornecedor'
    fill_in 'Nome corporativo', with: ''
    fill_in 'Marca', with: ''
    fill_in 'Registro', with: ''
    fill_in 'Endereço completo', with: ''
    fill_in 'Cidade', with: ''
    fill_in 'Estado', with: ''
    fill_in 'Email', with: ''
    click_on 'Criar Fornecedor'

    expect(page).to have_content 'Fornecedor não cadastrado' 
    expect(page).to have_content 'Nome corporativo não pode ficar em branco' 
    expect(page).to have_content 'Marca não pode ficar em branco'
    expect(page).to have_content 'Registro não pode ficar em branco'
    expect(page).to have_content 'Endereço completo não pode ficar em branco'
    expect(page).to have_content 'Cidade não pode ficar em branco'
    expect(page).to have_content 'Estado não pode ficar em branco'
    expect(page).to have_content 'Email não pode ficar em branco'
    
  end
end
