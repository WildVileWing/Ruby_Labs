require 'rspec'
require './main'

RSpec.describe 'Main' do
  #first task
  @file_path = 'line.txt'
  it '#index first_solution' do
    expect(index(@file_path)).to eq('AAA \nBBB')
  end

  it '#find first_solution' do
    expect(find(@file_path, 1)).to eq('AAA')
  end

  it '#where first_solution' do
    expect(where(@file_path, "A")).to eq('AAA')
  end

  it '#update first_solution' do
    expect(update(@file_path, 1, "CCC")).to eq('CCC \nBBB')
  end

  it '#delete first_solution' do
    expect(delete(@file_path, 1), "BBB").to eq(nil)
  end


  #second task

  it '#second_task first_solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(30, -1)
    expect(second_task).to eq("Андрей Тихолаз 30")
  end

  it '#second_task second_solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(60, -1)
    expect(second_task).to eq(nil)
  end

  #third task

  it '#third_task first_solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("d", 40, "w", 40, "b", "q")
    expect(third_task).to eq("Текущий баланс: #{140}" "Текущий баланс: #{100}" "100")
  end

  it '#third_task second_solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("d", 0, "w", 101, "b", "q")
    expect(third_task).to eq("Сумма введена некорректно." "Сумма введена некорректно." "100")
  end





end
