class ConversationsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:index, :show]
  
  def index
    @conversations = current_user.conversations.uniq

    render("conversations/index.html.erb")
  end

  def show
    @conversation = Conversation.find(params[:id])

    render("conversations/show.html.erb")
  end

  def new
    @conversation = Conversation.new

    render("conversations/new.html.erb")
  end

  def create
    @conversation = Conversation.new
    
      
    @member_ids = params[:member_ids]
    @member_ids << current_user.id
    
    
    @conversation.save
  
    
    @member_ids.each do |id|
      invite_message = Message.new
      invite_message.body = "joined"
      invite_message.user_id = id
      invite_message.conversation_id = @conversation.id
      invite_message.save
    end  
    
    @conversation.title = @conversation.members.pluck(:username).to_sentence
    
    save_status = @conversation.save
    
    if save_status == true
      redirect_to("/conversations/#{@conversation.id}", :notice => "Conversation created successfully.")
    else
      render("conversations/new.html.erb")
    end
    
=begin
    @member_names = []
    member_ids.each do |id|
      @member_names.push(User.find(id)[0][:username])
    end
    @conversation.title = @member_names.to_sentence

    save_status = @conversation.save

    if save_status == true
      redirect_to("/conversations/#{@conversation.id}", :notice => "Conversation created successfully.")
    else
      render("conversations/new.html.erb")
    end
=end
  end


  def edit
    @conversation = Conversation.find(params[:id])

    render("conversations/edit.html.erb")
  end

  def update
    @conversation = Conversation.find(params[:id])

    @conversation.title = params[:title]

    save_status = @conversation.save

    if save_status == true
      redirect_to("/conversations/#{@conversation.id}", :notice => "Conversation updated successfully.")
    else
      render("conversations/edit.html.erb")
    end
  end

  def destroy
    @conversation = Conversation.find(params[:id])

    @conversation.destroy

    if URI(request.referer).path == "/conversations/#{@conversation.id}"
      redirect_to("/", :notice => "Conversation deleted.")
    else
      redirect_to(:back, :notice => "Conversation deleted.")
    end
  end
end
