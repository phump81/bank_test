require 'account'

describe Account do
  it "is an instance of Account" do
    expect(subject).to be_a_kind_of Account
  end

  it "has an initial balance of 0 pounds" do
    expect(subject.instance_variable_get(:@balance)).to eq(0)
  end

  it "allows a deposit to be made" do
    expect(subject).to respond_to(:deposit).with(1).arguments
  end

  it "adds deposit to balance" do
    subject.deposit(1000)
    expect(subject.instance_variable_get(:@balance)).to eq(1000)
  end

  it "allows a withdrawal" do
    expect(subject).to respond_to(:withdraw).with(1).arguments
  end

  it "deducts withdrawal from balance" do
    subject.deposit(1000)
    subject.withdraw(500)
    expect(subject.instance_variable_get(:@balance)).to eql(500)
  end

  it "adds the deposit to the transaction history" do
    subject.deposit(1000)
    expect(subject.instance_variable_get(:@transactions)).to include({"13/07/2020" => 1000})
  end

  it "adds the withdrawal to the transaction history" do
    subject.withdraw(500)
    expect(subject.instance_variable_get(:@transactions)).to include({"13/07/2020" => 500})
  end

end
