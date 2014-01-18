describe Vldt::Number do
  describe "#between" do
    let(:v) { Vldt::Number.between(-2, 5) }

    it "should fail if the number is out of range" do
      expect(v.validate(-6)).to eq({ [] => [[:between, { min: -2, max: 5 }]] })
    end

    it "should succeed if the number is in range" do
      expect(v.validate(3)).to eq nil
    end
  end

  describe "#integer" do
    let(:v) { Vldt::Number.integer }

    it "should fail if the number is not integral" do
      expect(v.validate(1.1)).to eq({ [] => [[:integer, {}]] })
    end

    it "should succeed if the number is integral" do
      expect(v.validate(4)).to eq nil
    end
  end

  describe "#odd" do
    let(:validation) { Vldt::Number.odd }

    it "should fail if the number is not odd" do
      expect(validation.validate(6)).to eq({ [] => [[:odd, {}]] })
    end

    it "should succeed if the number is odd" do
      expect(validation.validate(5)).to eq nil
    end
  end

  describe "#even" do
    let(:v) { Vldt::Number.even }

    it "should fail if the number is not even" do
      expect(v.validate(-3)).to eq({ [] => [[:even, {}]] })
    end

    it "should succeed if the number is even" do
      expect(v.validate(4)).to eq nil
    end
  end

  describe "#number" do
    let(:v) { Vldt::Number.number }

    it "should fail if the object is not numeric" do
      expect(v.validate([])).to eq({ [] => [[:number, {}]] })
    end

    it "should succeed if the object is numeric" do
      expect(v.validate(5.3)).to eq nil
    end
  end

  describe "#positive" do
    let(:v) { Vldt::Number.positive }

    it "should fail if the number is negative" do
      expect(v.validate(-2.2)).to eq({ [] => [[:positive, {}]] })
    end

    it "should fail if the number is zero" do
      expect(v.validate(0)).to eq({ [] => [[:positive, {}]] })
    end

    it "should succeed if the number is positive" do
      expect(v.validate(2)).to eq nil
    end
  end

  describe "#not_positive" do
    let(:v) { Vldt::Number.not_positive }

    it "should fail if the number is positive" do
      expect(v.validate(2.2)).to eq({ [] => [[:not_positive, {}]] })
    end

    it "should succeed if the number is zero" do
      expect(v.validate(0)).to eq nil
    end

    it "should succeed if the number is negative" do
      expect(v.validate(-2)).to eq nil
    end
  end

  describe "#negative" do
    let(:v) { Vldt::Number.negative }

    it "should fail if the number is positive" do
      expect(v.validate(2.2)).to eq({ [] => [[:negative, {}]] })
    end

    it "should fail if the number is zero" do
      expect(v.validate(0)).to eq({ [] => [[:negative, {}]] })
    end

    it "should succeed if the number is negative" do
      expect(v.validate(-2)).to eq nil
    end
  end

  describe "#not_negative" do
    let(:v) { Vldt::Number.not_negative }

    it "should fail if the number is negative" do
      expect(v.validate(-2.2)).to eq({ [] => [[:not_negative, {}]] })
    end

    it "should succeed if the number is zero" do
      expect(v.validate(0)).to eq nil
    end

    it "should succeed if the number is positive" do
      expect(v.validate(2)).to eq nil
    end
  end
end
