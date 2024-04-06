require 'rails_helper'

describe "Usuario registra um galpão" do
  it "a partir da tela incial" do
    
    visit root_path
    click_on 'Cadastrar Galpão'

    expect(page).to have_field('Nome')
    expect(page).to have_field('Descrição')
    expect(page).to have_field('Código')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('CEP')
    expect(page).to have_field('Area')
      
  end
  
  it "com sucesso" do
    
    visit root_path
    click_on 'Cadastrar Galpão'
    fill_in 'Nome', with: 'Rio de Janeiro'
    fill_in 'Descrição', with: 'Galpão da zona porturaria do Rio'
    fill_in 'Código', with: 'RIO'
    fill_in 'Endereço', with: 'Avenida do museu do Amanha, 1000'
    fill_in 'CEP', with: '20100-000'
    fill_in 'Area', with: '32000'
    click_on 'Enviar'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão cadastrado com sucesso'
    expect(page).to have_content 'Rio de Janeiro'
    expect(page).to have_content 'RIO'
    expect(page).to have_content '32000m²'   
    
  end
  
end
