# Class GoogleConnector - Connecting class to the Google Api
class GoogleConnector
  class_attribute :url
  attr_accessor :email

  # Initializes a Google connector per email
  def initialize email
    @email = email
  end


end