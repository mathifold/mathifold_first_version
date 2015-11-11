# encoding: utf-8

module Jekyll

  class NavPage < Page
    def initialize(site, lang, title, dir, langid, layout, _class, cat)
      @site = site
      @base = site.source
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(@base, '_layouts'), layout + ".html")
      self.data['lang'] = lang
      self.data['title'] = title
      self.data['langid'] = langid
      self.data['type'] = 'pages'
      self.data['class']=(_class or "none")
      if cat
      	self.data['cat'] = cat
      end
    end
  end

  class NavPageGenerator < Generator
    safe true

    def generatechildrens(site,_nav, parent_id,parent_dirs,childrens)
      count=1
      childrens.each do |item|
        _id=(parent_id+"_"+count.to_s)
        count=count+1
        layout = item['layout']
        if not layout and item['category']
        	layout="block"
        end
        _dirs=parent_dirs
        if layout
            _dirs={}
        	item['pages']=[]
			_nav['langs'].each do |lang|
				title = item[lang]
				_dir = File.join(parent_dirs[lang], to_slug(title))
        		_dirs[lang]=_dir
        		_page=NavPage.new(site, lang, title, _dir, _id, layout, item['class'], item['category'])
				site.pages << _page
				item['pages'] << _page
			end
		end
		if item.key? 'childrens'
			generatechildrens(site,_nav, _id, _dirs, item['childrens'])
		end
      end
    end

    def generate(site)
      _nav=site.data['nav']
      _dirs={}
      _nav['langs'].each do |lang|
        site.pages << NavPage.new(site, lang, (site.data['title'] or 'Mathifold'),lang,'home','home','home',nil)
        _dirs[lang]=lang
      end
      generatechildrens(site,_nav,'home',_dirs,_nav['map'])
    end
    
    def to_slug(_s)
    	s=_s.gsub(/á/i,"a")
    	s.gsub!(/é/i,"e")
    	s.gsub!(/í/i,"i")
    	s.gsub!(/ó/i,"o")
    	s.gsub!(/(ú|ü)/i,"u")
    	s.gsub!(/ñ/i,"n")
    	s.gsub!(/ +(y|and|de|of) +/i," ")
    	s.gsub!(/[^ \w]+/,"")
    	s.strip!
    	s.gsub!(/ +/,"-")
    	s.downcase!
    	return s
    end

  end

end
