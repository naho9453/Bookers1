class BooksController < ApplicationController

 def edit
    @book = Book.find(params[:id])
 end

 def index
    @book2 = Book.new
    @books = Book.all
 end

 def create
    @book2 = Book.new(book_params)
    @books = Book.all
  if @book2.save
    flash[:notice] = 'Book was successfully created.'
    redirect_to book_path(@book2.id)
  else
   render :index
  end
 end

 def show
    @book = Book.find(params[:id])
 end

 def destroy
   flash[:notice] = "Book was successfully destroyed"
    books = Book.find(params[:id])
    books.destroy
    redirect_to '/books'
 end

 def update
    @book = Book.find(params[:id])
  if @book.update(book_params)
    flash[:notice] = "Book was successfully updated"
    redirect_to book_path(@book.id)
  else
    render :edit
  end
 end
 private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
