require 'rails_helper'

describe 'Usuário cadastra pets' do
  it 'a partir da tela inicial' do
    # Arrange

    # Act
    visit root_path
    click_on 'Cadastrar Pet'

    # Assert
    expect(page).to have_content('Novo Pet')
    expect(page).to have_field('Nome')
    expect(page).to have_field('Data de Nascimento')
    expect(page).to have_field('Sexo')
    expect(page).to have_field('Espécie')
    expect(page).to have_field('Raça')
    expect(page).to have_field('Peso')
    expect(page).to have_button('Salvar')
  end

  it 'com sucesso' do
    # Arrange

    # Act
    visit root_path
    click_on 'Cadastrar Pet'
    fill_in "Nome",	with: "Jade" 
    fill_in "Data de Nascimento",	with: "14/04/2018" 
    fill_in "Sexo",	with: "Fêmea" 
    fill_in "Espécie",	with: "Cachorro" 
    fill_in "Raça",	with: "Lhasa" 
    fill_in "Peso",	with: "4.5" 
    click_on 'Salvar'

    # Assert
    expect(current_path).to eq root_path
    expect(Pet.all.length).to eq 1
    expect(page).to have_content('Pet cadastrado com sucesso!')
    expect(page).to have_content('Jade')
    expect(page).not_to have_field('Nome')
  end

  it 'com campo obrigatório em branco' do
    # Arrange

    # Act
    visit root_path
    click_on 'Cadastrar Pet'
    fill_in "Nome",	with: "" 
    fill_in "Data de Nascimento",	with: "" 
    fill_in "Sexo",	with: "" 
    fill_in "Espécie",	with: "" 
    fill_in "Raça",	with: "" 
    fill_in "Peso",	with: "" 
    click_on 'Salvar'

    # Assert
    expect(current_path).to eq pets_path
    expect(Pet.all.length).to eq 0
    expect(page).to have_content('Não foi possível cadastrar o pet.')
    expect(page).to have_field('Nome')
  end
end