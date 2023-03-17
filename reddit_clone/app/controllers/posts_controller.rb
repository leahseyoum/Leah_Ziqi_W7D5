class PostsController < ApplicationController
    def new
        @post = Post.new
        @sub = Sub.find_by(id: params[:sub_id])
    end

    def create
        post = Post.new(post_params)
        if post.save
            redirect_to post_url(post)
        else
            flash.now[:error] = post.errors.full_messages
            render :new 
        end
    end

    def edit 
        @post = Post.find_by(id: params[:id])

    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash.now[:error] = @post.errors.full_messages
            render :edit
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
        @author = User.find_by(id: @post.author_id)
        render :show
    end

    private

    def post_params
        params.require(:post).permit(:title, :url, :content, :sub_id, :author_id)
    end
end
