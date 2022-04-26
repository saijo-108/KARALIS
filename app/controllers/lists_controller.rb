class ListsController < ApplicationController
  before_action :authenticate_user!
  require 'rspotify'
  require 'open-uri'

  ENV['ACCEPT_LANGUAGE'] = "ja"
  
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])

  def new
    @list = current_user.lists.build(search_params)
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to lists_path
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

  def board_params
  end

  private

  def list_params
    params.require(:list).permit(:name, :searchsong_id, :song_title, :artist, :preview)
  end

  def search_params
    params.permit(:searchsong_id, :artist, :preview, :song_title)
  end
end
