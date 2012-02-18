class MentionController < ApplicationController
  def last
    @word = params[:word]
    @timeline = ''
    logger.info(session)
    unless session[:access_token]
      redirect_to :authenticate
    else
      @access_token = session[:access_token]
      @response = @access_token.get('http://api.twitter.com/1/statuses/user_timeline.json')
      @timeline = JSON.parse(@response.body)
    end
    
    render :text => @timeline.collect{|t| t['text']}
  end
end
