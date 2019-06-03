class ArticlesController < ApplicationController

  class << self; attr_accessor :object_class end
  @object_class = Article

  def index
    @articles = Article.all
  end

  def show
    instance_object
  end

  include Actions::Create
  include Actions::New
  include Actions::Update
  include Actions::Destroy
  include Actions::Edit

  private

  def permitted_params
    params[:article].permit(:description)
  end

  def article
    instance_object
  end
end
