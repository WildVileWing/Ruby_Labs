require "rspec"
require_relative "CashMachine"

RSpec.describe CashMachine do

  it '#first_task withdraw' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("W", 40, "Q")
    expect(subject.init)
    expect(File.read("balance.txt")).to eql("60.0")
  end

  it '#first_task deposit' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("D", 40, "Q")
    expect(subject.init)
    expect(File.read("balance.txt")).to eql("100.0")
  end

  it '#first_task balance' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("B", "Q")
    expect(subject.init)
    expect{ subject.balance }.to output("Текущий баланс = 100.0\n").to_stdout
  end
end
