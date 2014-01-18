module Vldt
  module Common
    def join (*validations)
      Vldt::Join.new(*validations)
    end

    def chain (*validations)
      Vldt::Chain.new(*validations)
    end

    def optional (validation)
      Vldt::Optional.new(validation)
    end

    def with (block, validation)
      Vldt::With.new(block, validation)
    end

    def validate (key, validation)
      Vldt::Validate.new(key, validation)
    end

    def each (*validations)
      Vldt::Each.new(*validations)
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

    def one_of (*collection)
      Vldt::OneOf.new(*collection)
    end

    def none_of (*collection)
      Vldt::NoneOf.new(*collection)
    end

    extend(self)
  end
end
