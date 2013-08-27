require 'spec_helper'

describe GoogleConnector do
  let(:connector) {GoogleConnector.new 'test@email.com', 'access_token'}

  it "should return authorization header" do
    connector.authorization_header["Authorization"].should == "AuthSub token=access_token"
  end
end