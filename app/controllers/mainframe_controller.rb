class MainframeController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  

  def show

  end

  def index
    # @products = Product.all
    @popproducts = PopProduct.where(:Authorized => true).limit(4).order('id desc')
    @company_news = CompanyNews.where(:Authorized => true).order("created_at desc").limit(8)
    @table_main_pics = TableMainPic.where(:authorized => true).order('id desc').limit(4)
  end
  
  def products
    @products = Product.where(:Authorized => true)
    @popproducts = PopProduct.where(:Authorized => true).limit(4).order('id desc')
    @categories = Category.where(:Authorized => true)
  end
  
  def sitemap
    @categories = Category.where(:Authorized => true)
  end
  
  def news
    # @industry_news = IndustryNews.all.reverse
    # @company_news = CompanyNews.all.reverse

    @company_news = CompanyNews.where(:Authorized => true).order("created_at desc").paginate :page => params[:page],:per_page => 6
  end
  
  def industrynews
     @industry_news = IndustryNews.where(:Authorized => true).order("created_at desc").paginate :page => params[:page], :per_page => 6
  end

  def new
  end
  
  def registrationsuccess
  end
  
  def create

  end

  def edit
  end

  def update

  end

  def destroy
  end
  

  
end
