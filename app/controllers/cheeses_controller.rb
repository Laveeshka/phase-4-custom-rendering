class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    render json: cheeses
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    #when using find_by, if the record is not found, nil is returned
    #nil is a falsey value, so we can check for cheese and write a custom error message if a request was made for a cheese that was not found
    if cheese
      render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
    else
      render json: {error: "Cheese not found"}, status: :not_found
    end
  end

end
