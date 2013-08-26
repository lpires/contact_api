require 'spec_helper'

describe Contact do
  let(:contact) {Contact.new 'test@email.com'}

  it "should have a contact url" do
    Contact.url.should == "http://www.google.com/m8/feeds/contacts/"
  end

  it "should have a user context contact url" do
    contact.contact_feed_url.should == "http://www.google.com/m8/feeds/contacts/test@email.com/full"
  end

  it "should return the default pagination and json format as params" do
    contact.query_params.should == "?alt=json&max-results=30&&start-index=0"
  end

  it "should return updated pagination and json format as params" do
    contact.query_params(10,10).should == "?alt=json&max-results=10&&start-index=10"
  end

end
