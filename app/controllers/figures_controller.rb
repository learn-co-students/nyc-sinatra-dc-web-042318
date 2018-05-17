class FiguresController < ApplicationController

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    @title = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if params[:title][:name].empty?
       @figure.title << Title.create(params[:title])
    end
    binding.pry
    puts "fd"
  end


end
