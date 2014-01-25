require "i18n"

I18n.load_path += Dir.glob(File.join(File.dirname(__FILE__), "..", "..", "locales", "*.yml"))

module Vldt
  # i18n integration for vldt
  class I18n
    # Default options for the {I18n.t} call
    I18N_OPTIONS = { default: false, exception_handler: -> (*args) { false } }

    # Add translated error messages to the errors.
    #
    # @example
    #   Vldt::I18n.t({ [:user, :name] => [{ type: :string_length_greater_than, params: { min: 5 } }] })
    #   # This will try to look up from top to bottom
    #   # - user.name.string_length_greater_than
    #   # - name.string_length_greater_than
    #   # - string_length_greater_than
    #   # - vldt.errors.string_length_greater_than
    #   # And pass the { min: 5 } to all of them for interpolation
    # @example Usage with a namespace
    #   Vldt::I18n.t({ [] => [{ type: :between, { min: 2, max: 5 } }]}, namespace: "my.app")
    #   # This will try to look up
    #   # - my.app.between
    #   # - vldt.errors.between
    # @param result The result of a validation
    # @return The result with added :message keys
    def self.t (result, namespace: nil)
      with_messages = result.map do |selector, errors|
        new_errors = errors.map do |error|
          e = error.dup
          options = I18N_OPTIONS.merge(e[:params])

          scopes(selector, namespace).each do |scope|
            options[:scope] = scope

            message = ::I18n.t(e[:type], options)

            if message
              e[:message] = message

              break
            end
          end

          e
        end

        [selector, new_errors]
      end

      Hash[with_messages]
    end

    private
    def self.scopes (selector, namespace)
      default = ["vldt.errors"]
      path = selector.select { |o| o.is_a?(Symbol) }

      paths = (0..path.length).to_a.map do |offset|
        p = [namespace] + path.last(path.length - offset)

        p.compact.join(".")
      end

      paths + default
    end
  end
end
