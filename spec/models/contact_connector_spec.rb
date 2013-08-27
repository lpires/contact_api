require 'spec_helper'

describe ContactConnector do
  let(:connector) {ContactConnector.new 'test@email.com', 'access_token'}

  it "should have a contact url" do
    ContactConnector.url.should == "http://www.google.com/m8/feeds/contacts/"
  end

  it "should have a user context contact url" do
    connector.contact_feed_url.should == "http://www.google.com/m8/feeds/contacts/test@email.com/full"
  end

  it "should return the default pagination and json format as params" do
    connector.query_params.should == "?alt=json&max-results=30&&start-index=0"
  end

  it "should return updated pagination and json format as params" do
    connector.query_params(10,10).should == "?alt=json&max-results=10&&start-index=10"
  end

end
