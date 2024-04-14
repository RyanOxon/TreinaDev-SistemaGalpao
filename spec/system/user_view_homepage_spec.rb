require 'rails_helper'

describe "Usuario visita tela inicial" do
  it "e ve o nome do app" do
    #arrange
    #act
    visit(root_path)
    #assert
    expect(page).to have_content('Galpões & Estoque')
    expect(page).to have_link('Home', href: root_path)
  end

  it "e vê os galpoes cadastrados" do
    #arrange
    Warehouse.create(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60000,
                      address: 'Avenida do aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')
    Warehouse.create(name: 'Maceio', code: 'MCZ', city: 'Maceio', area: 50000,
                    address: 'Avenida do aeroporto, 1000', cep: '15000-000',
                    description: 'Galpão destinado para cargas internacionais')
    #act
    visit(root_path)
    #assert

    expect(page).not_to have_content('Não existem galpões cadastrados') 
    expect(page).to have_content('Rio') 
    expect(page).to have_content('Código: SDU')
    expect(page).to have_content('Cidade: Rio de Janeiro')
    expect(page).to have_content('60000m²')

    expect(page).to have_content('Maceio') 
    expect(page).to have_content('Código: MCZ')
    expect(page).to have_content('Cidade: Maceio')
    expect(page).to have_content('50000m²')
  end
  
  it "e nao existem galpões cadastrados" do
    #arrange
    #act
    visit(root_path)
    #assert
    expect(page).to have_content('Não existem galpões cadastrados')  
  end
  
  
end
