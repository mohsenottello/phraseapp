class AnswersController < ApplicationController

  class << self; attr_accessor :object_class end
  @object_class = Answer

  include Actions::Create
  include Actions::New
  include Actions::Update
  include Actions::Destroy
  include Actions::Edit

  private

  def permitted_params
    params[:answer].permit(:description, :parent_id)
  end

  def article
    instance_object.question.article
  end
end
