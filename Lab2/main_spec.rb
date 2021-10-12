require 'rspec'
require './main'

RSpec.describe 'Main' do
  # @first_word = "tactics";
  # @second_word = "tactic";
  it '#end_with_cs first' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('tactics')
    expect(end_with_cs).to eq(128)
  end
  it '#end_with_cs second' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('tactic')
    expect(end_with_cs).to eq('citcat')
  end
  it '#pokedex first' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(3, 'Azelf', 'Light Blue', 'Unown', 'Dark Gray',
                                                               'Sandile', 'Dark Yellow')
    expect(pokedex).to eq([{ 'Azelf' => 'Light Blue' }, { 'Unown' => 'Dark Gray' }, { 'Sandile' => 'Dark Yellow' }])
  end
end
