# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: %i[index new create]
  before_action :set_transaction, only: %i[show edit update destroy]

  # GET /account/1/transactions
  def index
    @transactions = @account.transactions
  end

  # GET /transactions/1
  def show; end

  # GET /accounts/1/transactions/new
  def new
    @transaction = @account.transactions.new
  end

  # GET /transactions/1/edit
  def edit; end

  # POST /accounts/1/transactions
  def create
    @transaction = @account.transactions.new(transaction_params)

    if @transaction.save
      redirect_to @transaction, notice: 'Transaction was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      redirect_to @transaction, notice: 'Transaction was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy!
    redirect_to account_transactions_url(account_id: @transaction.account.id), 
                notice: 'Transaction was successfully destroyed.', status: :see_other
  end

  private

  def set_transaction
    @transaction = current_user.transactions.find(params[:id])
  end

  def set_account
    @account = current_user.accounts.find(params[:account_id])
  end

  def transaction_params
    params.require(:transaction).permit(:account_id, :memo, :cleared, :amount, :entry_date)
  end
end
