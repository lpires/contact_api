class EmailContactsController < ApplicationController
  def index

  end

  def show
    email = EMAIL
    #What data comes back from OmniAuth?
    @auth = request.env["omniauth.auth"]
    #Use the token from the data to request a list of contacts
    token = @auth["credentials"]["token"]

    @contact = ContactConnector.new(email,token).download
    @contact = @contact.sort {|a,b| a['gd$email'].last['address']<=>b['gd$email'].last['address']}
  end

end
