module Jekyll

  $caption_text = "From the Beit Beaver's sponsors"
  $img_default_alt_text = "An advert from our sponsors"

  class AdFullBannerTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end # initialize

    def render(context)
      <<-MARKUP.strip
      <div class="ad-box">
        <img src="/assets/images/ads/full-banner.gif" alt="#{$img_default_alt_text}">
        <p class="ad-caption">#{$caption_text}</p>
      </div>
      MARKUP
    end # render
  end # class

  class AdLeaderboardTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end # initialize

    def render(context)
      <<-MARKUP.strip
      <div class="ad-box">
        <img src="/assets/images/ads/leaderboard.gif" alt="#{$img_default_alt_text}">
        <p class="ad-caption">#{$caption_text}</p>
      </div>
      MARKUP
    end # render
  end # class

  class AdSquareTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end # initialize

    def render(context)
      <<-MARKUP.strip
      <div class="ad-box">
        <img src="/assets/images/ads/square.gif" alt="#{$img_default_alt_text}">
        <p class="ad-caption">#{$caption_text}</p>
      </div>
      MARKUP
    end # render
  end # class

  class AdSkyscraperTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end # initialize

    def render(context)
      <<-MARKUP.strip
      <div class="ad-box">
        <img src="/assets/images/ads/skyscraper.gif" alt="#{$img_default_alt_text}">
        <p class="ad-caption">#{$caption_text}</p>
      </div>
      MARKUP
    end # render
  end # class

  class AdMiniSkyscraperTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end # initialize

    def render(context)
      <<-MARKUP.strip
      <div class="ad-box">
        <img src="/assets/images/ads/mini-skyscraper.gif" alt="#{$img_default_alt_text}">
        <p class="ad-caption">#{$caption_text}</p>
      </div>
      MARKUP
    end # render
  end # class
end # module

Liquid::Template.register_tag('ad_fullbanner', Jekyll::AdFullBannerTag)
Liquid::Template.register_tag('ad_leaderboard', Jekyll::AdLeaderboardTag)
Liquid::Template.register_tag('ad_square', Jekyll::AdSquareTag)
Liquid::Template.register_tag('ad_skyscraper', Jekyll::AdSkyscraperTag)
Liquid::Template.register_tag('ad_mini_skyscraper', Jekyll::AdMiniSkyscraperTag)
