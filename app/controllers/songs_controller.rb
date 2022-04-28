class SongsController < ApplicationController
  def index
    @songs = Song.find_by(list_id: params[:list_id])
  end

  def create
    @song = current_user.songs.build(song_params)
    @list = List.find(params[:list_id])
    if @song.save
      flash[:success] = "曲を追加しました"
      redirect_to list_path(@list)
    else
      flash.now['alert'] = "曲が作成できませんでした"
      render :index
    end
  end

  def new
    @song = current_user.songs.build
    @list = List.find(params[:list_id])
    if params[:search].present?
      @searchsongs = RSpotify::Track.search(params[:search]).first(10)
    end
  end

  private

  def song_params
    params.require(:song).permit(:song_title, :artist, :preview).merge(list_id: params[:list_id])
  end
end
