class PetsController < ApplicationController
  before_action :set_pet, only: [:edit, :update, :show, :destroy]
  
  def show; end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      redirect_to root_path, notice: 'Pet cadastrado com sucesso!'
    else
      flash.now[:notice] = 'Não foi possível cadastrar o pet.'
      render :new
    end
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to pet_path(@pet.id), notice: 'Pet atualizado com sucesso!'
    else
      flash.now[:notice] = 'Não foi possível atualizar o pet.'
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to root_path, notice: 'Pet removido com sucesso!'
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :birth_date, :sex, :specie, :breed, :weight)
  end
end