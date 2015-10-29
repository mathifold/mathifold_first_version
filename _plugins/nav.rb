# encoding: utf-8

module Jekyll

  class HomePage < Page
    def initialize(site, lang)
      @site = site
      @base = site.source
      @dir = lang
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(@base, '_layouts'), 'home.html')
      self.data['lang'] = lang
      self.data['title'] = (site.data['title'] or 'Mathifold')
      self.data['_id'] = 'home'
      self.data['type'] = 'pages'
      self.data['class']='home'
    end
  end

  class NavPage < Page
    def initialize(site, lang, title, dir, id, layout, cat, _class)
      @site = site
      @base = site.source
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(@base, '_layouts'), layout + ".html")
      self.data['lang'] = lang
      self.data['title'] = title
      self.data['type'] = 'pages'
      self.data['_id'] = id
      self.data['cat'] = cat
      self.data['class']=(_class or "none")
    end
  end


  class NavPageGenerator < Generator
    safe true

    def generatechildrens(site,_nav, parent_id,parent_dirs,childrens)
      count=1
      childrens.each do |item|
        _id=parent_id+"/"+count.to_s
        count=count+1
        layout = item['layout'] || "block"
        _dirs=parent_dirs
        if layout != "none"
            _dirs={}
        	item['pages']=[]
			_nav['langs'].each do |lang|
				title = item[lang]
				_dir = File.join(parent_dirs[lang], to_slug(title))
        		_dirs[lang]=_dir
        		_page=NavPage.new(site, lang, title, _dir, _id, layout, item['category'], item['class'])
				site.pages << _page
				item['pages'] << _page
				if item.key? 'category'
					(_nav['archives'][lang])[item['category']]=_page
				end
			end
		end
		if item.key? 'childrens'
			generatechildrens(site,_nav, _id, _dirs, item['childrens'])
		end
      end
    end

    def generate(site)
      _nav=site.data['nav']
      _nav['archives']={}
      _dirs={}
      _nav['langs'].each do |lang|
        site.pages << HomePage.new(site, lang)
        _dirs[lang]=lang
         _nav['archives'][lang]={}
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
