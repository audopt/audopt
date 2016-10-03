class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :interest]

  def index
    @posts = Post.all
  end

  def show
    @interested = InterestPost.find_by(user: current_user, post: @post).present?
  end

  def new
    @post = Post.new
    @post.build_animal
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
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
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def interest
    type = params[:type]
    if type == "interested"
      current_user.interests << @post
      redirect_to :back, notice: 'Marcado como interresado'
    elsif type == "uninterested"
      current_user.interests.delete(@post)
      redirect_to :back, notice: 'Desmarcado como interresado'
    else
      redirect_to :back, notice: 'Nothing happended'
    end
  end


  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:text, :location, animal_attributes: [:name, :kind, :breed, :vaccined, :castrated, :sex, :adopted, :size, :avatar])
    end
end
