# From enebo: https://gist.github.com/enebo/5423151 Thanks! :)
#
# Here is a rewritten version of readmore with annotated comments tailored towards explaining what I changed.
# I did not test this but thought 

# in Ruby 1.9+ rubygems is always required by default so it should not be needed here.

module Awestruct
  module Extensions
    module ReadMore
      # Don't know why "" was in here I think that would always return 0 to index and work immediately.
      DELIMETERS = ["pass::[<!-- more -->]","<!-- more -->","<!--more-->","&lt;!-- more --&gt;"]

      def truncate(content)
        DELIMETERSS.map { |delim| content.index(delim) }.each do |index| 
          return content[0...i] if i  # notice three dots excludes ith index
        end
        content  # return usually left off for last expression in method by convention
      end

      # I am unclear what this is for (not in blog entry) but your gsub would essential copy/dup the string
      def filter(content)
        content.dup # Do you need a new string here?
      end
    end
  end
end


=begin
module Awestruct
  module Extensions
    module ReadMore
      def truncate(content)
        index = content.index("pass::[more]")
        if index != nil
            if index > -1
                return content[0..index-1]
            end
        end
        return content
      end 
      def filter(content)
        index = content.index("pass::[more]")
        if index != nil
            if index > -1
                content[index..index+11]= ""
            end
        end
        content
      end
    end
  end
end
=end
