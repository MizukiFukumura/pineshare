class PinehomesController < ApplicationController

    def index
        @pines = Pine.all

        #以下を追記 タグOR検索
      if params[:tag_ids]
        @pines = []
        params[:tag_ids].each do |key, value|      
          @pines += Tag.find_by(name: key).pines if value == "1"
        end
        @pines.uniq!
      end 
        #ここまで
      # 以下を追記 タグAND検索
      if params[:tag_ids]
        @pines = []
        params[:tag_ids].each do |key, value|
          if value == "1"
            tag_pines = Tag.find_by(name: key).pines
            @pines = @pines.empty? ? tag_pines : @pines & tag_pines
          end
        end
      end
      #ここまで

      # 以下を追記タグパラメータを送信し、そのパラメータがあればindexアクション内でtagsテーブルに保存
      if params[:tag]
        Tag.create(name: params[:tag])
      end
      #ここまで
    
        @pines = @pines.page(params[:page]).per(3)
        @all_ranks = Pine.find(Like.group(:pine_id).order('count(pine_id) desc').limit(3).pluck(:pine_id))

    end

        def about
        end

        private
        def pine_params
            params.require(:pine).permit(:title, :name, :price, :place, :address, :about, :url, :image, tag_ids: [])
        end

end
