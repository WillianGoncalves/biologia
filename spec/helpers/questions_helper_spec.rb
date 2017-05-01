require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the QuestionsHelper. For example:
#
# describe QuestionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

$var_a = 0
$var_b = 0
RSpec.describe QuestionsHelper, type: :helper do
  lazy_array = []
  eager_array = []

  let(:countA) do
    lazy_array << 1
    $var_a += 1
  end

  let!(:countB) do
    eager_array << 1
    $var_b += 1
  end

  it "example 1" do
    expect(lazy_array).to eq([])
    expect(eager_array).to eq([1])

    expect(countA).to eq(1)
    expect(countB).to eq(1)

    expect(lazy_array).to eq([1])
    expect(eager_array).to eq([1])
  end

  it "example 2" do
    lazy_array << 2
    expect(lazy_array).to eq([1, 2])
    expect(eager_array).to eq([1, 1])

    expect(countA).to eq(2)
    expect(countB).to eq(2)

    expect(lazy_array).to eq([1, 2, 1])
    expect(eager_array).to eq([1, 1])
  end

  it "example 3" do
    expect(lazy_array).to eq([1, 2, 1])
    expect(eager_array).to eq([1, 1, 1])

    expect(countA).to eq(3)
    expect(countB).to eq(3)

    expect(countA).to eq(3)
    expect(countB).to eq(3)

    expect(lazy_array).to eq([1, 2, 1, 1])
    expect(eager_array).to eq([1, 1, 1])
  end

  it "example 4" do
    expect(lazy_array).to eq([1, 2, 1, 1])
    expect(eager_array).to eq([1, 1, 1, 1])
  end
end
