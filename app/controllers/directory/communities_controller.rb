class Directory::CommunitiesController < ApplicationController

  respond_to :html, :xml, :json, :js

  def index
    @communities = Directory::Community.all

    respond_to do |format|
      format.html
      format.xml {render :xml => @communities}
      format.json {render :json => @communities}
    end
  end

  def show
    @community = Directory::Community.find(params[:id])
    @community_role_kinds = Directory::CommunityRoleKind.all

    respond_to do |format|
      format.html
      format.xml {render :xml => @community}
      format.json {render :json => @community}
    end
  end

  def new
    @community = Directory::Community.new
    @community_role_kinds = Directory::CommunityRoleKind.all
  end

  def create
    @community = Directory::Community.new(params[:directory_community])
    if @community.save
      respond_to do |format|
        format.html {redirect_to @community, :notice => "Successfully created network."}
        format.xml {render :xml => @community}
        format.json {render :json => @community}
      end
    else
      render :action => 'new'
    end
  end

  def edit
    @community_role_kinds = Directory::CommunityRoleKind.all
    @community = Directory::Community.find(params[:id])
  end

  def update
    @community = Directory::Community.find(params[:id])
    if @community.update_attributes(params[:directory_community])
      redirect_to @community, :notice  => "Successfully updated community."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @community = Directory::Community.find(params[:id])
    @community.destroy
    redirect_to communities_url, :notice => "Successfully destroyed community."
  end

end
