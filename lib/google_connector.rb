# Class GoogleConnector - Connecting class to the Google Api
class GoogleConnector
  class_attribute :url
  attr_accessor :email, :token

  # Initializes a Google connector per email
  def initialize email, token
    @email = email
    @token = token
  end

  def authorization_header
    { "Authorization" => "AuthSub token=#{@token}"}
  end
end