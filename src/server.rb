# Final Project: A Text Adventure Game
# Date: 05-May-2016
# Authors: A01020319 Fernando Gomez Herrera
#          A01371743 Luis Eduardo Ballinas Aguilar
require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require "sinatra/reloader" if development?
require 'json'

require 'sequel'

DB ||= Sequel.connect("sqlite://game.db") # in memory

DEPENDENCIES ||= ['models/game', 'models/player', 'models/monster', 'models/room',
                  'models/movement', 'models/states/fighting_state',
                  'models/states/exploring_state']
DEPENDENCIES.each { |file| also_reload file  if development? }
DEPENDENCIES.each { |file| require_relative file }

enable :sessions
set :bind, '0.0.0.0'
set :session_secret, 'SecretString#!$%'

# Index page
get '/' do
  erb :index
end

# Main game console
get '/console' do
  session[:game] ||= Game.new Player.new "parzival"
  erb :console
end

# Creates a game
post '/' do
  session[:game] = Game.new Player.new params[:player_name]
  redirect '/console'
end

# Gets the current status for the game state
get '/status' do
  get_status.to_json
end


# Generic route to send a command to be executed
post '/send_command' do
  status = Hash.new

  puts "PARAMS"
  p params

  command = params[:command].to_sym
  game    = session[:game]

  puts "EXECUTING COMMAND: #{command}"
  output = game.state.handle command
  puts output

  status          = get_status
  status[:output] = output

  status.to_json
end

# Route to specify that a fight is going to start
post '/fight' do
  status = get_status

  puts "PARAMS"
  p params

  game   = session[:game]
  weapon = params[:weapon].to_sym
  puts "FIGHTING WITH WEAPON: #{weapon}"
  output = game.state.handle weapon
  puts output
  status          = get_status
  status[:output] = output

  status.to_json
end

private
# Gets the current status for a given state
def get_status
  game = session[:game]
  status = Hash.new
  status[:player]  = game.player.name
  status[:weapons] = game.player.weapons.to_a
  status[:monster] = game.current_room_model.monster != nil
  status[:rooms]   = game.rooms_status
  status[:output]  = game.state.status
  status[:state]   = game.state.class.to_s
  puts "STATUS"
  puts status

  status
end
