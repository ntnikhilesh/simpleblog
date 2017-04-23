class PostsController < ApplicationController
    http_basic_authenticate_with name:"nikhil",password:"123456",except:[:index,:show]
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
            redirect_to @post #then reditect to show page ie append id(getting from show method) after post and make url like posts/1 
        else
            render 'new'
        end
    end
    def edit
        @post=Post.find(params[:id])
    end
    def update
        @post=Post.find(params[:id])
        if(@post.update(post_params)) #update data to db
            redirect_to @post #then reditect to show page ie append id(getting from show method) after post and make url like posts/1 
        else
            render 'edit'
        end
    end
    def destroy
        @post=Post.find(params[:id])
        @post.destroy
        
        redirect_to posts_path
    end

    #get all form data and save into private variable
    private def post_params
        params.require(:post).permit(:title,:body)
        end
end
