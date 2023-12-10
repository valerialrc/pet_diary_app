require 'rails_helper'

describe "Usuário edita um pet" do
  it "a partir da página de detalhes" do
    # Arrange
    pet = Pet.create!(name: 'Jade', birth_date: '14/04/2018', sex: 'Fêmea',
                specie: 'Cachorro', breed: 'Lhasa Apso', weight: 4.7)

    # Act
    visit root_path
    click_on 'Jade'
    click_on 'Editar'

    # Assert
    expect(current_path).to eq edit_pet_path(pet)
    expect(page).to have_content('Editar Pet')
    expect(page).to have_field('Nome', with: 'Jade')
    expect(page).to have_field('Data de Nascimento', with: '2018-04-14')
    expect(page).to have_field('Sexo', with: 'Fêmea')
    expect(page).to have_field('Espécie', with: 'Cachorro')
    expect(page).to have_field('Raça', with: 'Lhasa Apso')
    expect(page).to have_field('Peso', with: 4.7)
    expect(page).to have_button('Salvar')
  end

  it "com sucesso" do
    # Arrange
    pet = Pet.create!(name: 'Jade', birth_date: '14/04/2018', sex: 'Fêmea',
                specie: 'Cachorro', breed: 'Lhasa Apso', weight: 4.7)

    # Act
    visit root_path
    click_on 'Jade'
    click_on 'Editar'
    fill_in "Raça",	with: "Lhasa" 
    fill_in "Peso",	with: "4.5" 
    click_on 'Salvar'

    # Assert
    expect(current_path).to eq pet_path(pet)
    expect(page).to have_content('Detalhes do Pet')
    expect(Pet.all.length).to eq 1
    expect(page).to have_content('Pet atualizado com sucesso!')
    expect(page).to have_content('Peso: 4,5 kg')
  end

  it "e mantem os campos obrigatórios" do
    # Arrange
    pet = Pet.create!(name: 'Jade', birth_date: '14/04/2018', sex: 'Fêmea',
                specie: 'Cachorro', breed: 'Lhasa Apso', weight: 4.7)

    # Act
    visit root_path
    click_on 'Jade'
    click_on 'Editar'
    fill_in "Raça",	with: "Lhasa" 
    fill_in "Peso",	with: "" 
    click_on 'Salvar'

    # Assert
    expect(page).to have_content('Editar Pet')
    expect(page).to have_field('Nome', with: 'Jade')
    expect(page).to have_field('Data de Nascimento', with: '2018-04-14')
    expect(page).to have_field('Sexo', with: 'Fêmea')
    expect(page).to have_field('Espécie', with: 'Cachorro')
    expect(page).to have_field('Raça', with: 'Lhasa')
    expect(page).to have_field('Peso', with: '')
    expect(page).to have_button('Salvar')
    expect(page).to have_content('Não foi possível atualizar o pet.')
  end
end
