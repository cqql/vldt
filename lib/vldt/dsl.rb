module Vldt
  module DSL
    include DSL::Composition
    include DSL::Walk
    include DSL::Basic
    include DSL::Number
    include DSL::String
    include DSL::Array
    include DSL::Length
  end
end
