# frozen_string_literal: true

# Scaffold de porte monnaie
class WalletsController < ApplicationController
  before_action :set_wallet, only: %i[show edit update destroy]
  before_action :is_admin
  # GET /wallets
  def index
    @wallets = Wallet.all
  end

  # GET /wallets/1
  def show; end

  # GET /wallets/new
  def new
    @wallet = Wallet.new
  end

  # GET /wallets/1/edit
  def edit; end

  # POST /wallets
  def create
    @wallet = Wallet.new(wallet_params)

    if @wallet.save
      redirect_to @wallet, flash: { info: t('create_cont') }
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wallets/1
  def update
    if @wallet.update(wallet_params)
      redirect_to @wallet, flash: { info: t('update_cont') }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /wallets/1
  def destroy
    @wallet.destroy
    redirect_to wallets_url, flash: { info: t('destroy_cont') }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_wallet
    @wallet = Wallet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def wallet_params
    params.require(:wallet).permit(:in, :user_id, :amount)
  end

  def is_admin
    unless current_user.admin?
      redirect_to root_url, flash: { error: t('acces_denied') }
    end
  end
end
