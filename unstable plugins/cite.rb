module Jekyll
  class CiteTag < Liquid::Tag
    def render(context)

      # @markup is a Liquid token so, we convert it to string
      # then we remove spaces before and after
      caption = @markup.to_s.strip
      site = context.registers[:site]
      posts = site.collections['posts'].docs
      page = context.registers[:page]

      if defined? page['lang'] and !page['lang'].nil? then
        # if current page has a lang front matter variable set (or a default)
        currentLang = page['lang']
      elsif defined? site.config['lang']
        # if no lang is defined in current page, fallback to site.lang
        currentLang = site.config['lang']
      else
        # if no site.lang is available we raise an error
        raise "No default 'lang' option defined in _config.yml"
      end

      # create a new array with posts selected on currentLang and caption variable
      selectedPosts = posts.select do |post|
        postLang = post.data['lang']
        postCaption = post.data['caption']
        sameLang = postLang == currentLang
        sameCaption = postCaption == caption
        sameLang and sameCaption
      end

      # select first post
      post = selectedPosts.first

      # print the link
      link = "<a href=\"#{site.baseurl}#{post.url}\" class=\"#{post.data['kind']}\" title=\"#{post.data['title']}\">#{post.data['title']}</a>"

    end
  end
end

Liquid::Template.register_tag('cite', Jekyll::CiteTag)