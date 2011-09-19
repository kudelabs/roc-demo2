class Api::MessagesController < Api::ApplicationController
  # GET /api/messages.json
  def index
    @messages = Message.all

    respond_to do |format|
      format.json { render json: @messages }
    end
  end

  # GET /api/messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.json { render json: @message }
    end
  end
end