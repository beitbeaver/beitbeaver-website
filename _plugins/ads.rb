module Jekyll

  $caption_font_size_percentage = 60
  $caption_text = "From The Beit Beaver's sponsors"

  $img_default_alt_text = "An advert from our sponsors"

  class AdFullBannerTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end # initialize

    def render(context)
      <<-MARKUP.strip
      <div>
        <img src="assets/images/ads/full-banner.gif" alt="#{$img_default_alt_text}">
        <p style="font-size: #{$caption_font_size_percentage}%;">#{$caption_text}</p>
      </div>
      MARKUP
    end # render
  end # class
end # module

Liquid::Template.register_tag('adfullbanner', Jekyll::AdFullBannerTag)
