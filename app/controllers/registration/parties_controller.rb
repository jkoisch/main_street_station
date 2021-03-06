class Directory::PartiesController < ApplicationController
  def index
    @parties = Party.all
  end

  def show
    @party = Party.find(params[:id])
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(params[:party])
    if @party.save
      respond_to do |format|
        format.html {redirect_to @party, :notice => 'Successfully created party.'}
        format.xml {render :xml => @party}
        format.json {render :json => @party}
      end
    else
      render :action => :new
    end
  end

  def edit
    @party = Party.find(params[:id])
  end

  def update
    @party = Party.find(params[:id])
    if @party.update_attributes(params[:party])
      redirect_to @party, :notice  => 'Successfully updated party.'
    else
      render :action => :edit
    end
  end

  def destroy
    @party = Party.find(params[:id])
    @party.destroy
    redirect_to parties_url, :notice => 'Successfully destroyed party.'
  end
end
