class LandmarksController < ApplicationController

	set :views, 'app/views/landmarks'

	get '/landmarks/new' do 
		erb :new
	end

	get '/landmarks/:id' do 
		@landmark = Landmark.find(params[:id])
		erb :show
	end

	post '/landmarks' do 
		@landmark = Landmark.create(params[:landmark])
		redirect("/landmarks/#{@landmark.id}")
	end

	get '/landmarks/:id/edit' do 
		@landmark = Landmark.find(params[:id])
		erb :edit
	end

	patch '/landmarks/:id' do 
		@landmark = Landmark.find(params[:id])
		@landmark.update(params[:landmark])
		@landmark.save
		redirect("/landmarks/#{@landmark.id}")
	end

	get '/landmarks' do 
		@landmarks = Landmark.all
		erb :index
	end
end
