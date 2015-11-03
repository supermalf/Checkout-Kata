Given /^I haven't scanned anything yet$/ do
  @checkout = Checkout.new
end

When /^I scan an apple$/ do
  @checkout.scan("Apple")
end

Then /^the subtotal should be (\d+)p$/ do |subtotal|
  expect(@checkout.total).to eq(subtotal.to_i)
end

When /^I scan two apples$/ do
  @checkout.scan("Apple")
  @checkout.scan("Apple")
end

When /^I scan an aspirin$/ do
  @checkout.scan("Aspirin")
end

Then /^the subtotal should be £(\d+)\.(\d+)$/ do |pounds, pence|
  expected_total = pounds.to_i * 100 + pence.to_i
  expect(@checkout.total).to eq(expected_total)
end
