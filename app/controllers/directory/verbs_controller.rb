class Directory::VerbsController < ApplicationController
  def index
    @verbs = Verb.all
  end

  def show
    @verb = Verb.find(params[:id])
  end

  def new
    @verb = Verb.new
  end

  def create
    @verb = Verb.new(params[:verb])
    if @verb.save
      redirect_to @verb, :notice => "Successfully created verb."
    else
      render :action => 'new'
    end
  end

  def edit
    @verb = Verb.find(params[:id])
  end

  def update
    @verb = Verb.find(params[:id])
    if @verb.update_attributes(params[:verb])
      redirect_to @verb, :notice  => "Successfully updated verb."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @verb = Verb.find(params[:id])
    @verb.destroy
    redirect_to verbs_url, :notice => "Successfully destroyed verb."
  end
end
