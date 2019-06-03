module Actions::New
  def new
    if self.class.object_class == Article
      @instance_object = Article.new
    else
      @instance_object = self.class.object_class.new(permitted_params)
    end
  end
end
