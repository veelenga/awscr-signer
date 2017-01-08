module Awscr
  module Signer
    module Presigned
      # a field in a `Presigned::Post`
      abstract class PostField
        include Comparable(PostField)

        getter key
        getter value

        def initialize(@key : String, @value : Array(String))
        end

        def initialize(@key : String, @value : Array(Int32))
        end

        abstract def serialize

        def <=>(field : PostField)
          if @key == field.key && @value == field.value
            0
          else
            -1
          end
        end
      end

      # A field in the `Post` object
      class EqualField < PostField
        def serialize
          {@key => @value.join}
        end
      end
    end
  end
end