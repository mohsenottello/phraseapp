module Actions::Create
  def create
    @instance_object = self.class.object_class.new(permitted_params)
    return render :new unless instance_object.save
    run_translator_worker(instance_object: instance_object)
    redirect_to article
  end
end
