
class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
   end

  # route pour afficher le Home page
  get '/gossips/new/' do
    erb :gossips_new
  end

  # request POST pour ajouter la nouvelle potin
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  # route pour le view profile de chaque potin 
  get '/gossips/:id' do
    erb :show
  end

  # route pour le view edit
  get '/gossips/:id/edit' do
    erb :edit
  end

  post '/gossips/:id/edit' do
    # recuperation de l'id, gossip_author et gossip_content pour la modification du potin
    Gossip.update(params[:id].to_i, params["gossip_author"], params["gossip_content"])
    redirect '/'
  end
end
