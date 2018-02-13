class ProjectsController < ApplicationController
  before_action :set_project, only: [:update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = current_user.projects.all, each_serializer: ProjectSerializer #Project.all
  end


  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

      if @project.save
        render json: @project, status: :created, serializer: ProjectSerializer
      else
        render json: @project.errors, status: :unprocessable_entity 
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
  
      if @project.update(project_params)
       render json: @project, status: :ok
      else
        render json: @project.errors, status: :unprocessable_entity 
      end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
 
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = current_user.projects.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :user_id)
    end
end
