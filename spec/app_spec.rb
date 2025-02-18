require 'app'
require 'rspec'
require 'rack/test'

set :environment, :test

describe "Twitter Info" do
  include Rack::Test::Methods

  def app
    TwitterInfo
  end

  it "should provide helpful instructions" do

    get "/"

    last_response.body.should match(/Append a twitter username on the url to display/)
    last_response.status.should == 200

  end

  it "should return a 500 status for any POST" do

    post "/user/burtlo"

    last_response.status.should == 500
    last_response.body.should match(/Sorry/)

  end


  ##
  # this spec needs to be written.
  #
  it "should display the user's follower count for any valid username" do
    
    get "/user/burtlo"

    last_response.status.should == 200
    last_response.body.should match(/[0-9]+/)
  
  end

  ##
  # this spec is a placeholder a feature that needs to be written.
  # please write the spec and the feature.
  # gold star for writing the spec before the lib code. :)
  #
  # hints:
  # use a begin/rescue/end block to rescue the error raised by
  # the Twitter gem when a username cannot be found.
  #
  # when that happens, return a new template file named 404.haml
  #
  it "should return a custom 404 page when the username cannot be found" do

    get "/user/nonexistenttwitteruser"

    last_response.status.should == 404
    last_response.body.should match(/Uh oh! The page you were looking for could not be found because user "nonexistenttwitteruser" does not exist./)    
  
  end

end
