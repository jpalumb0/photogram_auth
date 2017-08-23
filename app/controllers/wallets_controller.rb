class WalletsController < ApplicationController
  def index
    @wallets = Wallet.all

    render("wallets/index.html.erb")
  end

  def show
    @wallet = Wallet.find(params[:id])

    render("wallets/show.html.erb")
  end

  def new
    @wallet = Wallet.new

    render("wallets/new.html.erb")
  end

  def create
    @wallet = Wallet.new

    @wallet.user_id = params[:user_id]
    @wallet.balance = params[:balance]

    save_status = @wallet.save

    if save_status == true
      redirect_to("/wallets/#{@wallet.id}", :notice => "Wallet created successfully.")
    else
      render("wallets/new.html.erb")
    end
  end

  def edit
    @wallet = Wallet.find(params[:id])

    render("wallets/edit.html.erb")
  end

  def update
    @wallet = Wallet.find(params[:id])

    @wallet.user_id = params[:user_id]
    @wallet.balance = params[:balance]

    save_status = @wallet.save

    if save_status == true
      redirect_to("/wallets/#{@wallet.id}", :notice => "Wallet updated successfully.")
    else
      render("wallets/edit.html.erb")
    end
  end

  def destroy
    @wallet = Wallet.find(params[:id])

    @wallet.destroy

    if URI(request.referer).path == "/wallets/#{@wallet.id}"
      redirect_to("/", :notice => "Wallet deleted.")
    else
      redirect_to(:back, :notice => "Wallet deleted.")
    end
  end
end
