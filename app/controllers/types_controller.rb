# frozen_string_literal: true

# Scaffold de type de plat
class TypesController < ApplicationController
  before_action :set_type, only: %i[show edit update destroy]
  before_action :is_admin
  # GET /types
  def index
    @types = Type.all
  end

  # GET /types/1
  def show; end

  # GET /types/new
  def new
    @type = Type.new
  end

  # GET /types/1/edit
  def edit; end

  # POST /types
  def create
    @type = Type.new(type_params)

    if @type.save
      redirect_to @type, flash: { info: t('create_cont') }
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /types/1
  def update
    if @type.update(type_params)
      redirect_to @type, flash: { info: t('update_cont') }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /types/1
  def destroy
    @type.destroy
    redirect_to types_url, flash: { info: t('destroy_cont') }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_type
    @type = Type.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def type_params
    params.require(:type).permit(:name, :enabled)
  end

  def is_admin
    unless current_user.admin?
      redirect_to root_url, flash: { error: t('acces_denied') }
    end
  end
end
