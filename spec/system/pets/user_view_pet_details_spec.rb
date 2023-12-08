require 'rails_helper'

describe 'Usuário vê pets cadastrados' do
  it 'e visualiza detalhes' do
    # Arrange
    Pet.create!(name: 'Jade', birth_date: '14/04/2018', sex: 'Fêmea',
                specie: 'Cachorro', breed: 'Lhasa Apso', weight: 4.7)

    # Act
    visit root_path
    click_on 'Jade'

    # Assert
    expect(page).to have_content('Jade')
    expect(page).to have_content('Idade: 5 anos')
    expect(page).to have_content('Peso: 4,7 kg')
  end

  it 'e volta para a tela inicial' do
    # Arrange
    Pet.create!(name: 'Jade', birth_date: '14/04/2018', sex: 'Fêmea',
                specie: 'Cachorro', breed: 'Lhasa Apso', weight: 4.7)

    # Act
    visit root_path
    click_on 'Jade'
    click_on 'Agenda Pet'

    # Assert
    expect(current_path).to eq(root_path)
  end
end