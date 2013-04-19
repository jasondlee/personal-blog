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
        return content.gsub("pass::[more]", "")
      end
    end
  end
end
