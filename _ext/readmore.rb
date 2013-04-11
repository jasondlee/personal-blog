require 'rubygems'

module Awestruct
  module Extensions
    module ReadMore
      def truncate(content)
        delims = ["pass::[more]","pass::[<!-- more -->]","<!-- more -->","<!--more-->","&lt;!-- more --&gt;"]
        delims.each do |delim|
            index = content.index(delim)
            if index != nil
                if index > -1
                    return content[0..index-1]
                end
            end
        end
        return content
      end 
      def filter(content)
        return content.gsub("pass::[more]", "")
      end
    end
  end
end
