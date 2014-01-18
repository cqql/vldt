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
end
