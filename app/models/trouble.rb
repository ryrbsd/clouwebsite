class Trouble < ActiveRecord::Base
  has_paper_trail
  validates :customer_company, presence: true
  validates :customer_address, presence: true
  validates :product_type, presence: true
  validates :product_id, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates :phonenumber, presence: true
  rails_admin do
    navigation_label '客户服务'
    list do
      field :email do
        label "邮箱"
      end
      field :name do
        label "姓名"
      end
      field :customer_company do
        label "公司名称"
        # required true
      end
      field :phonenumber do
        label "电话"
      end
      field :solved do
        label "已解决"
      end
      field :created_at do
        label "申报时间"
      end
    end
    
    edit do
      field :email do
        label "邮箱"
      end
      field :name do
        label "姓名"
      end
      field :phonenumber do
        label "电话"
      end
      field :customer_company do
        label "公司名称"
        required true
      end
      field :customer_address do
        label "公司地址"
        required true
      end
      field :contract_id do
        label "合同号"
      end
      field :product_type do
        label "产品类型"
        required true
      end
      field :product_id do
        label "产品型号"
        required true
      end
      field :solved do
        label "已解决"
      end
      field :text, :text do
          label "内容"
      end
    end
  end
end
