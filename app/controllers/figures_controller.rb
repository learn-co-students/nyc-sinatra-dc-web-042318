class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @title = Title.create(params[:title])
      FigureTitle.create(figure_id: @figure.id, title_id: @title.id)
    end
    if !params[:landmark][:name].empty?
      @landmark = Landmark.create(params[:landmark])
      @landmark.figure_id = @figure.id
      @landmark.save
    end
    redirect to "/figures/#{@figure.id}"
  end

end
