RSpec.describe SubscribeChallenge::GoodProcessor do
  let(:instance) { described_class.new(good) }
  let(:good) { {:name=>"bottle of perfume", :value=>32.19, :amount=>1, :type=>"general", :imported=>true, :percentage=>4.199999999999999} }


  context "good defined" do
    it { expect(instance.good[:value]).to eq(37.018499999999996)}
    it { expect(instance.good[:percentage]).to eq(4.8285)}
    it { expect(instance.good[:type]).to eq("general")}
    it { expect(instance.good[:name]).to eq("bottle of perfume")}
  end

  context "#basic_sales_tax_exempt?" do
    let(:result) { instance.basic_sales_tax_exempt?(type) }

    describe "and type is book" do
      let(:type) { "book" }

      it { expect(result).to eq(true) }
    end

    describe "and type is food" do
      let(:type) { "food" }

      it { expect(result).to eq(true) }
    end 

    describe "and type is medical" do
      let(:type) { "medical" }

      it { expect(result).to eq(true) }
    end 

    describe "and type is general" do
      let(:type) { "general" }

      it { expect(result).to eq(false) }
    end
  end

  context "#basic_sales_tax" do
    let(:result) { instance.basic_sales_tax(good) }

    it { expect(result).to eq(3.7018499999999994)}
  end  

  context "#import_duty" do
    let(:result) { instance.import_duty(good) }

    it { expect(result).to eq(1.8509249999999997)}
  end  
end
