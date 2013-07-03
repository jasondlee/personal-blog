require 'readmore'
require 'tagatomizer'
require 'erubis'
require 'tilt'
require 'zurb-foundation'
 
#Tilt.mappings.delete("html")

Awestruct::Extensions::Pipeline.new do
  extension Awestruct::Extensions::Posts.new( '/posts', :posts)
  extension Awestruct::Extensions::Paginator.new( :posts, '/index', :per_page => 10 )
  extension Awestruct::Extensions::Tagger.new( :posts, '/index', '/posts/tags', :per_page => 10)
  extension Awestruct::Extensions::TagCloud.new( :tagcloud, '/posts/tags/index.html', :layout=>'base', :title=>'Tags')
  extension Awestruct::Extensions::Disqus.new

  extension Awestruct::Extensions::Indexifier.new
  extension Awestruct::Extensions::Atomizer.new( :posts, '/feed.atom', :feed_title=>'Steeplesoft' )
  #extension Awestruct::Extensions::TagAtomizer.new( :posts, '/index', '/posts/tags', :per_page => 10)

  helper Awestruct::Extensions::Partial
  helper Awestruct::Extensions::ReadMore
  helper Awestruct::Extensions::GoogleAnalytics
end

