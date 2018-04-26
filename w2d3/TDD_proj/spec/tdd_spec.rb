require 'tdd'

describe "#my_uniq" do
  let(:array) { [5, 1, 12, 5, 6, 1, 23, 9] }

  it "removes duplicated entries" do
      expect(array.my_uniq).to eq(array.uniq)
  end
end

describe "#two_sum" do
  let(:array) { [-1, 0, 2, -2, 1] }

  it "returns index positions where elements sum to zero" do
    expect(array.two_sum).to eq([[0, 4], [2, 3]])
  end
end

describe "#my_transpose" do
  let(:array) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}

  it "Transposes a square matrix" do
    expect(array.my_transpose).to eq([
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ])
  end
end
