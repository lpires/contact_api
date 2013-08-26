require "google_connector"

class Contact < GoogleConnector
  # Contact Google URL
  self.url = "http://www.google.com/m8/feeds/contacts/"

  # Initializes a Google connector per email
  def initialize email
    super(email)
  end

  def contact_feed_url
    self.class.url + @email + "/full"
  end

  def query_params limit=LIMIT_PAGINATION, offset=OFF_SET_PAGINATION
    params = ''
    params += "?alt=json&"
    params += "max-results=#{limit}&"
    params += "&start-index=#{offset}"
    params
  end

end
