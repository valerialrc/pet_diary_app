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

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])

    if @pet.update(pet_params)
      redirect_to pet_path(@pet.id), notice: 'Pet atualizado com sucesso!'
    else
      flash.now[:notice] = 'Não foi possível atualizar o pet.'
      render :edit
    end
    
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :birth_date, :sex, :specie, :breed, :weight)
  end
end