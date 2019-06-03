module ApplicationHelper
  def instance_object
    @instance_object ||= self.class.object_class.find params[:id]
  end
end
