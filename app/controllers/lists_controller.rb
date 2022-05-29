class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: %i[edit update destroy show]
  require 'rspotify'
  require 'open-uri'

  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])

  def new
    @list = current_user.lists.build
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to list_path(@list.id)
      flash[:success] = 'リストを作成しました'
    else
      flash.now['alert'] = ' リストが作成できませんでした'
      render :new
    end
  end

  def index
    @lists = List.user_lists_get(current_user)
    @songs = Song.where(list_id: @lists.ids)
    @tile = []
  end

  def show
    @song = Song.where(list_id: @list.id)
    @release_song = @song.where(status: 'release')
    @nonrelease_song = @song.where(status: 'nonrelease')
  end

  def destroy
    @list.destroy!
    redirect_to lists_path, success: '削除しました！'
  end

  def edit; end

  def update
    if @list.update(list_params)
      redirect_to @list
      flash[:success] = 'リスト名を変更しました'
    else
      flash.now['alert'] = 'リストを変更できません'
      render :edit
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :id)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
