class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id]) 
        @pines = @user.pines.page(params[:page]).per(3)

        @likes = @user.liked_pines.page(params[:page]).per(3)
    end




private
    def pine_params
    params.require(:pine).permit(:title, :name, :price, :place, :address, :about, :url, :image, tag_ids: [])
    end


end
