class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
    else
      @bookmarks = @list.bookmarks.includes(:movie) # Assurez-vous de définir @bookmarks si le rendu échoue
      render 'new'
    end
  end

  # def destroy
  #   @bookmark = Bookmark.find(params[:id])
  #   @bookmark.destroy
  #   redirect_to list_path(@bookmark.list), notice: 'Bookmark was successfully destroyed.'
  # end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
