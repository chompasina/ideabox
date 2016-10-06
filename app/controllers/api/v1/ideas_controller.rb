class Api::V1::IdeasController <ApplicationController
  respond_to :json, :html
  
  def index
    respond_with Idea.all
  end
  
  def show
    respond_with Idea.find_by(id: params[:id])
  end
  
  def create
    respond_with Idea.create(idea_params), location: nil
  end
  
  def update
    respond_with Idea.update(params[:id], idea_params), location: nil
  end
  
  def destroy
    respond_with Idea.destroy(params[:id])
  end
  
  private
  
    def idea_params
      params.permit(:id, :body, :title, :quality)
    end
  end