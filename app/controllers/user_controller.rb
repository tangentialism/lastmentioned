class UserController < ApplicationController
  def clear
    session[:request_token] = nil
  end
  def authenticate
    @consumer=OAuth::Consumer.new( O_KEY, O_SECRET, {
        :site=>"https://api.twitter.com"
        })
    @request_token = @consumer.get_request_token(:oauth_callback => 'http://127.0.0.1:3000/user/callback')
    session[:request_token] = @request_token
    redirect_to @request_token.authorize_url(:oauth_callback => 'http://127.0.0.1:3000/user/callback')
  end
  
  def callback
    logger.info(session)
    @request_token = session[:request_token]
    @access_token = @request_token.get_access_token
    session[:access_token] = @access_token
      
    render :text => @timeline
  end
  
end
