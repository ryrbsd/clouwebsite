require 'elasticsearch/model'
class TableMainPic < ActiveRecord::Base
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    has_paper_trail
    mount_uploader :picture_url, ImageUploader
    #rails admin set up
    rails_admin do
        navigation_label '首页'
        list do
          field :id do 
            label "id"
          end
          # field :description do
          #   label "梗概"
          # end
          # field :content do
          #   label "内容"
          #   pretty_value do
          #     value.html_safe
          #   end
          # end
          # field :video_url do
          #   label "视频链接"
          # end
          field :picture_url, :carrierwave do
            label "封面(只显示最后上传的四张)"
          end
          field :authorized do
            label "已审核"
          end
        end
        edit do 
          field :picture_url do
            label "图片"
            required true
          end
          field :authorized do
            label '审核'
            render do
              bindings[:view].render :partial  => "rails_admin/main/check_box", :locals => {:field => self, :select_user => bindings[:object]}
            end
          end
        end
    end
end
SpecialNewsTwo.__elasticsearch__.create_index! force: true
SpecialNewsTwo.__elasticsearch__.refresh_index!
SpecialNewsTwo.import