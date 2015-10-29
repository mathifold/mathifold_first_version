module Jekyll
    class PermalinkRewriter < Generator
        safe true
        priority :low

        def generate(site)
            site.posts.each do |item|
            	a=item.parent
            	if a and a.dir
            		item.data['permalink'] = '/' + item.data['lang'] + '/' + a.dir.split("/")[-1] + '/' + item.slug
            	else
                	item.data['permalink'] = '/' + item.data['lang'] + '/' + item.slug
            	end
            end
            site.pages.each do |item|
            	if not item.data['permalink'] and item.path.start_with?("_pages/")
            		n=item.path
            		n.slice!(0..5)
            		i=n

            		n=n.gsub(/\/\d+-/,"/")
            		n.slice!(0)
            		n=n.gsub(/ +/,"-")
            		n=n.sub(/\.[a-zA-Z]+$/,".html")

            		item.data['permalink'] = n

            		i=i.gsub(/\/index[^\/]+$/,'')
            		i=i.gsub(/(\/\d+)-[^\/]+/,'\1')
            	end
            	#if item.data['permalink']
            	#	item.data['permalink'].gsub!(/\/index.html$/,"")
            	#end
            end
        end
    end
end
