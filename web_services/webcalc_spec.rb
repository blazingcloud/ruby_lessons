require 'app.rb'
require 'rubygems'
require 'sinatra'
require 'rack/test'

def app
  Sinatra::Application
end

describe 'Web calculator' do
  include Rack::Test::Methods

  describe "/add" do
    describe "when given two numbers" do
      it "should return the sum" do
        get '/add/1/2'
        last_response.should be_ok
        last_response.body.should == "3"
      end
    end
  end
end
