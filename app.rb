require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:homepage)
end

get("/rock") do
  options = ["rock", "paper", "scissors"]

  @cpu = options.sample

  if @cpu == "rock"
    @outcome = "tied"
  elsif @cpu == "paper"
    @outcome = "lost"
  else
    @outcome = "won"
  end

  erb(:rock)
end

get("/paper") do
  options = ["rock", "paper", "scissors"]

  @cpu = options.sample

  if @cpu == "rock"
    @outcome = "won"
  elsif @cpu == "paper"
    @outcome = "tied"
  else
    @outcome = "lost"
  end

  erb(:paper)
end

get("/scissors") do
  options = ["rock", "paper", "scissors"]

  @cpu = options.sample

  if @cpu == "rock"
    @outcome = "lost"
  elsif @cpu == "paper"
    @outcome = "won"
  else
    @outcome = "tied"
  end

  erb(:scissors)
end
