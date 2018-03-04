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

def get_ad_space_line(lines)
  second_triple_dash_line_index = 0

  # Find second set of triple dashes
  triple_dash_lines_found = 0
  for i in 0..(lines.length - 1) do
    if triple_dash_lines_found == 2
      second_triple_dash_line_index = i
      break
    end
    if lines[i][0..2] == '---'
      triple_dash_lines_found += 1
    end
  end

  paragraphs_seen = 0
  is_in_paragraph = false
  # Find and return blank line after second_paragraph
  for i in (second_triple_dash_line_index + 1)..(lines.length - 1) do
    if lines[i].strip.length == 0
      is_in_paragraph = false
    else
      if not is_in_paragraph
        paragraphs_seen += 1
        if paragraphs_seen == 3
          return i - 1
        end
        is_in_paragraph = true
      end
    end
  end

  return lines.length
end # get_ad_space_line

def process_file(filename)
  lines = IO.readlines(filename)
  ad_space_line = get_ad_space_line(lines)
  new_lines = Array.new(lines.length + 1)
  new_lines[0..ad_space_line] = lines[0..ad_space_line]
  new_lines[ad_space_line + 1] = "{% ad_square %}\n\n"
  new_lines[(ad_space_line + 2)..(lines.length + 1)] = lines[(ad_space_line + 1) .. (lines.length - 1)]

  temp_file = File.new("temp.md", "w")
  new_lines.each do |new_line|
    temp_file.syswrite(new_line)
  end
  temp_file.close

  `mv temp.md #{filename}`

end # process_file

def get_ad_line(lines)
  for i in 0..lines.length do
    if lines[i] == "{% ad_square %}\n"
      return i
    end
  end
  return 0
end

def unprocess_file(filename)
  lines = IO.readlines(filename)
  ad_line = get_ad_line(lines)
  new_lines = Array.new(lines.length - 2)
  new_lines[0..(ad_line - 1)] = lines[0..(ad_line - 1)]
  new_lines[(ad_line)..(lines.length - 3)] = lines[(ad_line + 2) .. (lines.length - 1)]

  temp_file = File.new("temp.md", "w")
  new_lines.each do |new_line|
    temp_file.syswrite(new_line)
  end
  temp_file.close

  `mv temp.md #{filename}`
end

def inject_post_square_ads()
  Dir.foreach("_posts") do |post_file_name|
    if /.md/.match post_file_name
      process_file("_posts/#{post_file_name}")
    end # if
  end # foreach _posts
end # call_ls

Jekyll::Hooks.register :site, :after_init do |site|
  #inject_post_square_ads()
end

Jekyll::Hooks.register :site, :post_write do |site|
  # Dir.foreach("_posts") do |post_file_name|
  #   if /.md/.match post_file_name
  #     unprocess_file("_posts/#{post_file_name}")
  #   end # if
  # end
end
