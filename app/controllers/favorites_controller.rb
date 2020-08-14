class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end
  
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
    
    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録'
    else
      redirect_to topics_path, danger: 'お気に入り失敗'
    end
  end
  
  def destroy
  favorite = Favorite.find_by(params[:topic_id])
  favorite.delete
  
    redirect_to topics_path, success: 'お気に入り解除'
  end
end
