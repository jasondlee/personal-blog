require 'rubygems'

module Awestruct
  module Extensions
    module Truncate
      def truncate(content)
        delims = ["pass::[more]","<!-- more -->","<!--more-->"]
        delims.each do |delim|
            index = content.index(delim)
            if index != nil
                if index > -1
                    return content[0..index-1]
                end
            end
        end
        #index = content.index("pass::[more]")
        #if index == nil
        #    index = content.index("<!-- more -->")
        #    if index == nil
        #      index = content.index("<!--more-->")
        #    end
        #end
          
        #if index != nil 
        #  if index > -1
        #    return content[0..index-1]
        #  end
        #end
        return content
      end 
    end
  end
end
