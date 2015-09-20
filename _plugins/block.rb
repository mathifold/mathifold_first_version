module Jekyll

  class BlockPage < Page
    def initialize(site, base, block, lang)
      @site = site
      @base = base
      @dir = File.join(lang, block[lang]['slug'])
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'block.html')
      self.data['lang'] = lang
      self.data['title'] = block[lang]['text']
      self.data['block'] = block['id']
      self.data['_id'] = block['id']
      self.data['type'] = 'pages'
    end
  end

  class BlockPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'block'
        site.data['navigation']['langs'].each do |lang|
          site.data['navigation']['blocks'].each do |block|
               site.pages << BlockPage.new(site, site.source, block, lang)
          end
        end
      end
    end
  end

end
