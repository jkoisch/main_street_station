class Directory::YoucentricObjectsController < ApplicationController
  def index
    @youcentric_objects = YoucentricObject.all
  end

  def show
    @youcentric_object = YoucentricObject.find(params[:id])
  end

  def new
    @youcentric_object = YoucentricObject.new
  end

  def create
    @youcentric_object = YoucentricObject.new(params[:youcentric_object])
    if @youcentric_object.save
      respond_to do |format|
        format.html {redirect_to @youcentric_object, :notice => "Successfully created youcentric object."}
        format.xml {render :xml => @youcentric_object}
        format.json {render :json => @youcentric_object}
        end
    else
      render :action => 'new'
    end
  end

  def edit
    @youcentric_object = YoucentricObject.find(params[:id])
  end

  def update
    @youcentric_object = YoucentricObject.find(params[:id])
    if @youcentric_object.update_attributes(params[:youcentric_object])
      redirect_to @youcentric_object, :notice  => "Successfully updated youcentric object."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @youcentric_object = YoucentricObject.find(params[:id])
    @youcentric_object.destroy
    redirect_to youcentric_objects_url, :notice => "Successfully destroyed youcentric object."
  end
end
