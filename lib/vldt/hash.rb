module Vldt
  class Hash
    # This is called {#is_hash}, so that it does not overwrite {#hash}
    def self.is_hash
      Predicate.new(:hash, {}) { |o| o.is_a?(::Hash) }
    end
  end
end
