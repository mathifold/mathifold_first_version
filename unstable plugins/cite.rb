module Jekyll
  class Cite < Liquid::Tag
    def render(context)
    	caption = ????????
    	aux = site.posts | where: "lang", page.lang | where: "caption", "#{@caption}" | first
    	return <a href="{{aux.cleanurl}}" class="{{aux.kind}}" title="{{aux.title}}"></a>
    end
  end
end

Liquid::Template.register_tag('cite', Jekyll::Cite)
