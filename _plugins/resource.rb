module Jekyll
  class Resource < Liquid::Tag
    def get_file(site)
    	r=site.data['resources'][@text]
    	if r and r['file']
    		return r['file'], r
    	end
    	s='/'+@text
    	site.get_resources.each do |f|
    		if f.path.end_with?(s)
				if r
					r['file'] = f
				end
    			return f, r
    		end
    	end
    	return nil
    end
    
    def get_field(hash,field)
    	if not hash
    		return ""
    	end
    end

    def initialize(tag_name, text, tokens)
      super
      @text = text.strip
    end

    def render(context)
    	site = context.registers[:site]
    	f, r=get_file(site)
    	if f.nil?
    		return "<p>#{@text} not found!!</p>"
    	end
    	url = f.path.sub(site.source,"")

    	if f.extname =~ /^\.(svg|png|jpeg|jpg|gif)$/
    		return "<img src=\"#{url}\" id=\"#{@text}\" title=\"\" alt=\"\" />"
    	end
    	if f.extname =~ /^\.(mp4)$/
    		r = f.extname[1..-1]
    		return "<video width=\"900\" controls id=\"#{@text}\"><source src=\"#{url}\" type=\"video/#{r}\"></video>"
    	end
    	return "#{@text} is not a resource"
    end
  end
end

Liquid::Template.register_tag('resource', Jekyll::Resource)
