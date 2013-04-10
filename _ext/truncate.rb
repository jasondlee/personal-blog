require 'rubygems'

module Awestruct
  module Extensions
    module Truncate
      def truncate(content)
        #puts "truncate! #{content}"
        #index = content.index("pass::[&lt;!-- more -&#8594;]")
        #puts "index = #{index}"
        #if index == -1
        index = content.index("pass::[more]")
        #end
        puts "index = '#{index}'"
          
        if index != nil 
          if index > -1
            return content[0..index-1]
          end
        end
        return content
      end 
    end
  end
end
