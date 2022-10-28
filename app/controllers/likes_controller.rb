class LikesController < ApplicationController

    def create
        like = current_user.likes.create(pine_id: params[:pine_id]) #user_idとpine_idの二つを代入
        redirect_back(fallback_location: root_path)
      end
    
    def destroy
        like = Like.find_by(pine_id: params[:pine_id], user_id: current_user.id)
        like.destroy
        redirect_back(fallback_location: root_path)
      end

    def index
      @all_ranks = Note.find(Like.group(:note_id).order('count(note_id) desc').limit(6).pluck(:note_id))
    end

end

