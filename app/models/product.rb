class Product < ActiveRecord::Base
    belongs_to :Type
    belongs_to :category
    mount_uploader :image, ImageUploader
    mount_uploader :attachment, AttachmentUploader
    def self.search(params)
      products = all # for not existing params args
      products = products.where("name like ?", "%#{params[:search]}%") if params[:search]
      products
    end
    #set up rails admin
    rails_admin do
        navigation_label '产品类别'
        parent Type
        list do 
          field :name do
            label "名称"
          end
          # field :synopsis do
          #   label "梗概"
          #   pretty_value do
          #     value.html_safe
          #   end
          # end
          # field :detail do
          #   label "细节"
          # end
          
          field :category_id, :enum do
            label "产品大类"
            enum do 
              Category.all.collect {|p| [p.name, p.id]}
            end
          end
          
          field :Type_id, :enum do
            label "产品小类"
            enum do
              ::Type.all.collect {|p| [p.name, p.id]}
            end
          end
          
          field :image, :carrierwave do
            label "图片"
          end
          
          field :attachment, :carrierwave do
            label "附件"
          end     
        end
        
        edit do 
          field :name do
            label "名称"
            required true
          end
          field :synopsis, :text do
            label "梗概"
            html_attributes do
              {:maxlength => 300}
            end
          end
          field :detail, :ck_editor do
            label "细节"
          end
          
          field :category_id, :enum do
            label "产品大类"
            required true
            # partial "add_type_base_on_category"
            # render do
            #   bindings[:view].render :partial => "add_type_base_on_category", :locals => {:field => self, :form => bindings[:form]}
            # end
            enum do 
              Category.all.collect {|p| [p.name, p.id]}
            end
          end
          
          field :Type_id do
            label "产品小类"
            required true
            partial :add_type_base_on_category
            # enum do
            #   ::Type.all.collect {|p| [p.name, p.id]}
            # end
          end
          
          field :seo_title do
            label "SEO 标题"
          end  
          
          field :seo_word do
            label "SEO 关键字"
          end  
          
          field :image, :carrierwave do
            label "图片"
          end
          
          field :attachment, :carrierwave do
            label "附件"
          end
        end
    end
end
