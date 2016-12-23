class Complain < ActiveRecord::Base
  has_paper_trail
  rails_admin do
    navigation_label '客户服务'
    list do
      field :email do
        label "邮箱"
      end
      field :name do
        label "姓名"
      end
      field :phonenumber do
        label "电话"
      end
      field :solved do
        label "已解决"
      end
      field :text, :text do
          label "内容"
      end
      field :created_at do
          label "反馈时间"
      end
    end
    
    edit do
      field :email do
        label "邮箱"
      end
      field :name do
        label "姓名"
      end
      field :complain_type, :enum do
        label "客诉类型"
        enum do
          ["商品类", "服务类", "产品类", "其他"]
        end
        required true
      end
      field :phonenumber do
        label "电话"
      end
      field :text, :text do
          label "内容"
      end
      field :solved do
        label "已解决"
      end
      field :solve_people do
        label "处理人"
      end
      field :solve_method, :text do
        label "处理措施/结果"
      end
      
    end
  end
end