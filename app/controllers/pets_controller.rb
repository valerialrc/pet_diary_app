class PetsController < ApplicationController
  def show
    @pet = Pet.find(params[:id])
  end

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

  private

  def pet_params
    params.require(:pet).permit(:name, :birth_date, :sex, :specie, :breed, :weight)
  end
end