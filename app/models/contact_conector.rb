require "google_connector"

class ContactConnector < GoogleConnector
  # Contact Google URL
  self.url = "http://www.google.com/m8/feeds/contacts/"

  # Initializes a Google connector per email
  def initialize email,token
    super(email, token)
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

  # Downloads Google Contacts
  def download(limit = LIMIT_PAGINATION, offset = OFF_SET_PAGINATION )
    url = URI.parse( "#{contact_feed_url}#{query_params limit, offset}" )
    http = Net::HTTP.new(url.host, url.port)
    header = authorization_header

    begin
      response = http.get( url.request_uri, header )
      return response.body
    rescue => e
    end
  end

end
