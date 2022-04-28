class ListsController < ApplicationController
  before_action :authenticate_user!
  require 'rspotify'
  require 'open-uri'

  ENV['ACCEPT_LANGUAGE'] = "ja"
  
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])

  def new
    @list = current_user.lists.build
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to list_path(@list.id)
      flash[:success] = "リストを作成しました"
    else
      flash.now['alert'] = " リストが作成できませんでした"
      render :new
    end
  end

  def index
    @lists = List.all.includes(:user).order(created_at: :asc)
  end

  def show
    @list = List.find(params[:id])
    @user = @list.user
    @songs = Song.all
    @song = @songs.select do |x|
      x.list_id == @list.id
    end
  end

  def search
    if params[:search].present?
      @searchsongs = RSpotify::Track.search(params[:search]).first(10)
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy!
    redirect_to lists_path, success: "削除しました！"
  end

  private

  def list_params
    params.require(:list).permit(:name, :id)
  end

end
