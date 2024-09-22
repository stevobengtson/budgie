class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]
  before_action :set_account, only: %i[ account_summary ]
  before_action :default_sort, only: %i[ index account_summary ]
  
  # GET /transactions or /transactions.json
  def index
    @pagy, @transactions = pagy(current_user.transactions.order("#{params[:sort]} #{params[:direction]}"), items: 25)
    respond_to do |format|
      format.html { render 'index' }
      format.turbo_stream { render 'index' }
    end
  end
  
  # GET /accounts/:account_id/transactions
  def account_summary
    @pagy, @transactions = pagy(@account.transactions.order("#{params[:sort]} #{params[:direction]}"), items: 25)
    respond_to do |format|
      format.html { render 'index' }
      format.turbo_stream { render 'index' }
    end
  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transaction_url(@transaction), notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transaction_url(@transaction), notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy!

    respond_to do |format|
      format.html { redirect_to transactions_url, notice: "Transaction was successfully destroyed." }
      format.json { head :no_content }
    end
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
      params.require(:transaction).permit(:account_id, :memo, :cleared, :amount, :entry_date)
    end
end
