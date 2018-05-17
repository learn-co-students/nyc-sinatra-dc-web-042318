class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @title = Title.all
    @landmark = Landmark.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.all.find_by(params)
    erb :'/figures/show'
  end

  post '/figures/:id' do
    @figure = Figure.all.find_by(id: params[:id])
    @figure.update(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.all.find_by(params)
    @title = Title.all
    @landmark = Landmark.all
    erb :'/figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
  end





end
