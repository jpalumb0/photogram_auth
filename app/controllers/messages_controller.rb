class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:index, :show, :create]
  
  def index
    @messages = Message.all

    render("messages/index.html.erb")
  end

  def show
    @message = Message.find(params[:id])

    render("messages/show.html.erb")
  end

  def new
    @message = Message.new

    render("messages/new.html.erb")
  end

  def create
    @message = Message.new

    @message.amount = params[:amount].to_f
    @message.body = params[:body]
    @message.user_id = params[:user_id]
    @message.conversation_id = params[:conversation_id]
    
    send_wallet = Wallet.find_by(:user_id => @message.user_id)
    receive_wallet = Wallet.find_by(params[:pay_to])
    
    save_status = @message.save

    if save_status == true
      if @message.amount.present?
        send_wallet.balance -= @message.amount
        receive_wallet.balance += @message.amount
        send_wallet.save
        receive_wallet.save
        redirect_to("/conversations/#{@message.conversation_id}", :notice => "You sent $#{@message.amount.round(2)} to #{User.find(params[:pay_to]).username}!")

      else
        redirect_to("/conversations/#{@message.conversation_id}")
      end
    else
      render("messages/new.html.erb")
    end
  end

  def edit
    @message = Message.find(params[:id])

    render("messages/edit.html.erb")
  end

  def update
    @message = Message.find(params[:id])

    @message.amount = params[:amount]
    @message.body = params[:body]
    @message.conversation_id = params[:conversation_id]
    @message.user_id = params[:user_id]

    save_status = @message.save

    if save_status == true
      redirect_to("/messages/#{@message.id}", :notice => "Message updated successfully.")
    else
      render("messages/edit.html.erb")
    end
  end

  def destroy
    @message = Message.find(params[:id])

    @message.destroy

    if URI(request.referer).path == "/messages/#{@message.id}"
      redirect_to("/", :notice => "Message deleted.")
    else
      redirect_to(:back, :notice => "Message deleted.")
    end
  end
end
