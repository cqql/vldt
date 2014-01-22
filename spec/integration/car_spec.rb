describe "The car example" do
  module Validations
    extend Vldt::Common
    S = Vldt::String
    N = Vldt::Number
    A = Vldt::Array
    D = Vldt::Date

    def self.car
      join(
        validate(:driver, person),
        validate(:passengers,
          chain(
            A.array,
            join(
              A.length_between(0, 3),
              each(person)))),
        validate(:tires,
          chain(
            A.array,
            join(
              A.length(4),
              each(tire)))))
    end

    def self.person
      join(
        validate(:name,
          chain(
            S.string,
            S.length_between(4, 10))),
        validate(:age,
          chain(
            N.number,
            N.integer,
            N.positive)))
    end

    def self.tire
      join(
        validate(:condition, one_of("good", "bad")),
        validate(:used_since,
          D.with_date(
            D.date_after(Date.new(2013, 1, 6)))))
    end
  end

  it "Case 1" do
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
        { }
      ]
    }

    expect(Validations.car.call(car)).to eq({
        [:driver, :name] => [[:present, {}]],
        [:passengers, 0, :name] => [[:length_between, { min: 4, max: 10 }]],
        [:tires, 0, :condition] => [[:one_of, { values: ["good", "bad"] }]],
        [:tires, 1, :used_since] => [[:date_after, { date: Date.new(2013, 1, 6) }]],
        [:tires, 2, :used_since] => [[:date, {}]],
        [:tires, 3, :condition] => [[:present, {}]],
        [:tires, 3, :used_since] => [[:present, {}]]
      })
  end
end
