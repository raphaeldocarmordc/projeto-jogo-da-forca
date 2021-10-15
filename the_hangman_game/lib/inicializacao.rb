class Inicializacao

    attr_reader :nome_jogador

    def self.abertura_do_jogo

        File.open(File.expand_path('../../ascii/draw1.txt', __FILE__), 'r') do |arq|
            while line = arq.gets
                puts line
            end
        end

        puts "- Bem-vindo ao meu jogo!"
        sleep 3
        puts "- Se você chegou até aqui, não tem outra saída a não ser jogar comigo!"
        sleep 5
    end

    def self.como_joga
        puts "- É o seguinte: Já que vamos jogar juntos, então eu tenho que te falar algumas coisas..."
        sleep 5
        puts "- Primeiramente, meu nome é Alberto Borteleto, O Esqueleto. E como meu tempo não é de graça, depois eu te mando um boleto."
        sleep 5
        puts "- Minha idade eu nem sei mais, mas não importa, tanto faz. Me fala sobre você..."
        sleep 5
        puts "- Qual o seu nome?"
        @nome_jogador = gets.chomp.upcase
        puts "- A pessoa que te fez não teve dó de você mesmo né? Com essa cara e esse nome você não vai muito longe #{@nome_jogador}"
        sleep 5
        puts "- Não preciso saber mais nada de você. Então vamos às regras do meu jogo:"
        sleep 5
        puts "- Basicamente eu vou pensar numa palavra e você vai ter que adivinhar chutando uma letra por vez..."
        sleep 5
        print "- Você pode errar até 7 vezes. Senão."
        5.times do |i|
            sleep 1
            print "."
        end
        puts " FORRRRRCAAAAA!!!!! HAHAHA"
        sleep 3
        puts "- Por favor, erre as 7 vezes. Eu preciso de um amigo aqui!"
        sleep 3
        puts "- AGORA CHUTA UMA LETRA AI:"
    end
end
