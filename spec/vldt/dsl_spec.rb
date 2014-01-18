describe Vldt::DSL do
  v = Class.new do
    extend Vldt::DSL

    S = Vldt::String
    A = Vldt::Array
    N = Vldt::Number

    def self.user
      join(
        validate(:name, chain(S.string, S.length_greater_than(6))),
        validate(:email, S.string),
        validate(:age, join(N.integer, N.positive)))
    end

    def self.ingredient
      join(
        validate(:name, chain(S.string, one_of("Rice", "Tomato", "Potato"))),
        validate(:amount, N.positive),
        validate(:unit, chain(S.string, S.length_between(3, 10))))
    end

    def self.recipe
      join(
        validate(:user, user),
        validate(:title, S.string),
        validate(:ingredients, chain(
          A.array,
          join(
            A.length_greater_than(2),
            each(ingredient)))))
    end
  end

  it "should validate a user" do
    expect(v.user.validate({ name: "cqql#", email: "1@3", age: -3.3 })).to eq({
      [:name] => [[:length_greater_than, { min: 6 }]],
      [:age] => [[:integer, {}], [:positive, {}]]
    })
  end

  it "should validate a recipe" do
    recipe = {
      user: {
        name: "username",
        age: 5
      },
      title: 5,
      ingredients: [
        {
          name: "Rice",
          amount: 20
        },
        {
          name: "Nail",
          amount: 10,
          unit: "pieces"
        }
      ]
    }

    expect(v.recipe.validate(recipe)).to eq({
      [:user, :email] => [[:present, {}]],
      [:title] => [[:string, {}]],
      [:ingredients] => [[:array_length_greater_than, { min: 2 }]],
      [:ingredients, 0, :unit] => [[:present, {}]],
      [:ingredients, 1, :name] => [[:one_of, { values: ["Rice", "Tomato", "Potato"] }]]
    })
  end
end
