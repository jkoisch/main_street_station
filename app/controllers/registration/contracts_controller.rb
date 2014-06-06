class Registration::ContractsController < ApplicationController
  # GET /registration/contracts
  # GET /registration/contracts.json
  def index
    @registration_contracts = Registration::Contract.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registration_contracts }
    end
  end

  # GET /registration/contracts/1
  # GET /registration/contracts/1.json
  def show
    @registration_contract = Registration::Contract.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @registration_contract }
    end
  end

  # GET /registration/contracts/new
  # GET /registration/contracts/new.json
  def new
    @registration_contract = Registration::Contract.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @registration_contract }
    end
  end

  # GET /registration/contracts/1/edit
  def edit
    @registration_contract = Registration::Contract.find(params[:id])
  end

  # POST /registration/contracts
  # POST /registration/contracts.json
  def create
    @registration_contract = Registration::Contract.new(params[:registration_contract])

    respond_to do |format|
      if @registration_contract.save
        format.html { redirect_to @registration_contract, notice: 'Contract was successfully created.' }
        format.json { render json: @registration_contract, status: :created, location: @registration_contract }
      else
        format.html { render action: 'new' }
        format.json { render json: @registration_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /registration/contracts/1
  # PUT /registration/contracts/1.json
  def update
    @registration_contract = Registration::Contract.find(params[:id])

    respond_to do |format|
      if @registration_contract.update_attributes(params[:registration_contract])
        format.html { redirect_to @registration_contract, notice: 'Contract was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @registration_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registration/contracts/1
  # DELETE /registration/contracts/1.json
  def destroy
    @registration_contract = Registration::Contract.find(params[:id])
    @registration_contract.destroy

    respond_to do |format|
      format.html { redirect_to registration_contracts_url }
      format.json { head :no_content }
    end
  end
end
