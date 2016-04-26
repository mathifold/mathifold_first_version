module Jekyll
  class Resource < Liquid::Tag
    def render(context)
    	kind = context.kind
		html="<div>"
    	if f.extname =~ /(thm|lem)$/
    		html="<div class=\"resource img\"><img src=\"#{url}\" id=\"#{@text}\" "+att+"/>"
    	end
    	return html+"</div>"
    end
  end
end

Liquid::Template.register_tag('cite', Jekyll::Cite)
