class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /project_managers
  # GET /project_managers.json
  def index
    @users = User.all

    render json: @users
  end

  # GET /project_managers/new
  def new
    @user = User.new
  end

  #show action
  def show
    render json: @user, serializer: UserSerializer
  end

  # POST /project_managers
  # POST /project_managers.json
  def create
    @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created, serializer: UserSerializer
      else
         render json: @user.errors, status: :unprocessable_entity 
      end
  end

  # PATCH/PUT /project_managers/1
  # PATCH/PUT /project_managers/1.json
  def update
      if @user.update(user_params)
        render json: @user, status: :ok, serializer: UserSerializer 
      else
        render json: @user.errors
      end
  end

  # DELETE /project_managers/1
  # DELETE /project_managers/1.json
  def destroy
    @user.destroy

    head :no_content 
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
     params.require(:user).permit(:name, :role, :email)
    end
end
