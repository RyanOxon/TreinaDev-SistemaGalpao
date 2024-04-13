require 'rails_helper'

describe "Usuario se autentica" do
  it "com sucesso" do
    User.create!(email:"teste@teste.com", password: "password")
    visit root_path
    within 'nav' do
      click_on 'Entrar'
    end
    fill_in "E-mail",	with: "teste@teste.com"
    fill_in "Senha", with: "password"
    within 'header/header' do
      click_on 'Entrar'
    end
    within 'nav' do
      expect(page).to have_content 'Sair' 
      expect(page).not_to have_content 'Entrar'
      expect(page).to have_content 'teste@teste.com' 
    end
    expect(page).to have_content 'Login efetuado com sucesso.' 
  end
  
  it "e desloga" do
    User.create!(email:"teste@teste.com", password: "password")
    visit root_path
    within 'nav' do
      click_on 'Entrar'
    end
    fill_in "E-mail",	with: "teste@teste.com"
    fill_in "Senha", with: "password"
    within 'header/header' do
      click_on 'Entrar'
    end
    click_on 'Sair'

    expect(page).to have_content 'Logout efetuado com sucesso.' 
    expect(page).to have_content 'Entrar'
    expect(page).not_to have_content 'Sair'
    expect(page).not_to have_content 'Usuario: teste@teste.com' 
  end
end
