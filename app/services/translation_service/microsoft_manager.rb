module TranslationService
  module MicrosoftManager

    def self.translate(content:)
      # I cannot find any solution to find free credential for microsoft or amazon
      # So instead of following line, I returend same content
      # MICROSOFT_TRANSLATOR.translate(content, to: :de)
      content
    end

  end
end
