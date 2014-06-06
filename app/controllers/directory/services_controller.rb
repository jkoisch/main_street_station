class Directory::ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(params[:service])
    if @service.save
      respond_to do |format|
        format.html {redirect_to @service, :notice => 'Successfully created service.'}
        format.xml {render :xml => @service}
        format.json {render :json => @service}
      end
    else
      render :action => 'new'
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update_attributes(params[:service])
      redirect_to @service, :notice  => 'Successfully updated service.'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_url, :notice => 'Successfully destroyed service.'
  end
end
