class TransactionsController < ApplicationController
  before_action :set_account, only: %i[ index new create ]
  before_action :set_transaction, only: %i[ edit update destroy ]
  before_action :default_sort, only: %i[ index ]

  # GET /account/:account_id/transactions
  def index
    @pagy, @transactions = pagy(@account.transactions.order("#{params[:sort]} #{params[:direction]}"), items: 25)
  end

  # GET /transactions/new
  def new
    @transaction = @account.transactions.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  def create
    @transaction = @account.transactions.new(transaction_params)
    if @transaction.save
      redirect_to account_transactions_url(@account), notice: "Transaction was successfully created."
    else
      redirect_to account_transactions_url(@account), notice: "Transaction was not created."
    end
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      redirect_to account_transactions_url(@transaction.account), notice: "Transaction was successfully updated."
    else
      redirect_to account_transactions_url(@transaction.account), notice: "Transaction was not updated."
    end
  end

  # DELETE /transactions/1
  def destroy
    account = @transaction.account
    @transaction.destroy!
    redirect_to account_transactions_url(account), notice: "Transaction was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def set_account
    @account = Account.find(params[:account_id])
  end

  def default_sort
    if params[:sort].blank?
      params[:sort] = "entry_date"
      params[:direction] = "desc"
    end
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:memo, :cleared, :amount, :entry_date)
  end
end
