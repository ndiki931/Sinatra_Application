#call out Bundler and read Gemfile file : it avoids require 'gem' everywhere
#require 'bundler'
#Bundler.require

require 'gossip'

class ApplicationController < Sinatra::Base #class ApplicationController inherits of Sinatra::Base class
  get '/' do
    #<html><head><title>The Gossip Project</title></head><body><h1>Mon super site de gossip !</h1></body></html>"
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
  	erb :new_gossip
  end

	post '/gossips/new/' do
  	puts "Ce programme ne fait rien pour le moment, on va donc afficher un message dans le terminal"
  	puts "Salut, je suis dans le serveur"
  	puts "Ceci est le contenu du hash params : #{params}"
  	puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
  	puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
  	puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
  	Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save
	
  	redirect '/'
	end

	get '/gossips/:id' do
 		puts "Voici le numéro du potin que tu veux : #{params['id']} !"
 		Gossip.find(params['id'])
	end

end


