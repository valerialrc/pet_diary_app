require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe '#valid?' do
    context "presence" do
      it 'false when name is empty' do
        # Arrange
        pet = Pet.new(name: '', birth_date: '14/04/2018', sex: 'Fêmea',
                specie: 'Cachorro', breed: 'Lhasa Apso', weight: 4.7)
                        
        # Act
        pet.valid?
        result = pet.errors.include?(:name)
  
        # Assert
        expect(result).to be true
        expect(pet.errors[:name]).to include "não pode ficar em branco"
      end

      it 'false when birth_date is empty' do
        # Arrange
        pet = Pet.new(name: 'Jade', birth_date: '', sex: 'Fêmea',
                specie: 'Cachorro', breed: 'Lhasa Apso', weight: 4.7)
                        
        # Act
        pet.valid?
        result = pet.errors.include?(:birth_date)
  
        # Assert
        expect(result).to be true
        expect(pet.errors[:birth_date]).to include "não pode ficar em branco"
      end

      it 'false when sex is empty' do
        # Arrange
        pet = Pet.new(name: 'Jade', birth_date: '14/04/2018', sex: '',
                specie: 'Cachorro', breed: 'Lhasa Apso', weight: 4.7)
                        
        # Act
        pet.valid?
        result = pet.errors.include?(:sex)
  
        # Assert
        expect(result).to be true
        expect(pet.errors[:sex]).to include "não pode ficar em branco"
      end

      it 'false when specie is empty' do
        # Arrange
        pet = Pet.new(name: 'Jade', birth_date: '14/04/2018', sex: 'Fêmea',
                specie: '', breed: 'Lhasa Apso', weight: 4.7)
                        
        # Act
        pet.valid?
        result = pet.errors.include?(:specie)
  
        # Assert
        expect(result).to be true
        expect(pet.errors[:specie]).to include "não pode ficar em branco"
      end

      it 'false when breed is empty' do
        # Arrange
        pet = Pet.new(name: 'Jade', birth_date: '14/04/2018', sex: 'Fêmea',
                specie: 'Cachorro', breed: '', weight: 4.7)
                        
        # Act
        pet.valid?
        result = pet.errors.include?(:breed)
  
        # Assert
        expect(result).to be true
        expect(pet.errors[:breed]).to include "não pode ficar em branco"
      end

      it 'false when weight is empty' do
        # Arrange
        pet = Pet.new(name: '', birth_date: '14/04/2018', sex: 'Fêmea',
                specie: 'Cachorro', breed: 'Lhasa Apso')
                        
        # Act
        pet.valid?
        result = pet.errors.include?(:weight)
  
        # Assert
        expect(result).to be true
        expect(pet.errors[:weight]).to include "não pode ficar em branco"
      end
    end
  end
end
