module Fhir
  class QuestionnairesController < FhirBaseController
    RESOURCE = 'questionnaire
'
    before_action :set_questionnaire, only: [:show, :edit, :update, :destroy]

    # GET /questionnaires
    # GET /questionnaires.json
    def index
      response = get_gringotts_resources(RESOURCE, build_search_params(params))
      if response.success?
        @questionnaires = Fhir::Questionnaire.parse_ehmbr_list(response.body)

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

    # GET /questionnaires/1
    # GET /questionnaires/1.json
    def show
      response = get_resource(RESOURCE, params[:id])
      if response.success?
        @questionnaires = Fhir::Questionnaire.parse_embhr(response.body)
      else
        logger.warn response
        render status: 500
      end
    end

    # GET /questionnaires/new
    def new
      @questionnaire = Questionnaire.new
    end

    # POST /questionnaires
    # POST /questionnaires.json
    def create
      #@questionnaire = Questionnaire.new(questionnaire_params)
      #
      #respond_to do |format|
      #  if @questionnaire.save
      #    format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully created.' }
      #    format.json { render action: 'show', status: :created, location: @questionnaire }
      #  else
      #    format.html { render action: 'new' }
      #    format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      #  end
      #end
      render :status => 501
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionnaire_params
      params[:questionnaire]
    end
  end
end
