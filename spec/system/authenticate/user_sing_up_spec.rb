require 'rails_helper'

describe "Usuario se cadastra" do
  it "com sucesso" do

    visit root_path
    within 'nav' do
      click_on 'Entrar'
    end
    click_on 'Registrar-se'
    fill_in "Nome",	with: "Rafael"
    fill_in "E-mail", with: "rafael@email.com"
    fill_in "Senha", with: "password"
    fill_in "Confirme sua senha", with: "password"
    click_on "Sign up"

    within 'nav' do
      expect(page).to have_content 'Sair' 
      expect(page).to have_content 'Usuário: Rafael | rafael@email.com'
      expect(page).not_to have_content 'Entrar'  
    end
    expect(page).to have_content 'Bem vindo! Você realizou seu registro com sucesso.' 
  end
  
end
