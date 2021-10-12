require 'rspec'
require './main'

RSpec.describe 'Main' do
  it '#First_task first_solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("D", 50, "W", 50, "B", "q")
    expect(First_task.init).to eq("Текущий баланс: #{150}" "Текущий баланс: #{100}" "100")
  end

  it '#First_task second_solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("D", -1, "W", 140, "b", "q")
    expect(First_task.init).to eq("Сумма введена некорректно." "Сумма введена некорректно." "100")
  end
end
