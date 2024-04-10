describe "Usuario remove um galpao" do
  it "com sucesso" do
    warehouse = Warehouse.create!(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60000,
                      address: 'Avenida do aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')

    visit root_path
    click_on 'Rio'
    click_on 'Remover'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão removido com sucesso'
    expect(page).not_to have_content 'Rio'
    expect(page).not_to have_content 'SDU'
  end

  it "somente o selecionado" do
    first_warehouse = Warehouse.create!(name: 'Rio', code: 'SDU', address: 'Endereço',
                                      cep: '24000-000', city: 'Rio de Janeiro', area: 10000,
                                      description: 'alguma descricao')
      
    second_warehouse = Warehouse.create!(name: 'Maceio', code: 'MCZ', city: 'Maceio', area: 50000,
                                        address: 'Avenida do aeroporto, 1000', cep: '15000-000',
                                        description: 'Galpão destinado para cargas internacionais')

    visit root_path
    click_on 'Rio'
    click_on 'Remover'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão removido com sucesso'
    expect(page).to have_content 'Maceio'
    expect(page).to have_content 'MCZ'                    
  end
  
  
  
end
