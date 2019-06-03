module TranslationService
  module Workers
    class UpdateGermanDescriptionWorker
      include Sidekiq::Worker

      def perform(content_id)
        @content = Content.find content_id
        @content.update_attributes(description_de: get_de_translation)
      end

      private

      def get_de_translation
        ::TranslationService::MicrosoftManager.translate(content: @content.description)
      end
    end
  end
end
