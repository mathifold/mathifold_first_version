module Jekyll
  class Resource < Liquid::Tag
    def get_file(site)
    	if not site.data['resources'].key? @text
    		site.data['resources'][@text]={}
    	end
    	r=site.data['resources'][@text]
    	if r.key? 'file'
    		return r
    	end
    	s='/'+@text
    	name=s.sub(/\.[^\.]+$/,"")
    	site.get_resources.each do |f|
    		if f.path.end_with?(s)
				r['file'] = f
				break
    		end
    	end
    	site.data['_ori'].each do |f|
    		n=f.path.sub(/\.[^\.]+$/,"")
    		if n.end_with?(name)
				r['ori'] = f
				break
    		end
    	end
    	return r
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
    	r=get_file(site)
    	if r.nil?
    		return "<p>#{@text} not found!!</p>"
    	end
    	f=r['file']
    	o=r['ori']
    	url = f.path.sub(site.source,"")
    	
    	att,foot=get_attr(r,page['lang'])

		html=""
    	if f.extname =~ /^\.(svg|png|jpeg|jpg|gif)$/
    		html="<div class=\"resource img\"><img src=\"#{url}\" id=\"#{@text}\" "+att+"/>"
    	elsif f.extname =~ /^\.(mp4)$/
    		ext = f.extname[1..-1]
    		html="<div class=\"resource vid\"><video controls id=\"#{@text}\" "+att+"><source src=\"#{url}\" type=\"video/#{ext}\"></video>"
    	else
    		return "#{@text} is not a resource"
    	end
    	if o
    		url = o.path.sub(site.source,"")
    		html=html+"<a href=\""+url+"\" class=\"ori grey\"><span>"+site.data['t'][page['lang']]['fuente_img']+"</span></a>"
    	end
    	return html+"</div>"
    end
  end
end

Liquid::Template.register_tag('resource', Jekyll::Resource)
