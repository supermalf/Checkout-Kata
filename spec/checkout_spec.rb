require File.dirname(__FILE__) + "/spec_helper"

describe "Checkout" do
  it "should create a new Checkout" do
    expect(Checkout.new).not_to be_nil
  end

  it "should scan an item in the price list" do
    @checkout = Checkout.new
    expect { @checkout.scan("Apple") }.to_not raise_exception
  end

  it "should not scan an item not in the price list" do
    @checkout = Checkout.new
    expect { @checkout.scan("Mango") }.to raise_exception("Item not found: Mango")
  end

  it "should have a running subtotal of 50p for 1 apple" do
    @checkout = Checkout.new
    @checkout.scan("Apple")
    expect(@checkout.total).to eq(50)
  end

  it "should have a running subtotal of £1 for 2 apples" do
    @checkout = Checkout.new
    @checkout.scan("Apple")
    @checkout.scan("Apple")
    expect(@checkout.total).to eq(100)
  end

  it "should have a running subtotal of £1.28 for 2 apples and an aspirin" do
    @checkout = Checkout.new
    @checkout.scan("Apple")
    @checkout.scan("Apple")
    @checkout.scan("Aspirin")
    expect(@checkout.total).to eq(128)
  end
end
