module Paperclip::Imgix
  class UrlGenerator < Paperclip::UrlGenerator
    def initialize(attachment)
      @attachment = attachment
    end

    def for(style_name, options)
      if style_name == :original || options[:is_path_interpolation]
        super
      else
        style = @attachment.options[:imgix_styles][style_name]
        if style
          @attachment.options[:imgix].url(@attachment, style, options)
        else
          super
        end
      end
    end
  end
end
