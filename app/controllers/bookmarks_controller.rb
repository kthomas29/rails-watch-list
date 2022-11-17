class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(params[:bookmark])
    if @bookmark.save
      flash[:notice] = "Bookmark created successfully."
      redirect_to @bookmark
    else
      flash[:error] = "Error creating bookmark."
      render :action => 'new'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    flash[:notice] = "Bookmark deleted successfully."
    redirect_to bookmarks_url
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
