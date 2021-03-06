# vldt

Easily create validations to validate any input data independent from
the structure of your models or your database layout.

This is inspired by the clojure libary [vlad](https://github.com/logaan/vlad).

## Usage

Let's dive right in with an example. We want to validate a car.

```ruby
car = {
  driver: { age: 15 },
  passengers: [
    { name: "Peter Parker", age: 25 },
    { name: "Yoda", age: 980 }
  ],
  tires: [
    { condition: "happy", used_since: "2013-01-12" },
    { condition: "good", used_since: "2012-11-12" },
    { condition: "good", used_since: "2012" },
    { condition: "bad" }
  ]
}
```

```ruby
module CarValidation
  extend Vldt::Common
  S = Vldt::String
  N = Vldt::Number
  A = Vldt::Array

  def self.car
    join(
      validate(:driver, person),
      validate(:passengers, chain(
        A.array,
        join(
          A.length_between(0, 3),
          each(person)))),
      validate(:tires, chain(
        A.array,
        join(
          A.length(4),
          each(tire)))))
  end

  def self.person
    join(
      validate(:name, chain(
        S.string,
        S.length_between(4, 10))),
      validate(:age, chain(
        N.number,
        N.integer,
        N.positive)))
  end

  def self.tire
    join(
      validate(:condition, one_of("good", "bad")),
      validate(:used_since, chain(
        present,
        with(-> date { Date.parse(date) },
          greater_than(Date.new(2013, 1, 6))))))
  end
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem "vldt"
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install vldt
```

## Contributing

1. [Fork it](https://github.com/CQQL/vldt/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
