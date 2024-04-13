require 'rails_helper'

describe "Usuario cadastra um pedido" do
  it "e deve estar autenticado" do
    visit root_path
    click_on 'Registrar pedido'

    expect(current_path).to eq new_user_session_path
  end
  
  it "com sucesso" do
    user =User.create!(name: "rafael", email:"teste@teste.com", password: "password")
    login_as user
    warehouse = Warehouse.create(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                      address: 'Avenida do aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')
    Warehouse.create!(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60000,
                      address: 'Avenida do aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')

    supplier = Supplier.create!(corporate_name: 'ACME Corp', brand_name: 'ACME', registration_number: '1019181716715',
                      full_address: 'Avenida explosiva, 1000', city: 'Rio de Janeiro', state: 'Rio de janeiro',
                      email: 'ACME@ACME.br')
    Supplier.create!(corporate_name: 'Sirius Cybernetics LTDA', brand_name: 'Sirius Cybernetics', registration_number: '2029282726725',
                      full_address: 'Avenida espacial, 1000', city: 'São Paulo', state: 'São Paulo',
                      email: 'Sirius@galaxia.br') 

    ProductModel.create!(name:'Lança-Foguetes', weight:'10000', width: 200, height: 50, depth: 50, sku: 'Rocket404-ACME-171', supplier: supplier)
    ProductModel.create!(name:'TNT', weight:'500', width: 2, height: 10, depth: 5, sku: 'Explosive-ACME-404', supplier: supplier)

    login_as user
    visit root_path
    click_on 'Registrar pedido'
    select warehouse.name, from: 'Galpão destino'
    select supplier.corporate_name, from: 'Fornecedor'
    fill_in "Tempo estimado para entrega",	with: "20/12/2024" 
    click_on 'Criar Pedido'

    expect(page).to have_content 'Pedido registrado com sucesso'
    expect(page).to have_content 'Galpão Destino: Aeroporto SP'
    expect(page).to have_content 'Fornecedor: ACME Corp'
    expect(page).to have_content 'Usuário Responsavel: rafael <teste@teste.com>'
    expect(page).to have_content 'Previsao de entrega: 20/12/2024'

  end
  
end
