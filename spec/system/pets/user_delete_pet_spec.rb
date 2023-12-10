require 'rails_helper'

describe 'Usuário remove um pet' do
  it 'com sucesso' do
    # Arrange
    pet = Pet.create!(name: 'Jade', birth_date: '14/04/2018', sex: 'Fêmea',
                specie: 'Cachorro', breed: 'Lhasa Apso', weight: 4.7)

    # Act
    visit root_path
    click_on 'Jade'
    click_on 'Remover'

    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content('Pet removido com sucesso!')
    expect(page).not_to have_content('Jade')
  end

  it 'e não remove outros pets' do
    # Arrange
    first_pet = Pet.create!(name: 'Jade', birth_date: '14/04/2018', sex: 'Fêmea',
                            specie: 'Cachorro', breed: 'Lhasa Apso', weight: 4.7)

    second_pet = Pet.create!(name: 'Nina', birth_date: '13/05/2018', sex: 'Fêmea',
                             specie: 'Cachorro', breed: 'SRD', weight: 8.6)

    # Act
    visit root_path
    click_on 'Jade'
    click_on 'Remover'

    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content('Pet removido com sucesso!')
    expect(page).not_to have_content('Jade')
    expect(page).to have_content('Nina')

  end
end