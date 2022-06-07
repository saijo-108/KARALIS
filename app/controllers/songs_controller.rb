class SongsController < ApplicationController
  before_action :set_song, only: %i[edit update destroy]
  before_action :list_set, only: %i[edit update destroy new]

  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])

  def index
    @songs = Song.find_by(list_id: params[:list_id])
  end

  def create
    @song = current_user.songs.build(song_params)
    @list = List.find(params[:list_id])
    if @song.save
      flash[:success] = '曲を追加しました'
      redirect_to list_path(@list)
    else
      flash[:alert] = 'すでに登録されています'
      redirect_to list_path(@list)
    end
  end

  def new
    @song = current_user.songs.build
    @searchsongs = RSpotify::Track.search(params[:search]) if params[:search].present?
  end

  def destroy
    @song.destroy!
    redirect_to list_path(@list), success: '削除しました！'
  end

  def edit
    @list = List.find(params[:list_id])
    @songs = Song.all
    @song = @songs.select do |x|
      x.list_id == @list.id
    end
  end

  def update
    if @song.update!(song_params)
      redirect_to @list
      flash[:success] = '設定を保存しました'
    else
      redirect_to @list
      flash[:danger] = '設定を変更できません'
    end
  end

  private

  def song_params
    params.require(:song).permit(:song_title, :artist, :preview, :id, :status, :image).merge(list_id: params[:list_id])
  end

  def set_song
    @song = Song.find_by(id: params[:id], list_id: params[:list_id])
  end

  def list_set
    @list = List.find(params[:list_id])
  end
end
