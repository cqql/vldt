describe Vldt::Array do
  describe "#array" do
    let(:v) { Vldt::Array.array }

    it "should fail if the object is not an array" do
      expect(v.call("hi")).to eq({ [] => [[:array, {}]] })
    end

    it "should succeed if the object is an array" do
      expect(v.call([1, :t])).to eq nil
    end
  end

  describe "#length" do
    let(:v) { Vldt::Array.length(2) }

    it "should fail if the array is not of the required length" do
      expect(v.call([])).to eq({ [] => [[:array_length, { value: 2 }]]})
    end

    it "should succeed if the array is of the required length" do
      expect(v.call([1, 5])).to eq nil
    end
  end

  describe "#length_between" do
    let(:v) { Vldt::Array.length_between(2, 5) }

    it "should fail if the length is greater than the maximum" do
      expect(v.call((1..10).to_a)).to eq({ [] => [[:array_length_between, { min: 2, max: 5 }]] })
    end

    it "should fail if the length is less than the minimum" do
      expect(v.call([1])).to eq({ [] => [[:array_length_between, { min: 2, max: 5 }]] })
    end

    it "should succeed if the length is in the required range" do
      expect(v.call("abc")).to eq nil
    end
  end

  describe "#length_greater_than" do
    let(:v) { Vldt::Array.length_greater_than(2) }

    it "should fail if the array is of less than the required length" do
      expect(v.call("hi")).to eq({ [] => [[:array_length_greater_than, { min: 2 }]] })
    end

    it "should succeed if the array is of greater than the required length" do
      expect(v.call([0, 3, 4])).to eq nil
    end
  end

  describe "#length_less_than" do
    let(:v) { Vldt::Array.length_less_than(2) }

    it "should fail if the object is of greater than the required length" do
      expect(v.call([true, false])).to eq({ [] => [[:array_length_less_than, { max: 2 }]] })
    end

    it "should succeed if the object is of less than the required length" do
      expect(v.call("x")).to eq nil
    end
  end
end
