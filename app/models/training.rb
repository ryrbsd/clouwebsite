class Training < ActiveRecord::Base
    has_paper_trail
    include Elasticsearch::Model
    rails_admin do
        weight -10
        navigation_label '人力资源'
        list do
            field :title do
                label "标题"
            end
            field :authorized do
                label "已审核"
            end
        end
        edit do
            field :title do
                label "标题"
                required true
            end
            field :text, :ck_editor do
                label "内容"
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
