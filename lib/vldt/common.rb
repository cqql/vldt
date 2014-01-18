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

    # Validate, that an object is nil.
    def absent
      Predicate.new(:absent, &:nil?)
    end

    # Validate, that an object is not nil.
    def present
      Predicate.new(:present) { |o| !o.nil? }
    end

    # Validate the equality (`==`) of the object with a value.
    def equal (value)
      Predicate.new(:equals, value: value) { |o| o == value }
    end

    # Validates that the object equals (`eql?`) a value.
    def eql (value)
      Predicate.new(:eqls, value: value) { |o| value.eql?(o) }
    end

    # Validates that object and value are identical (`equal?`).
    def identical (value)
      Predicate.new(:identical, value: value) { |o| value.equal?(o) }
    end

    # Validate, that an object is an instance of a class.
    def is_a (klass)
      Predicate.new(:is_a, class: klass) { |o| o.is_a?(klass) }
    end

    # Validates that object is included in a list of values.
    def one_of (*values)
      Predicate.new(:one_of, values: values) { |o| values.any? { |v| v == o } }
    end

    def none_of (*collection)
      Vldt::NoneOf.new(*collection)
    end

    extend(self)
  end
end
