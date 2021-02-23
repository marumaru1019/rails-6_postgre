class BooksController < ApplicationController
  def books

  end

  def index
    @books = Book.all
    # createと揃えないとErrorになる
    @book = Book.new
  end

  def create
    # Errorの際に@booksがないとnil errorになる
    @books = Book.all
    # @をつけてインスタンス化しないとエラーメッセージを表示できない
    @book = Book.new(books_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      flash[:alert] = "Book was not successfully created."
      render "books/index"
    end
  end

  def show
    @book = Book.find_by(id:params[:id])
  end

  def edit
    @book = Book.find_by(id:params[:id])
  end

  def update
    @book = Book.find_by(id:params[:id])
    if @book.update(books_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      flash[:alert] = "Book was not successfully updated."
      render "books/edit"
    end
  end

  def destroy
    book = Book.find_by(id:params[:id])
    if book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path
    else
      flash[:alert] = "Book was unsuccessfully destroyed."
      render "books/index"
    end
  end

  private
  # ストロングパラメータ
  # titleとbodyの要素を受け取る
  # モデル名_paramsという名前で関数を作る
  def books_params
    params.require(:book).permit(:title, :body)
  end
end
