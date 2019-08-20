class BooksController < ApplicationController
	def top
	end

	def index
  		@book = Book.new
  		@books = Book.all
	end

	def new
    	@book = Book.new
	end

	def create
  		book = Book.new(book_params)
   		# DBへ保存する
        book.save
        # トップ画面へリダイレクト
    	if book.save
    		flash[:notice]="「successfully」"
    		redirect_to book_path(book.id)
    end
    end

	def show
	@book = Book.find(params[:id])
	end

	def edit
	@book = Book.find(params[:id])
	# book = Book.new(book_params)
 #   		# DBへ保存する
 #        book.save
 #        # トップ画面へリダイレクト
 #        redirect_to book_path(book.id)
	end

	def update
	book = Book.find(params[:id])
	if book.update(book_params)
    		flash[:notice]="「successfully」"
    		redirect_to book_path(book)
    end
	end

	def destroy
     book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end

  	private
    def book_params
        params.require(:book).permit(:title, :body)
    end
end