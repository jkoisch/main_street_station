class Directory::CommunityRolesController < ApplicationController
  def index
    @community_roles = CommunityRole.all
  end

  def show
    @community_role = CommunityRole.find(params[:id])
  end

  def new
    @community_role = CommunityRole.new
  end

  def create
    @community_role = CommunityRole.new(params[:community_role])
    if @community_role.save
      respond_to do |format|
        format.html {redirect_to @community_role, :notice => 'Successfully created community role.'}
        format.xml {render :xml => @community_role}
        format.json {render :json => @community_role}
      end
    else
      render :action => 'new'
    end
  end

  def edit
    @community_role = CommunityRole.find(params[:id])
  end

  def update
    @community_role = CommunityRole.find(params[:id])
    if @community_role.update_attributes(params[:community_role])
      redirect_to @community_role, :notice  => 'Successfully updated community role.'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @community_role = CommunityRole.find(params[:id])
    @community_role.destroy
    redirect_to community_roles_url, :notice => 'Successfully destroyed community role.'
  end
end
