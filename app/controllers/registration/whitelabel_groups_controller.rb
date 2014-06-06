class Registration::WhitelabelGroupsController < ApplicationController
  # GET /registration/whitelabel_groups
  # GET /registration/whitelabel_groups.json
  def index
    @registration_whitelabel_groups = Registration::WhitelabelGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registration_whitelabel_groups }
    end
  end

  # GET /registration/whitelabel_groups/1
  # GET /registration/whitelabel_groups/1.json
  def show
    @registration_whitelabel_group = Registration::WhitelabelGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @registration_whitelabel_group }
    end
  end

  # GET /registration/whitelabel_groups/new
  # GET /registration/whitelabel_groups/new.json
  def new
    @registration_whitelabel_group = Registration::WhitelabelGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @registration_whitelabel_group }
    end
  end

  # GET /registration/whitelabel_groups/1/edit
  def edit
    @registration_whitelabel_group = Registration::WhitelabelGroup.find(params[:id])
  end

  # POST /registration/whitelabel_groups
  # POST /registration/whitelabel_groups.json
  def create
    @registration_whitelabel_group = Registration::WhitelabelGroup.new(params[:registration_whitelabel_group])

    respond_to do |format|
      if @registration_whitelabel_group.save
        format.html { redirect_to @registration_whitelabel_group, notice: 'Whitelabel group was successfully created.' }
        format.json { render json: @registration_whitelabel_group, status: :created, location: @registration_whitelabel_group }
      else
        format.html { render action: 'new' }
        format.json { render json: @registration_whitelabel_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /registration/whitelabel_groups/1
  # PUT /registration/whitelabel_groups/1.json
  def update
    @registration_whitelabel_group = Registration::WhitelabelGroup.find(params[:id])

    respond_to do |format|
      if @registration_whitelabel_group.update_attributes(params[:registration_whitelabel_group])
        format.html { redirect_to @registration_whitelabel_group, notice: 'Whitelabel group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @registration_whitelabel_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registration/whitelabel_groups/1
  # DELETE /registration/whitelabel_groups/1.json
  def destroy
    @registration_whitelabel_group = Registration::WhitelabelGroup.find(params[:id])
    @registration_whitelabel_group.destroy

    respond_to do |format|
      format.html { redirect_to registration_whitelabel_groups_url }
      format.json { head :no_content }
    end
  end
end
