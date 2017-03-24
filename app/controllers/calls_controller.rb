class CallsController < ApplicationController
  before_action :set_call, only: [:show, :update, :destroy]

  # GET /calls
  def index
    @calls = Call.all

    #render json: @calls
    render_pretty_json(@calls)
  end

  # GET /calls/1
  def show
    #render json: @call


    #Render Pretty json
    render_pretty_json(@call)
  end

  # POST /calls
  def create
    @call = Call.new(call_params)

    if @call.save
      render json: @call, status: :created, location: @call
    else
      render json: @call.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /calls/1
  def update
    if @call.update(call_params)
      render_pretty_json(@call)
    else
      render json: @call.errors, status: :unprocessable_entity
    end
  end

  # DELETE /calls/1
  def destroy
    @call.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call
      @call = Call.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def call_params
      params.require(:call).permit(:caller_name, :caller_picture, :call_type_icon, :date, :number_of_calls, :time_of_call)
    end

    #function to render pretter json
    def render_pretty_json(params)
      render json: JSON.pretty_generate(params.as_json)
    end
end
