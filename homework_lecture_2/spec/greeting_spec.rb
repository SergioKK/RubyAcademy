require 'rspec'
require '/home/sergio/RubyAcademy/homework_lecture_2/greeting.rb'

RSpec.describe "Test greeting with user I/O" do

  describe '#greeting' do

    subject { greeting }

    context "For people younger than 18" do

      let(:result) { /Пожалуйста, введите ваше имя:
Пожалуйста, введите вашу фамилию:
Пожалуйста, введите ваш возраст:
Привет, Адам Сендлер! Тебе меньше 18 лет, но начать учиться программировать никогда не рано!/ }

      it "prints to stdout the message for people younger than 18" do
        allow_any_instance_of(Kernel)
          .to receive(:gets)
                .and_return("Адам", "Сендлер", "11")
        expect { greeting }.to output(result).to_stdout
      end
    end

    context "For people older than 18" do

      let(:result) { /Пожалуйста, введите ваше имя:
Пожалуйста, введите вашу фамилию:
Пожалуйста, введите ваш возраст:
Привет, Марк Цукерберг! Самое время заняться делом!/ }

      it "prints to stdout the message for people younger than 18" do
        allow_any_instance_of(Kernel)
          .to receive(:gets)
                .and_return("Марк", "Цукерберг", "44")
        expect { greeting }.to output(result).to_stdout
      end
    end
  end
end