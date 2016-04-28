class PostsController < ApplicationController
	def index
		@user = current_user.posts
	end


	def new
		@post = Post.new
	end

	def create
		@user = current_user.posts
		# puts "this comes from: #{@user}"
		@post = Post.new(user_params)
		# puts"Message from @posts #{@post}"
		if @post.save
			flash[:notice] = "Post Created"
		redirect_to "/posts"
		else
		flash[:alert] = "Post not created. Please try again."
		redirect_to :back
		end
	end
	def show
		@user = current_user.posts.find(params[:postid])
		@title = @user.post_title
		@body = @user.post_body


	end
	def edit

	end

	private
	def user_params
		params.require(:post).permit(:user_id, :post_title, :post_body)
	end
end
