describe Vldt::Common do
  v = Class.new do
    extend Vldt::Common

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
    expect(v.user.call({ name: "cqql#", email: "1@3", age: -3.3 })).to eq({
      [:name] => [{ type: :length_greater_than, params: { min: 6 } }],
      [:age] => [{ type: :integer, params: {} }, { type: :positive, params: {} }]
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

    expect(v.recipe.call(recipe)).to eq({
      [:user, :email] => [{ type: :present, params: {} }],
      [:title] => [{ type: :string, params: {} }],
      [:ingredients] => [{ type: :array_length_greater_than, params: { min: 2 } }],
      [:ingredients, 0, :unit] => [{ type: :present, params: {} }],
      [:ingredients, 1, :name] => [{ type: :one_of, params: { values: ["Rice", "Tomato", "Potato"] } }]
    })
  end
end
