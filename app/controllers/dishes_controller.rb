# frozen_string_literal: true

# Scaffold de plat
class DishesController < ApplicationController
  before_action :set_dish, only: %i[show edit update destroy]
  before_action :is_admin
  # GET /dishes
  def index
    @dishes = Dish.all
  end

  # GET /dishes/1
  def show; end

  # GET /dishes/new
  def new
    @dish = Dish.new
  end

  # GET /dishes/1/edit
  def edit; end

  # POST /dishes
  def create
    @dish = Dish.new(dish_params)

    if @dish.save
      redirect_to @dish, flash: { info: t('create_cont') }
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dishes/1
  def update
    if @dish.update(dish_params)
      redirect_to @dish, flash: { info: t('update_cont') }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /dishes/1
  def destroy
    @dish.destroy
    redirect_to dishes_url, flash: { info: t('destroy_cont') }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dish
    @dish = Dish.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def dish_params
    params.require(:dish).permit(:name, :price, :type_id, :picture, :enabled)
  end

  def is_admin
    unless current_user.admin?
      redirect_to root_url, flash: { error: t('acces_denied') }
    end
  end
end
