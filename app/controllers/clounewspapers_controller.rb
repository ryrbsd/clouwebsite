class ClounewspapersController < ApplicationController
  before_action :set_employee_story, only: [:show, :edit, :update, :destroy]

  # GET /employee_stories
  # GET /employee_stories.json
  def index
    @newspapers = Clounewspapers.where(:Authorized => true).reverse
  end


  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy

  end

end
