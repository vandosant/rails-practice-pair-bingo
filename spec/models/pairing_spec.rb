describe Pairing do
  it "is invalid without a pair date" do
    pairing = Pairing.new(:pair_date => nil)
    expect(pairing).to_not be_valid
    expect(pairing).to have(1).error_on :pair_date
  end

  it "is valid with a pair date" do
    pairing = Pairing.new(:pair_date => 1.day.ago)
    expect(pairing).to be_valid
    expect(pairing).to have(0).errors_on :pair_date
  end

  it "is invalid with a date in the future" do
    pairing = Pairing.new(:pair_date => 1.day.from_now)
    expect(pairing).to_not be_valid
    expect(pairing).to have(1).errors_on :pair_date
  end

end