require 'readmore'
require 'erubis'
require 'tilt'
 
#Tilt.mappings.delete("html")

Awestruct::Extensions::Pipeline.new do
  extension Awestruct::Extensions::Posts.new( '/posts', :posts)
  extension Awestruct::Extensions::Indexifier.new
  extension Awestruct::Extensions::Paginator.new( :posts, '/index', :per_page => 5 )
  extension Awestruct::Extensions::Atomizer.new( :posts, '/feed.atom', :feed_title=>'Steeplesoft' )
  extension Awestruct::Extensions::TagCloud.new( :tagcloud, '/index')
  extension Awestruct::Extensions::Tagger.new( :posts, '/index', '/blog/tags', :per_page => 5 )

  helper Awestruct::Extensions::Partial
  helper Awestruct::Extensions::ReadMore
end

