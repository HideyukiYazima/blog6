class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]) 
    # kaminariのpageメソッドを使ってページネーションを設定
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: '投稿が削除されました。'
  end

  def create
    @post = Post.new(post_params)
    @post.image = params[:post][:image] # 追加するコード
    if @post.save
      redirect_to @post, notice: '投稿が作成されました。'
    else
      flash.now[:alert] = @post.errors.full_messages.join(',有効な画像ファイル(.jpg, .png, .gif)を選択してください')
      render :new
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content)
  end
  
end
