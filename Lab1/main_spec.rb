require 'rspec'
require './main'

RSpec.describe 'Main' do
  @first_name = 'Andrey'
  @second_name = 'Tiholaz'

  it '#greeting first_solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(@first_name, @second_name, 13)
    expect(greeting).to eq("Приветствую, #{@first_name} #{@second_name}. Тебе пора заняться программированием")
  end

  it '#greeting second_solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(@first_name, @second_name, 30)
    expect(greeting).to eq("Привет, #{@first_name} #{@second_name}. Самое время заняться программированием")
  end

  it '#foobar first_solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(20, 5)
    expect(foobar).to eq('Было введено число 20')
  end

  it '#foobar second_solution' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(10, 15)
    expect(foobar).to eq('Сумма: 25')
  end
end
