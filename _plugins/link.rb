module Jekyll
    class PermalinkRewriter < Generator
        safe true
        priority :low

        def generate(site)
            site.posts.each do |item|
                item.data['permalink'] = '/' + item.data['lang'] + '/' + item.slug
            end
        end
    end
end
