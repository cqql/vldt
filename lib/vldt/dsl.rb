module Vldt
  module DSL
    def join (validations)
      Vldt::Join.new(validations)
    end

    def chain (validations)
      Vldt::Chain.new(validations)
    end

    def optional (validation)
      Vldt::Optional.new(validation)
    end

    def absent
      Vldt::Absent.new
    end

    def present
      Vldt::Present.new
    end

    def equal (value)
      Vldt::Equal.new(value)
    end

    def eql (value)
      Vldt::Eql.new(value)
    end

    def identical (value)
      Vldt::Identical.new(value)
    end

    def is_a (klass)
      Vldt::IsA.new(klass)
    end

    def one_of (collection)
      Vldt::OneOf.new(collection)
    end

    def none_of (collection)
      Vldt::NoneOf.new(collection)
    end

    def match (pattern)
      Vldt::Match.new(pattern)
    end
  end
end
