# frozen_string_literal: true

# Scaffold d'ouverture
class OpeningsController < ApplicationController
  before_action :set_opening, only: %i[show edit update destroy]

  # GET /openings
  def index
    @openings = Opening.all
  end

  def calendar
    respond_to do |format|
      format.html
      format.json { @openings = Opening.all }
    end
  end

  # GET /openings/1
  def show; end

  # GET /openings/new
  def new
    @opening = Opening.new
  end

  # GET /openings/1/edit
  def edit; end

  # POST /openings
  def create
    @opening = Opening.new(opening_params)

    if @opening.save
      redirect_to @opening, notice: 'Opening was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /openings/1
  def update
    if @opening.update(opening_params)
      redirect_to @opening, notice: 'Opening was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /openings/1
  def destroy
    @opening.destroy
    redirect_to openings_url, notice: 'Opening was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_opening
    @opening = Opening.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def opening_params
    params.require(:opening).permit(:from_at, :to_at)
  end
end
