class Directory::CommunityRoleKindsController < ApplicationController
  def index
    @community_role_kinds = CommunityRoleKind.all
  end

  def show
    @community_role_kind = CommunityRoleKind.find(params[:id])
  end

  def new
    @community_role_kind = CommunityRoleKind.new
  end

  def create
    @community_role_kind = CommunityRoleKind.new(params[:community_role_kind])
    if @community_role_kind.save
      redirect_to @community_role_kind, :notice => 'Successfully created community role kind.'
    else
      render :action => 'new'
    end
  end

  def edit
    @community_role_kind = CommunityRoleKind.find(params[:id])
  end

  def update
    @community_role_kind = CommunityRoleKind.find(params[:id])
    if @community_role_kind.update_attributes(params[:community_role_kind])
      redirect_to @community_role_kind, :notice  => 'Successfully updated community role kind.'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @community_role_kind = CommunityRoleKind.find(params[:id])
    @community_role_kind.destroy
    redirect_to community_role_kinds_url, :notice => 'Successfully destroyed community role kind.'
  end
end
