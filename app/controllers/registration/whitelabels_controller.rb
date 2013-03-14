class Registration::WhitelabelsController < ApplicationController
  # GET /registration/whitelabels
  # GET /registration/whitelabels.json
  def index

    @registration_whitelabels = Registration::Whitelabel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registration_whitelabels }
    end
  end

  # GET /registration/whitelabels/1
  # GET /registration/whitelabels/1.json
  def show
    @registration_whitelabel = Registration::Whitelabel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @registration_whitelabel }
    end
  end

  # GET /registration/whitelabels/new
  # GET /registration/whitelabels/new.json
  def new
    @registration_whitelabel = Registration::Whitelabel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @registration_whitelabel }
    end
  end

  # GET /registration/whitelabels/1/edit
  def edit
    @registration_whitelabel = Registration::Whitelabel.find(params[:id])
  end

  # POST /registration/whitelabels
  # POST /registration/whitelabels.json
  def create
    @registration_whitelabel = Registration::Whitelabel.new(params[:registration_whitelabel])

    respond_to do |format|
      if @registration_whitelabel.save
        format.html { redirect_to @registration_whitelabel, notice: 'Whitelabel was successfully created.' }
        format.json { render json: @registration_whitelabel, status: :created, location: @registration_whitelabel }
      else
        format.html { render action: "new" }
        format.json { render json: @registration_whitelabel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /registration/whitelabels/1
  # PUT /registration/whitelabels/1.json
  def update
    @registration_whitelabel = Registration::Whitelabel.find(params[:id])

    respond_to do |format|
      if update_from_params
        format.html { redirect_to @registration_whitelabel, notice: 'Whitelabel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @registration_whitelabel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registration/whitelabels/1
  # DELETE /registration/whitelabels/1.json
  def destroy
    @registration_whitelabel = Registration::Whitelabel.find(params[:id])
    @registration_whitelabel.destroy

    respond_to do |format|
      format.html { redirect_to registration_whitelabels_url }
      format.json { head :no_content }
    end
  end

  def update_from_params

    @registration_whitelabel.update_attribute(:name, params[:registration_whitelabel][:name])
    @registration_whitelabel.update_attribute(:description, params[:registration_whitelabel][:description])
    @registration_whitelabel.update_attribute(:contact_id, params[:registration_whitelabel][:contact_id])
    @registration_whitelabel.update_attribute(:contact_phone, params[:registration_whitelabel][:contact_phone])
    @registration_whitelabel.update_attribute(:address1, params[:registration_whitelabel][:address1])
    @registration_whitelabel.update_attribute(:address2, params[:registration_whitelabel][:address2])
    @registration_whitelabel.update_attribute(:city, params[:registration_whitelabel][:city])
    @registration_whitelabel.update_attribute(:state, params[:registration_whitelabel][:state])
    @registration_whitelabel.update_attribute(:zip_postal_code, params[:registration_whitelabel][:zip_postal_code])
    @registration_whitelabel.update_attribute(:work_phone, params[:registration_whitelabel][:work_phone])
    @registration_whitelabel.update_attribute(:email_primary, params[:registration_whitelabel][:email_primary])

    @registration_whitelabel.update_attribute(:directory_community_ids, params[:registration_whitelabel][:directory_community_ids])


  end
end
