module Vldt
  # Join multiple validators together and merge all of their errors.
  class Join < Validator
    def initialize (*validators)
      @validators = validators
    end

    def validate (object)
      errors = @validators.map { |v| v.validate(object) }

      if errors.any?
        errors.compact.inject(Hash.new([])) do |es, e|
          e.each do |k, v|
            es[k] += v
          end

          es
        end
      end
    end
  end
end
