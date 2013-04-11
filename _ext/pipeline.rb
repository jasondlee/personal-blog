require 'truncate'
require 'erubis'
require 'tilt'
 
#Tilt.mappings.delete("html")

Awestruct::Extensions::Pipeline.new do
  extension Awestruct::Extensions::Posts.new( '/posts', :posts)
  extension Awestruct::Extensions::Indexifier.new
  extension Awestruct::Extensions::Paginator.new( :posts, '/index', :per_page => 5 )

  helper Awestruct::Extensions::Partial
  helper Awestruct::Extensions::Truncate
end

