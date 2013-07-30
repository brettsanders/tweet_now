get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/tweet' do
  p params
  
  
  if request.xhr?
    begin
      Twitter.update(params[:tweet])
    rescue Exception => e 
      return e.message
    end
    "success"  
  else
    Twitter.update(params[:tweet])
    redirect to '/'
  end


end
