module Actions::Update
  def update
    instance_object.assign_attributes(permitted_params)
    return render :new unless instance_object.save
    run_translator_worker(instance_object: instance_object)
    redirect_to article
  end
end
