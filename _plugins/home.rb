module Jekyll

  class HomePage < Page
    def initialize(site, base, lang)
      @site = site
      @base = base
      @dir = lang
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'home.html')
      self.data['lang'] = lang
      self.data['title'] = site.data['title']
      self.data['_id'] = 'home'
      self.data['type'] = 'pages'
    end
  end

  class HomePageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'home'
        site.data['navigation']['langs'].each do |lang|
          site.pages << HomePage.new(site, site.source, lang)
        end
      end
    end
  end

end
