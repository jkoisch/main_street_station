class Directory::YoucentricOperationsController < ApplicationController
  def index
    @youcentric_operations = YoucentricOperation.all
  end

  def show
    @youcentric_operation = YoucentricOperation.find(params[:id])
  end

  def new
    @youcentric_operation = YoucentricOperation.new
  end

  def create
    @youcentric_operation = YoucentricOperation.new(params[:youcentric_operation])
    if @youcentric_operation.save
      respond_to do |format|
        format.html {redirect_to @youcentric_operation, :notice => "Successfully created youcentric operation."}
        format.xml {render :xml => @youcentric_operation}
        format.json {render :json => @youcentric_operation}
      end

    else
      render :action => 'new'
    end
  end

  def edit
    @youcentric_operation = YoucentricOperation.find(params[:id])
  end

  def update
    @youcentric_operation = YoucentricOperation.find(params[:id])
    if @youcentric_operation.update_attributes(params[:youcentric_operation])
      redirect_to @youcentric_operation, :notice  => "Successfully updated youcentric operation."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @youcentric_operation = YoucentricOperation.find(params[:id])
    @youcentric_operation.destroy
    redirect_to youcentric_operations_url, :notice => "Successfully destroyed youcentric operation."
  end
end
