describe Vldt::Common do
  describe "#absent" do
    let(:v) { Vldt::Common.absent }

    it "should succeed if the object is nil" do
      expect(v.validate(nil)).to eq nil
    end

    it "should fail if the object is not nil" do
      expect(v.validate(true)).to eq({ [] => [[:absent, {}]] })
    end
  end

  describe "#present" do
    let(:v) { Vldt::Common.present }

    it "should succeed if object is not nil" do
      expect(v.validate(1)).to eq nil
    end

    it "should fail if the object is nil" do
      expect(v.validate(nil)).to eq({ [] => [[:present, {}]] })
    end
  end

  describe "#equal" do
    let(:v) { Vldt::Common.equal(10) }

    it "should succeed if the object equals the configured value" do
      expect(v.validate(10)).to eq nil
    end

    it "should fail if the object is not equal" do
      expect(v.validate(11)).to eq({ [] => [[:equals, { value: 10 }]] })
    end
  end

  describe "#eql" do
    let(:v) { Vldt::Common.eql(1.0) }

    it "should succeed if the object eqls the value" do
      expect(v.validate(1.0)).to eq nil
    end

    it "should fail if the object does not eql the value" do
      expect(v.validate(1)).to eq({ [] => [[:eqls, { value: 1.0 }]] })
    end
  end

  describe "#identical" do
    let(:value) { "a" }
    let(:v) { Vldt::Common.identical(value) }

    it "should succeed if object and value are idential" do
      expect(v.validate(value)).to eq nil
    end

    it "should fail if object and value are not identical" do
      expect(v.validate(String.new(value))).to eq({ [] => [[:identical, { value: value }]] })
    end
  end

  describe "#is_a" do
    let(:v) { Vldt::Common.is_a(String) }

    it "should succeed if object is of the given class" do
      expect(v.validate("string")).to eq nil
    end

    it "should fail if object is not of the given class" do
      expect(v.validate(1)).to eq({ [] => [[:is_a, { class: String }]] })
    end
  end
end
