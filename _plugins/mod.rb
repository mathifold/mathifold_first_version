##
# Monkey patch Jekyll's Page and Post classes.
module Jekyll
	class Site
		def get_from_lang(col,hash,lang)
			if not lang
				return col
			end
			if not self.data[hash]
				self.data[hash]={}
				col.each do |p|
					if p.data['lang']
						if not self.data[hash][p.data['lang']]
							self.data[hash][p.data['lang']]=[]
						end
						self.data[hash][p.data['lang']] << p
					end
				end
			end
			return self.data[hash][lang]
		end
		def pages_lang(lang)
			return get_from_lang(self.pages, 'pages_lang',lang)
		end
		def posts_lang(lang)
			return get_from_lang(self.posts, 'posts_lang',lang)
		end
	end

	class Page
		def ancestors
			if not self.data['ancestors']
				self.data['ancestors']=get_ancestors(self)
			end
			return self.data['ancestors']
		end
		def siblings
			if not self.data['siblings']
				self.data['siblings']=get_siblings(self)
			end
			return self.data['siblings']
		end
		def translations
			if not self.data['translations']
				self.data['translations']=get_translations(self,site.pages)
			end
			return self.data['translations']
		end
		def childrens
			get_childrens(self)
		end
		def parent
			get_parent(self)
		end

		def to_liquid(attrs = ATTRIBUTES_FOR_LIQUID)
			super(attrs + %w[
				ancestors translations parent
			])
			#siblings childrens
		end
	end

	class Post
	    def archives
			if self.categories.size==0 or not self.data.key? 'lang'
				return nil
			end
			return site.data['nav']['archives'][self.data['lang']][self.categories[0]]
	    end
		def ancestors
			if not self.data['ancestors']
				a=self.archives
				if a 
					r=get_ancestors(a)
					r << a
					return r
				end
				self.data['ancestors']=get_ancestors(self)
			end
			return self.data['ancestors']
		end
		def siblings
			if not self.data['siblings']
				self.data['siblings']=get_siblings(self)
			end
			return self.data['siblings']
		end
		def translations
			if not self.data['translations']
				self.data['translations']=get_translations(self,site.posts)
			end
			return self.data['translations']
		end
		def parent
			if not self.data['parent']
				if self.data['lang'] and self.categories.size >0 then
					cat=self.categories[0]
					pgs=site.pages_lang(self.data['lang'])
					pgs.each do |p|
						if p.data['cat'] == cat
							self.data['parent']=p
							return p
						end
					end
				end
				self.data['parent']=get_parent(self)
			end
			return self.data['parent']
		end

		def to_liquid(attrs = ATTRIBUTES_FOR_LIQUID)
			super(attrs + %w[
				ancestors translations parent
			])
			#siblings
		end
	end
end

##
# Gets Page object that has given url. Very inefficient O(n) solution.
def get_page_from_url(url,col)
	col.each do |page|
		return page if page.url == url
	end
	return nil
end
##
# Gets Page object that has given path. Very inefficient O(n) solution.
def get_pages_from_path(path,col)
	a = []
	col.each do |page|
		if page.data['title']
			pt = page.url.split("/")
			fl=pt[-1]
			if pt[0..-2].join("/") == path and fl != "index.html"
				a << page
			elsif pt[0..-3].join("/") == path and fl=="index.html"
				a << page
			end 
		end
	end
	return a
end

##
# Returns ordered list 
def get_ancestors(_p)
	a=[]
	p=_p
	while p.parent
		a << p.parent
		p=p.parent
	end
	a.reverse!
	return a
end

def get_parent(p)
	url=p.url
	while url != "/index.html"
		pt = url.split("/")
		if pt[-1] != "index.html"
			# to to directory index
			pt[-1] = "index.html"
			url = pt.join("/")
		else
			# one level up
			url = pt[0..-3].join("/") + "/index.html"
		end
		r=get_page_from_url(url,site.pages_lang(p.data['lang']))
		if r and r.url
			return r
		end 
	end
	return nil
end

##
# Returns list 
def get_translations(me,col)
	if not me.data.key? '_id'
		return []
	end
	i=me.data['_id']
	a = []
	col.each do |p|
		if p.data.key? '_id' and p.data['_id']=i
			a << p
		end
	end
	return a
end

##
# Returns list 
def get_childrens(p)
	pt = p.url.split("/")
	if pt[-1] != "index.html"
		return []
	end
	return get_pages_from_path(pt[0..-2].join("/"),(site.pages_lang(p.data['lang']) + site.posts_lang(p.data['lang'])))
end

##
# Returns list 
def get_siblings(p)
	pt = p.url.split("/")
	fl=pt[-1]
	if fl == "index.html"
		return get_pages_from_path(pt[0..-3].join("/"),(site.pages_lang(p.data['lang']) + site.posts_lang(p.data['lang'])))
	else
		return get_pages_from_path(pt[0..-2].join("/"),(site.pages_lang(p.data['lang']) + site.posts_lang(p.data['lang'])))
	end
end
