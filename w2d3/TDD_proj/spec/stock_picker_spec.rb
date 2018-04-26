require "stock_picker"

describe "#stock_picker" do
  let(:prices) { [9,10,8,10,11]}

  it "Returns most profitable days" do
    expect(stock_picker(prices)).to eq([2, 4])
  end
end
