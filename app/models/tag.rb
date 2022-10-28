class Tag < ApplicationRecord

    #Tagsテーブルから中間テーブルに対する関連付け
    has_many :pine_tag_relations, dependent: :destroy
    #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
    has_many :pines, through: :pine_tag_relations, dependent: :destroy

end
