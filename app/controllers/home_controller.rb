class HomeController < ApplicationController
	 skip_before_action :verify_authenticity_token, only: [:create]
	def index
		@posts = Post.all
	end
	
	def write
		
	end
	
	def create
		post = Post.new(title: params[:title], content: params[:content])
		if post.save 
			redirect_to '/'
		else
			flash[:error] = "글을 저장할 수 없습니다. 제목과 내용을 확인해 주세요."
			render :write		
		end
	end
end
