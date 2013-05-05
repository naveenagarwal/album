class AlbumsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @albums = current_user.folders.order("folders.created_at desc").all
  end

  def new
    @album = Folder.new
    @album.photos.build
  end

  def create
    @album = Folder.new(params[:folder].merge(user_id: current_user.id))

    if @album.save
      return redirect_to albums_path, notice: "Album saved successfully"
    else
      @album.photos.build if @album.blank?
      return render "new"
    end
  end

  def show
    @album  = Folder.where(id: params[:id]).first
    @photos = @album.photos.includes(:tags)
  end

end
