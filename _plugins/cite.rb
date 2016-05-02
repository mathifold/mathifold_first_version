module Jekyll
  class Cite < Liquid::Tag
    def render(context)
    	aux = site.posts
    	return aux
    end
  end
end

Liquid::Template.register_tag('cite', Jekyll::Cite)
