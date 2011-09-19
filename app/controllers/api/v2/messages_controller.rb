class Api::V2::MessagesController < Api::ApplicationController
  before_filter :authenticate, :only => :create
  
  # curl -H "Accept: application/json" http://localhost:3000/api/v2/messages
  # GET /api/messages.json
  def index
    @messages = Rails.cache.fetch('all_messages', :expires_in => 30.seconds) do
      Message.all
    end

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
  
  # curl -X POST -H "Accept: application/json" --user shaokun.wu@gmail.com:a http://localhost:3000/api/v2/messages -d "message[body]=abcdefg"
  def create
    @message = Message.new(params[:message])
    @message.user = @current_user
    @message.save!
    
    render json: @message
  end
  
  private
  def authenticate
    if user = authenticate_with_http_basic { |u, p| User.authenticate(u, p) }
      @current_user = user
    else
      request_http_basic_authentication
    end
  end
end