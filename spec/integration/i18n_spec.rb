describe "i18n integration" do
  let(:backend) { Hash.new }

  before :each do
    @old_backend = I18n.backend
    I18n.backend = I18n::Backend::KeyValue.new(backend)
  end

  after :each do
    I18n.backend = @old_backend
  end

  describe "with error params" do
    let(:errors) do
      Vldt::Number.greater_than(5).call(1)
    end

    it "should pass the params for interpolation" do
      backend["en.vldt.errors.greater_than"] = JSON.dump("Greater than %{min}, d00d")

      e = Vldt::I18n.t(errors)

      expect(e[[]].first[:message]).to eq "Greater than 5, d00d"
    end
  end

  describe "with a selector" do
    C = Vldt::Common

    let(:errors) do
      v = C.validate(:tires, C.each(C.validate(:radius, Vldt::Number.positive)))

      v.call({ tires: [{ radius: 20 }, { radius: 0 }] })
    end

    it "should translate the selector into a path" do
      backend["en.tires.radius.positive"] = JSON.dump("Tire radii must be positive")

      e = Vldt::I18n.t(errors)

      expect(e[[:tires, 1, :radius]].first[:message]).to eq "Tire radii must be positive"
    end

    it "should chop stuff off from the beginning to find translations" do
      backend["en.radius.positive"] = JSON.dump("But so do all radii")

      e = Vldt::I18n.t(errors)

      expect(e[[:tires, 1, :radius]].first[:message]).to eq "But so do all radii"
    end

    it "should fallback to the vldt.errors scope" do
      backend["en.vldt.errors.positive"] = JSON.dump("Must be positive")

      e = Vldt::I18n.t(errors)

      expect(e[[:tires, 1, :radius]].first[:message]).to eq "Must be positive"
    end

    it "should put the optional namespace in front" do
      backend["en.the.namespace.positive"] = JSON.dump("Must be positive")

      e = Vldt::I18n.t(errors, namespace: "the.namespace")

      expect(e[[:tires, 1, :radius]].first[:message]).to eq "Must be positive"
    end
  end
end
