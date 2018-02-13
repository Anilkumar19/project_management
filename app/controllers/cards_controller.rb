class CardsController < ApplicationController
  before_action :set_card, only: [:update_card_list, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
     @cards = []
    current_user.projects.each do |project|
      card_list = project.card_lists
      cards_data = card_list.collect { |list| { list_name: list, list_projects: list.projects} }
      @cards << { user_project: project, user_project_list: cards_data }
    end 

    render json: @cards
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)

      if @card.save
        render json: @card, status: :created, serializer: CardSerializer
      else
        render json: @card.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
      if @card.update(card_params)
         render json: @card, status: :ok, serializer: CardSerializer
      else
         render json: @card.errors, status: :unprocessable_entity 
      end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy

    head :no_content 
  end

  #for moving the card from one list anotjher
  def update_card_list
    @card.update(card_list_id: params[:card_list_id])

    render json: @card
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:task_name, :card_list_id)
    end
end
