class PostsController < ApplicationController
    #def keyword used for defining function
    # @varable name for defining varialble
    def index
        @post=Post.all
    end
     def show
        @post=Post.find(params[:id])
    end
    def new
        @post=Post.new
    end
    def create
        #on click of submit button on view page this function will execute
        #render plain: params[:post].inspect  # print object on browser
        @post=Post.new(post_params)  #Post is the model name
        
        if(@post.save) #save data to db
            redirect_to @post #then reditect to show page
        else
            render 'new'
        end
    end

    #get all form data and save into private variable
    private def post_params
        params.require(:post).permit(:title,:body)
        end
end
