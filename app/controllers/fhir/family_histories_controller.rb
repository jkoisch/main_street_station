module Fhir
  class FamilyHistoriesController < FhirBaseController
    RESOURCE = 'family_history'

    before_action :set_family_history, only: [:show, :edit, :update, :destroy]

    # GET /family_histories
    # GET /family_histories.json
    def index
      response = get_gringotts_resources(RESOURCE, build_search_params(params))
      if response.success?
        @family_histories = Fhir::FamilyHistory.parse_ehmbr_list(response.body)

        respond_to do |format|
          #format.html
          #format.atom
          format.json
          #format.xml
        end
      else
        logger.warn response
        respond_to do |format|
          format.html status: 500
          format.json status: 500
          format.xml  status: 500
        end
      end
    end

    # GET /family_histories/1
    # GET /family_histories/1.json
    def show
      response = get_resource(RESOURCE, params[:id])
      if response.success?
        @family_histories = Fhir::FamilyHistory.parse_ehmbr(response.body)
      else
        logger.warn response
        render status: 500
      end
    end

    # GET /family_histories/new
    def new
      @family_history = FamilyHistory.new
    end

    # POST /family_histories
    # POST /family_histories.json
    def create
      #@family_history = FamilyHistory.new(family_history_params)
      #
      #respond_to do |format|
      #  if @family_history.save
      #    format.html { redirect_to @family_history, notice: 'Family history was successfully created.' }
      #    format.json { render action: 'show', status: :created, location: @family_history }
      #  else
      #    format.html { render action: 'new' }
      #    format.json { render json: @family_history.errors, status: :unprocessable_entity }
      #  end
      #end
      render :status => 501
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_family_history
      @family_history = FamilyHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_history_params
      params[:family_history]
    end
  end
end

