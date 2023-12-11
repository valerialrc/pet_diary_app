require 'rails_helper'

describe 'Usuário visita tela inicial' do
  it 'e vê o nome do app' do
    # Arrange

    # Act
    visit root_path

    # Assert
    expect(page).to have_content('Agenda Pet')
  end

  it 'e vê lista de pets se estiver autenticado' do
    # Arrange
    user = User.create!(name: 'João', email: 'joao@email.com', password: 'password')

    Pet.create!(name: 'Jade', birth_date: '14/04/2018', sex: 'Fêmea',
                specie: 'Cachorro', breed: 'Lhasa Apso', weight: 4.7, user: user)

    Pet.create!(name: 'Nina', birth_date: '13/05/2018', sex: 'Fêmea',
                specie: 'Cachorro', breed: 'SRD', weight: 8.6, user: user)

    # Act
    login_as(user)
    visit root_path

    # Assert
    expect(page).to have_content('Agenda Pet')
    expect(page).to have_content('Jade')
    expect(page).to have_content('Nina')
  end

  it 'e vê mensagem para se autenticar para ver a agenda' do
    # Arrange
    user = User.create!(name: 'João', email: 'joao@email.com', password: 'password')

    Pet.create!(name: 'Jade', birth_date: '14/04/2018', sex: 'Fêmea',
                specie: 'Cachorro', breed: 'Lhasa Apso', weight: 4.7, user: user)

    Pet.create!(name: 'Nina', birth_date: '13/05/2018', sex: 'Fêmea',
                specie: 'Cachorro', breed: 'SRD', weight: 8.6, user: user)

    # Act
    visit root_path

    # Assert
    expect(page).to have_content('Agenda Pet')
    expect(page).to have_content('Faça login para visualizar a agenda')
    expect(page).not_to have_content('Jade')
    expect(page).not_to have_content('Nina')
  end

  it 'e não existem pets cadastrados' do
    # Arrange
    user = User.create!(name: 'João', email: 'joao@email.com', password: 'password')

    # Act
    login_as(user)
    visit root_path

    # Assert
    expect(page).to have_content('Agenda Pet')
    expect(page).to have_content('Não existem pets cadastrados')
  end

end