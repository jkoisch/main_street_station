class Directory::YoucentricInterfacesController < ApplicationController
  def index
    @youcentric_interfaces = YoucentricInterface.all
  end

  def show
    @youcentric_interface = YoucentricInterface.find(params[:id])
  end

  def new
    @youcentric_interface = YoucentricInterface.new
  end

  def create
    @youcentric_interface = YoucentricInterface.new(params[:youcentric_interface])
    if @youcentric_interface.save
      redirect_to @youcentric_interface, :notice => 'Successfully created youcentric interface.'
    else
      render :action => 'new'
    end
  end

  def edit
    @youcentric_interface = YoucentricInterface.find(params[:id])
  end

  def update
    @youcentric_interface = YoucentricInterface.find(params[:id])
    if @youcentric_interface.update_attributes(params[:youcentric_interface])
      redirect_to @youcentric_interface, :notice  => 'Successfully updated youcentric interface.'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @youcentric_interface = YoucentricInterface.find(params[:id])
    @youcentric_interface.destroy
    redirect_to youcentric_interfaces_url, :notice => 'Successfully destroyed youcentric interface.'
  end
end
