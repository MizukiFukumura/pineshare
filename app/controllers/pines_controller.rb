class PinesController < ApplicationController

  before_action :authenticate_user!

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
        
            @pines = @pines.page(params[:page]).per(6)
            @all_ranks = Pine.find(Like.group(:pine_id).order('count(pine_id) desc').limit(6).pluck(:pine_id))

        end

      


        def new
            @pine = Pine.new
        end
    
        def create
            pine = Pine.new(pine_params)
            pine.user_id = current_user.id
            if pine.save
              redirect_to :action => "index"
            else
              redirect_to :action => "new"
            end
          end
    
          def show
            @pine = Pine.find(params[:id])
# コメント機能
            @comments = @pine.comments
            @comment = Comment.new     
          end
    
          def edit
            @pine = Pine.find(params[:id])
          end
          
          def update
            pine = Pine.find(params[:id])
            if pine.update(pine_params)
              redirect_to :action => "show", :id => pine.id
            else
              redirect_to :action => "new"
            end
          end
    
          def destroy
            pine = Pine.find(params[:id])
            pine.destroy
            redirect_to controller: :users, action: :show, id: current_user.id

          end
        
    
          private
          def pine_params
            params.require(:pine).permit(:title, :name, :price, :place, :address, :about, :url, :image, tag_ids: [])
          end



end
