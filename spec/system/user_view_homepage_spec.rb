require 'rails_helper'

describe 'Usuário visita tela inicial' do
  it 'e vê o nome do app' do
    # Arrange

    # Act
    visit root_path

    # Assert
    expect(page).to have_content('Agenda Pet')
  end

  it 'e vê lista de pets' do
    # Arrange
    Pet.create!(name: 'Jade', birth_date: '14/04/2018', sex: 'Fêmea',
            specie: 'Cachorro', breed: 'Lhasa Apso', weight: 4.7)

    Pet.create!(name: 'Nina', birth_date: '13/05/2018', sex: 'Fêmea',
            specie: 'Cachorro', breed: 'SRD', weight: 8.6)

    # Act
    visit root_path

    # Assert
    expect(page).to have_content('Agenda Pet')
    expect(page).to have_content('Jade')
    expect(page).to have_content('Nina')
  end

  it 'e não existem pets cadastrados' do
    # Arrange

    # Act
    visit root_path

    # Assert
    expect(page).to have_content('Agenda Pet')
    expect(page).to have_content('Não existem pets cadastrados')
  end

end