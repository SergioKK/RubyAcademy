require '/home/sergio/RubyAcademy/homework_lecture_2/check_numbers.rb'

RSpec.describe 'check two numbers' do
  describe '#check_numbers' do
    subject { check_numbers(first, second) }

    let(:first) { 1 }
    let(:second) { 2 }

    context 'sums two numbers' do
      it { is_expected.to eq(3) }
    end

    context 'returns first number if second number is 20' do
      let(:second) { 20 }

      it { is_expected.to eq(1) }
    end
    context 'returns second number if first number is 20' do
      let(:first) { 20 }

      it { is_expected.to eq(2) }
    end

    context 'returns Пасхалка if two numbers are 20' do
      let(:first) { 20 }
      let(:second) { 20 }
      it { is_expected.to eq("Пасхалка") }
    end
    context 'returns a clear response if not two numbers was given' do
      let(:first) { "John" }
      it { is_expected.to eq("Неправильный ввод. Введите два числа.") }
    end
  end
end
