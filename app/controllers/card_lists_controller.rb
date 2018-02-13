class CardListsController < ApplicationController
  before_action :set_card_list, only: [:update, :destroy]

  # GET /card_lists
  # GET /card_lists.json
  def index
    @card_lists = []
    current_user.projects.each do |h|
      @card_lists << { user_project: h, project_lists: h.card_lists}
    end #CardList.all

    render json: @card_lists
  end


  # POST /card_lists
  # POST /card_lists.json
  def create
    @card_list = CardList.new(card_list_params)

      if @card_list.save 
         render :show, status: :created, serializer: CardListSerializer
      else 
         render json: @card_list.errors, status: :unprocessable_entity 
      end
  end

  # PATCH/PUT /card_lists/1
  # PATCH/PUT /card_lists/1.json
  def update
      if @card_list.update(card_list_params)
         render :show, status: :ok, serializer: CardListSerializer
      else
         render json: @card_list.errors, status: :unprocessable_entity 
      end
    end
  end

  # DELETE /card_lists/1
  # DELETE /card_lists/1.json
  def destroy
    @card_list.destroy

    head :no_content 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_list
      @card_list = CardList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_list_params
      params.require(:card_list).permit(:title, :project_id)
    end
end
