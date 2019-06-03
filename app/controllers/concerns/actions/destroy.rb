module Actions::Destroy
  def destroy
    instance_object.destroy
    redirect_to Article
  end
end
