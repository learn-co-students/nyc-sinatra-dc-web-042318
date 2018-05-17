class FiguresController < ApplicationController

	set :views, 'app/views/figures'

	get "/figures/new" do 
		@titles = Title.all 
		@landmarks = Landmark.all
		erb :new
	end

	post '/figures' do 
		@figure = Figure.create(params[:figure])
		if !params["landmark"]["name"].empty?
      		@figure.landmarks << Landmark.create(params["landmark"])
    	end
    	if !params["title"]["name"].empty?
      		@figure.titles << Title.create(params[:title])
    	end
    	@figure.save
    	redirect("/figures/#{@figure.id}")
	end

	patch '/figures/:id' do 
		@figure = Figure.find(params[:id])
		@figure.update(params[:figure])
		if !params["landmark"]["name"].empty?
	  		@figure.landmarks << Landmark.create(params["landmark"])
		end
		if !params["title"]["name"].empty?
	  		@figure.titles << Title.create(params[:title])
		end
		@figure.save
		redirect("/figures/#{@figure.id}")
	end

	get "/figures/:id" do 
		@figure = Figure.find(params[:id])
		erb :show
	end

	get "/figures/:id/edit" do 
		@figure = Figure.find(params[:id])
		@titles = Title.all 
		@landmarks = Landmark.all
		erb :edit
	end

	get '/figures' do 
		@figures = Figure.all
		erb :index
	end

end
