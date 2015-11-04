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
    
    def get_attr(r,lang)
    	foot=nil
    	s=""
    	if not r
    		return s,foot
    	end
    	if lang and r[lang]
			l=r[lang]
    		%w[alt title parent longdesc].each do |a|
				if l[a]
					s=s+a+"=\""+l[a]+"\" ";
				end
    		end
    		foot=l['foot']
    	end
    	
		%w[height width].each do |a|
			if r[a]
				s=s+a+"=\""+r[a]+"\" ";
			end
		end
		
		return s,foot
    end

    def render(context)
    	site = context.registers[:site]
    	page = context.registers[:page]
    	f, r=get_file(site)
    	if f.nil?
    		return "<p>#{@text} not found!!</p>"
    	end
    	url = f.path.sub(site.source,"")
    	
    	att,foot=get_attr(r,page['lang'])

    	if f.extname =~ /^\.(svg|png|jpeg|jpg|gif)$/
    		return "<img src=\"#{url}\" id=\"#{@text}\" "+att+"/>"
    	end
    	if f.extname =~ /^\.(mp4)$/
    		r = f.extname[1..-1]
    		return "<video width=\"900\" controls id=\"#{@text}\" "+att+"><source src=\"#{url}\" type=\"video/#{r}\"></video>"
    	end
    	return "#{@text} is not a resource"
    end
  end
end

Liquid::Template.register_tag('resource', Jekyll::Resource)
