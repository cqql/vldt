describe Vldt::DSL do
  helper = Class.new do
    include Vldt::DSL

    def user

    end
  end

  let(:validation) { helper.user }

  it "should create a validation" do
    expect(validation.validate({ name: "cqql#", password: "123" }))
  end
end
