class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :interest]

	def search_by_kind	
		@posts = []
		Post.all.each do |post|
			if post.animal.kind == params[:kind]
				@posts << post
			end
		end
		@posts
	end

	def index
    @posts = reorder
  end

  def show
    @interested = InterestPost.find_by(user: current_user, post: @post).present?
    @post = Post.find(params[:id])
    puts @post.inspect
    @user = User.find(@post.user_id)
    @comments = @post.comments
  end

  def new
    @post = Post.new
    @post.build_animal
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Publicação criada com sucesso' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render 'users/new_post' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Publicação atualizada com sucesso' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Publicação deletada com sucesso' }
      format.json { head :no_content }
    end
  end

  def interest
    type = params[:type]
    if type == "interested"
      current_user.interests << @post
      redirect_to :back, notice: 'Marcado como interessado'
    elsif type == "uninterested"
      current_user.interests.delete(@post)
      redirect_to :back, notice: 'Desmarcado como interessado'
    else
      redirect_to :back, notice: 'Nada aconteceu'
    end
  end

  def comment_post
    @comment = Comment.new
  end

  def create_comment
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    @comment.text = params[:text]
    @comment.user_id = current_user.id
    @comment.post_id = @post.id

    if @comment.save
      if(current_user != @post.user)
        Notification.create(content: comment_message(@post), sender: current_user, receiver: @post.user, kind: "comment")
        redirect_to @post
      else
        redirect_to @post
      end
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:text, :location, animal_attributes: [:name, :kind, :breed, :vaccined, :castrated, :sex, :adopted, :size, :avatar])
    end

    def reorder
      case params[:order]
      when "date_desc"
        posts = SortByDateDesc.new
        posts.sort_posts
      when "date_asc"
        posts = SortByDateAsc.new
        posts.sort_posts       
      when "update_desc"
        posts = SortByUpdateDesc.new
        posts.sort_posts
      when "update_asc"
        posts = SortByUpdateAsc.new
        posts.sort_posts 
      when "location_desc"
        posts = SortByLocationDesc.new
        posts.sort_posts   
      when "location_asc"
        posts = SortByLocationAsc.new
        posts.sort_posts 
      else
        Post.all
      end
    end
end
