class PostsController < ApplicationController
	def create 
		@post = Post.new(post_params)

		respond_to do |format|
			if @post.save
				format.html {redirect_to post_path(@post), notice: 'Post was successfully created.'}
				format.json {render json: @post, status: created, location: @post}
			else
				format.html {render action: 'new'}
				format.json {render json: @post.errors, status: :unprocessable_entity}
			end
		end
	end

	def show
		id = params.require(:id)
		@post = Post.find(id)
	end
	def index
		@posts = Post.all
	end

	private
	def post_params
		params.require(:post).permit(:title, :content, :published)
	end
end