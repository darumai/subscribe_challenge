RSpec.describe Numeric do
  context "10 #percent_of" do
    let(:result) { 10.percent_of(target_number) }

    describe "100" do
      let(:target_number) { 100 }      
  
      it { expect(result).to eq(10) }
    end

    describe "200" do
      let(:target_number) { 200 }

      it { expect(result).to eq(20) }
    end

    describe "1000000007" do
      let(:target_number) { 1000000007 }

      it { expect(result).to eq(100000000.7) }
    end
  end

  context "#round_up" do
    let(:result) { target_number.round_up }

    describe "0.5" do
      let(:target_number) { 0.5 }      
  
      it { expect(result).to eq(0.5) }
    end

    describe "17.734" do
      let(:target_number) { 17.734 }

      it { expect(result).to eq(17.75) }
    end

    describe "256.3457" do
      let(:target_number) { 256.3423 }

      it { expect(result).to eq(256.35) }
    end
  end
end
