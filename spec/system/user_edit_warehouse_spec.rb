require 'rails_helper'

describe "Usuario edita um galpao" do
  it "a partir da pagina de detalhes" do
    warehouse = Warehouse.create!(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60000,
                      address: 'Avenida do aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')
    
    visit root_path
    click_on 'Rio'
    click_on 'Editar'

    expect(page).to have_content 'Editar Galpão'
    expect(page).to have_field 'Nome', with: 'Rio'
    expect(page).to have_field 'Descrição' 
    expect(page).to have_field 'Código'
    expect(page).to have_field 'Endereço'
    expect(page).to have_field 'Cidade'
    expect(page).to have_field 'CEP'
    expect(page).to have_field 'Área'
  end

  it "com sucesso" do
    warehouse = Warehouse.create!(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60000,
                      address: 'Avenida do aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')

    visit root_path
    click_on 'Rio'
    click_on 'Editar'
    fill_in 'Nome', with: 'Rio de Janeiro'
    fill_in 'Endereço', with: 'Avenida do museu do Amanha, 1000'
    click_on 'Atualizar Galpão'

    expect(page).to have_content 'Galpão atualizado com sucesso'
    expect(page).to have_content 'Nome: Rio de Janeiro'
    expect(page).to have_content 'Galpão: SDU'
    expect(page).to have_content 'Endereço: Avenida do museu do Amanha, 1000'
  end
  
  it "e mantem os campos obrigatorios" do
    warehouse = Warehouse.create!(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60000,
                      address: 'Avenida do aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')

    visit root_path
    click_on 'Rio'
    click_on 'Editar'
    fill_in 'Nome', with: 'Rio de Janeiro'
    fill_in 'Endereço', with: ''
    click_on 'Atualizar Galpão'

    expect(page).to have_content 'Galpão não atualizado'
  end
  
end
