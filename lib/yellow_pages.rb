class YellowPages < Sinatra::Base

  require 'rubygems'
  require 'sinatra'
  require 'rabl'
  require 'active_support/core_ext'
  require 'active_support/inflector'
  require 'builder'
  require 'rest-client'

  Rabl.register!

  get '/communities' do
    @communities = get_communities('all')
    Rabl::Renderer.json(@communities, 'directory/communities/index', view_path: 'app/views')
  end

  get '/communities/:id' do
    @community = get_communities(params[:id])
    Rabl::Renderer.json(@community, 'directory/communities/show', view_path: 'app/views')
  end

  get '/networks/:id' do
    #TODO should be refactored into method
    @parties = Registration::Party.where(user_id: params[:id])
    @contracts = []
    @parties.each do |party|
      @contract = Registration::Contract.find(party.contract_id)
      @contracts << @contract
    end
    Rabl::Renderer.json(@contracts, 'registration/contracts/index', view_path: 'app/views')

  end

  get '/whitelabels/:id' do
    #TODO should be refactored
    @whitelabels = Registration::Whitelabel.where(contact_id: params[:id])
    Rabl::Renderer.json(@whitelabels, 'registration/whitelabels/index', view_path: 'app/views')
  end

  get '/contracts/:id' do
    #TODO should be refactored
    @contracts = Registration::Contract.where(contact_id: params[:id])
    Rabl::Renderer.json(@contracts, 'registration/contracts/index', view_path: 'app/views')
  end

  post '/invitations' do
    @invitation = Registration::Party.find(params[:invitation][:party_id].split('=>')[1].gsub(/[\{\}"]/, ''))

    @invitation.invitation_status = '500'
    @invitation.save


    #TODO need to send acknowledgement message

  end

  post '/networks' do
    #TODO for development
    puts params
    @contract = Registration::Contract.create(params[:contract])
    @contract.save
    params[:parties].each do |i|
      @party = Registration::Party.create(i[1])
      @party.contract_id = @contract.id
      #TODO need to set owner
      #todo invitation_status needs to be based on a value set
      #TODO owner needs to be set based on the account that the user is tied to

      #TODO should not send invitation to self ... only to others
      #TODO party should be marked as completed for self
      send_invitation
      @party.invitation_status = '2'
      @party.save
    end
    #TODO for development ... needs to return error codes
    'Contracts and Parties created, Invitations sent'
  end


  def get_communities (id)
    #TODO this should be refactored into helper class
    if id.nil?
      @communities = Directory::Community.all
    elsif id == 'all'
      @communities = Directory::Community.all
    else
      @community = Directory::Community.find(params[:id])
    end
  end

  def send_invitation
    #TODO should be refactored into sendMessage
    url = 'http://localhost:7777/youcentric_messages'
    @youcentric_message = RestClient.post(url,
                                          {youcentric_message: build_invitation, user_id: @party.user_id},
                                          {content_type: :json, accept: :json})
  end

  def build_invitation
    #:account_id, :archive_state, :cc, :cc_id, :community_id, :content, :conversation_id, :date_sent, :encoding, :folder_tag, :from, :from_id, :is_invitation, :reply_to, :status, :subject, :to, :to_id, :urgency

    #TODO sender needs to be set to owner
    #todo "to" needs to be set to a full name
    #todo "from" needs to be set to account
    #todo message status needs to be set

    #todo need to set a new field here for party ID so that can be updated directly

    #message = {account_id: @party.user_id,
    #           community_id: @contract.community_id,
    #           content: 'Please join my YouCentric Network -- New',
    #           conversation_id: '0',
    #           date_sent: Date.current,
    #           from: 'South Sound Neurosurgery',
    #           from_id: '4',
    #           is_invitation: 'true',
    #           invitation_info: @party.as_json.to_s,
    #           status: '',
    #           subject: 'Invitation to Network',
    #           to: @party.user_id,
    #           to_id: @party.user_id
    #          }
  end

end