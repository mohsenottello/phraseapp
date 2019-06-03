class ApplicationController < ActionController::Base
  include ApplicationHelper

  def run_translator_worker(instance_object:)
    TranslationService::Workers::UpdateGermanDescriptionWorker.perform_async(instance_object.id)
  end
end
