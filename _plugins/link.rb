module Jekyll
    class PermalinkRewriter < Generator
        safe true
        priority :low

        def generate(site)
            site.posts.each do |p|
            	a=p.parent
            	if a and a.dir
            		p.data['permalink'] = '/' + p.data['lang'] + '/' + a.dir.split("/")[-1] + '/' + p.slug
            	else
                	p.data['permalink'] = '/' + p.data['lang'] + '/' + p.slug
            	end
            end
            site.pages.each do |p|
            	if not p.data['permalink'] and p.path.start_with?("_pages/")
            		n=p.path
            		n.slice!(0..5)
            		i=n

            		n=n.gsub(/\/\d+-/,"/")
            		n.slice!(0)
            		n=n.gsub(/ +/,"-")
            		n=n.sub(/\.[a-zA-Z]+$/,".html")

            		p.data['permalink'] = n

            		i=i.gsub(/\/index[^\/]+$/,'')
            		i=i.gsub(/(\/\d+)-[^\/]+/,'\1')
            	end
            	#if p.data['permalink']
            	#	p.data['permalink'].gsub!(/\/index.html$/,"")
            	#end
            	#if not p.data['permalink'] and p.name == "index.html"
            	#	p.data['permalink'] = p.dir
            	#end
            	#if p.data['permalink'] and p.data['permalink'].end_with?("/")
            	#	p.data['permalink'].chomp!("/")
            	#end
            end
        end
    end
end
