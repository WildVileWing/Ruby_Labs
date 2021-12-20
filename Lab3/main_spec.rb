require 'rspec'
require './main'

RSpec.describe 'Main' do
  file_path = 'line.txt'
  before{
    File.write("balance.txt", 100.0)
  }
  it '#index first_solution' do
    expect(index(file_path)).to eq(["AAA", "BBB"])
  end

  it '#find first_solution' do
    expect(find(file_path, 1)).to eq("AAA")
  end

  it '#where first_solution' do
    expect(where(file_path, "A")).to eq(["AAA\n"])
  end

  it '#update first_solution' do
    expect(update(file_path, 1, "CCC")).to eq(nil)
  end

  it '#delete first_solution' do
    expect(delete(file_path, 1)).to eq(nil)
  end

  #second task

  it '#second_task first_solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(30, -1)
    expect(second_task).to eq(nil)#"Андрей Тихолаз 30")
  end

  it '#second_task second_solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(60, -1)
    expect(second_task).to eq(nil)
  end

  #third task

  it '#third_task first_solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(40)
    expect(withdraw).to eq(60)
  end

  it '#third_task second_solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(50)
    expect(deposit).to eq(50)
  end

end
