require 'pry'
class LandmarksController < ApplicationController

  #CREATE
  get "/landmarks/new" do
    erb :"landmarks/new"
  end

  post "/landmarks" do
    @landmark = Landmark.find_or_create_by(params["landmark"])
    redirect "/landmarks/#{@landmark.id}"
  end

  #READ
  get "/landmarks" do
    erb :"landmarks/index"
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  #UPDATE
  get "/landmarks/:id/edit" do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/edit"
  end

  post "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params["landmark"])
    redirect "/landmarks/#{@landmark.id}"
  end


end
