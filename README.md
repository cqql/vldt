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
class CarValidation
  include Vldt::DSL

  def car
    join(
      validate(:driver, person),
      validate(:passengers, each(person)),
      validate(:tires, each(tire)))
  end

  def person
    join(
      validate(:name, chain(
        string,
        length_between(4, 10))),
      validate(:age, chain(
        number,
        whole_number,
        positive)))
  end

  def tire
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
